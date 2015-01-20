<?php

/**
 * 逻辑处理类：活动基类
*/
namespace Common\Logic;
class ActBaseLogic  extends BaseLogic{
	
	protected $aId = 0;		//活动ID
	protected $act = null; //活动信息
	protected $awardPack = null; //奖项
	
	/**
	 * 初始化活动相关信息
	 * @param unknown_type $proId
	 * @param unknown_type $aId
	 */
	public function setActivity($aId){
		$this->aId = $aId;
		$this->act = get_array_val(get_cache('Activity'),$aId);
		$this->awardPack = get_cache('AwardPack');
		foreach($this->awardPack as $key=>$val){
			$this->awardPack[$key]['items'] = unserialize($val['items']);
		}
		return $this;
	}
	
	/**
	 * 检查活动状态
	 */
	public function checkStatus(){
		if(!$this->act) return result_data(0,'活动不存在！');
		if(!$this->act['status']) return result_data(0,'活动还未开启！');
		if(NOW_TIME<strtotime($this->act['beginTime'])) return result_data(0,'活动未开始！');
		if(NOW_TIME>strtotime($this->act['endTime'])) return result_data(0,'活动已结束！');
		return true;	
	}
	
    /*
     * 创建活动表
     * $aId 活动ID
     */
    public function createActTable($aId) {
        if(!$aId) return result_data (0, '活动不存在！');
        //参与表
        $table = C('DB_PREFIX').'act_actor_'.$aId;
        $sql = "CREATE TABLE IF NOT EXISTS `".$table."` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `userId` int(11) NOT NULL COMMENT '用户ID',
                `roleId` int(11) NOT NULL COMMENT '角色ID',
                `num1` int(11) DEFAULT NULL COMMENT '扩展数字',
                `num2` int(11) DEFAULT NULL COMMENT '扩展数字',
                `str1` varchar(100) DEFAULT NULL COMMENT '扩展字符',
                `str2` varchar(100) DEFAULT NULL COMMENT '扩展字符',
                `addTime` datetime NOT NULL COMMENT '参与时间',
                PRIMARY KEY (`id`)
              ) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='活动－参与者（按活动ID划分）';";
        $result = D('ActActor')->execute($sql,true);
        if($result != 0){
            return result_data(0, '创建表'.$table.'失败！');
        }
        //获奖表
        $table2 = C('DB_PREFIX').'act_winner_'.$aId;
        $sql2 = "CREATE TABLE IF NOT EXISTS `".$table2."` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `userId` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
                `roleId` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID',
                `packId` int(11) NOT NULL DEFAULT '0' COMMENT '奖项ID',
                `isSend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发状（0-未发,1-虚拟已发,2-全部已发）',
                `autoInfo` varchar(500) DEFAULT NULL COMMENT '自动发奖备注',
                `info` varchar(500) DEFAULT NULL COMMENT '备注',
                `addTime` datetime NOT NULL COMMENT '添加时间',
                `modTime` datetime NOT NULL COMMENT '修改时间',
                PRIMARY KEY (`id`),
                KEY `userId` (`userId`),
                KEY `roleId` (`roleId`),
                KEY `packId` (`packId`)
              ) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='获奖名单（按活动ID划分）';";
        $result = D('ActWinner')->execute($sql2,true);
        if($result != 0){
            return result_data(0, '创建表'.$table2.'失败！');
        }
        return result_data(1, '表'.$table.'和'.$table2.'创建成功！');
    }
    
    /*
     * 删除活动表
     * $aId 活动ID
     */
    public function delActTable($aId) {
        if(!$aId) return result_data (0, '活动不存在！');
        //参与表
        $table = C('DB_PREFIX').'act_actor_'.$aId;
        $sql = "DROP TABLE IF EXISTS `".$table."`;";
        $result = D('ActActor')->execute($sql,true);
        if($result != 0){
            return result_data(0, '删除表'.$table.'失败！');
        }
        //获奖表
        $table2 = C('DB_PREFIX').'act_winner_'.$aId;
        $sql2 = "DROP TABLE IF EXISTS `".$table2."`;";
        $result = D('ActWinner')->execute($sql2,true);
        if($result != 0){
            return result_data(0, '删除表'.$table2.'失败！');
        }
        return result_data(1, '表'.$table.'和'.$table2.'删除成功！');
    }
	
	/**
	 * 发奖
	 * @param int $id 中奖名单ID
	 */
	public function send($id){
		if(!$id) return result_data(0,'中奖记录不存在！');
		//判断中奖记录
		$ActWinner =D('ActWinner')->setActivity($this->aId); 
		$winner = $ActWinner->find($id);
		if(!$winner) return result_data(0,'中奖记录不存在！');
		//判断是否已发放
		if($winner['isSend']) return result_data(0,'该中奖记录已发放奖品，不能重复发奖！');
		//奖项
		$pack = $this->awardPack[$winner['packId']]; 
		if(!$pack) return result_data(0,'中奖奖项不存在！');
		//读出奖品
		$items = get_cache('AwardItem');	
		$result = $ActWinner->where(array('id'=>$id))->setInc('isSend');
		if($result){
			//发奖
			foreach($pack['items'] as $key=>$val){
				$item = $items[$key];
				if($item['aType']==1){//积分体系统
                    $creditData = get_array_val(get_cache('Credit'), $item['creditId']);
					$result = D('Credit','Logic')->incOrDec($winner['userId'],$winner['roleId'],array($creditData['keyName']=>$val),'参与活动['.$this->act['title'].']中了['.$pack['name'].']');
					$info .= DATE_TIME.' 积分体系奖品：'.$item['name'].'（数量：'.$val.'）'.($result['status']?'发放成功！':'发放失败（'.$result['info'].'）')."\r\n";
				}elseif($item['aType']==2){//虚拟道具
					$realInfo = DATE_TIME.'获得道具奖品：'.$item['name'].'（数量：'.$val.'）'.'参与活动['.$this->act['title'].']中了['.$pack['name'].']';
                    $info .= $realInfo;
                    $result = D('UserAward')->saveData(array('userId'=>$winner['userId'],'roleId'=>$winner['roleId'],'itemId'=>$item['id'],'num'=>$val,'type'=>1,'info'=>$realInfo));
				}else{ //记录实物奖品
                    $realInfo = DATE_TIME.'获得实物奖品：'.$item['name'].'（数量：'.$val.'）'.'参与活动['.$this->act['title'].']中了['.$pack['name'].']';
                    $result = D('UserAward')->saveData(array('userId'=>$winner['userId'],'roleId'=>$winner['roleId'],'itemId'=>$item['id'],'num'=>$val,'type'=>2,'info'=>$realInfo));
                }
			}		
			//更新中奖名单记录
			$result = $ActWinner->where(array('id'=>$id))->setField(array('autoInfo'=>$info));
		}
		return result_data(1,'发放完成');
	}
	
}