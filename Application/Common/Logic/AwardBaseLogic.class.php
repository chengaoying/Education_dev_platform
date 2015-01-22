<?php

/**
 * 逻辑处理类：奖品和奖项
 *
 */

namespace Common\Logic;

class AwardBaseLogic extends BaseLogic {
	
    /**
     * 将数据库保存的奖品序列化转换为具体奖品名称
     * @param string $awardStr 奖品序列化字符串
     * @return string $awardRealStr 返回奖品名称和数量字符串
     */
    public function showAwardName($awardStr) {
        if (empty($awardStr))
            return result_data(0, '奖项不存在');
        $awardArr = unserialize($awardStr);
        $items = get_cache('AwardItem');
        $awardRealStr = '';
        foreach ($awardArr as $key => $value) {
            $item = $items[$key];
            if ($item['aType'] == 2) {//虚拟道具
                $awardRealStr .= ' 【道具奖品：' . $item['name'] . ' &nbsp;数量：' . $value . '】' . "\r\n";
            } else if ($item['aType'] == 0) {
                $awardRealStr .= ' 【实物奖品：' . $item['name'] . ' &nbsp;数量：' . $value . '】' . "\r\n";
            } else if ($item['aType'] == 1) {
                $awardRealStr .= ' 【积分体系奖品：' . $item['name'] . ' &nbsp;数量：' . $value . '】' . "\r\n";
            }
        }
        return $awardRealStr;
    }
    
    /**
     * 发奖品
     * @param int $userId 用户ID
     * @param int $roleId 角色ID
     * @param int $itemId 奖品ID
     * @param int $num 数量
     * @param string $info 描述
     */
    public function sendItem($userId,$roleId,$itemId,$num,$info) {
        if(!$userId) return result_data(0,'用户ID不能为空！');
        if(!$itemId) return result_data(0,'奖品ID不能为空！');
        $awardItems = get_cache('AwardItem');
        $item = $awardItems[$itemId];
        if($item['aType']==1){//积分体系统
            $creditData = get_array_val(get_cache('Credit'), $item['creditId']);
            $result = D('Credit','Logic')->incOrDec($userId,$roleId,array($creditData['keyName']=>$num),$info);
        }else{//实物和虚拟道具
            if($item['aType'] == 2){ //道具
                $type = 1;
            }else{  //实物
                $type = 2;
            }
            $result = D('UserAward')->saveData(array('userId'=>$userId,'roleId'=>$roleId,'itemId'=>$itemId,'num'=>$num,'type'=>$type,'info'=>$info));
        }
        return $result;
    }
    
    /**
     * 发奖项
     * @param int $userId 用户ID
     * @param int $roleId 角色ID
     * @param int $packId 奖项ID
     * @param string $info 描述
     */
    public function sendPack($userId,$roleId,$packId,$info='') {
        if(!$userId) return result_data(0,'用户ID不能为空！');
        if(!$packId) return result_data(0,'奖项ID不能为空！');
        $awardPack = get_cache('AwardPack');
        $items = get_cache('AwardItem');	
        $realPack = $awardPack[$packId];
        $realPack['items'] = unserialize($realPack['items']);
        foreach($realPack['items'] as $key=>$val){
            $item = $items[$key];
            if($item['aType']==1){//积分体系统
                $creditData = get_array_val(get_cache('Credit'), $item['creditId']);
                $result = D('Credit','Logic')->incOrDec($userId,$roleId,array($creditData['keyName']=>$val),$info);
            }else{ //记录实物奖品和道具
                if($item['aType'] == 2){ //道具
                    $type = 1;
                }else{  //实物
                    $type = 2;
                }
                $result = D('UserAward')->saveData(array('userId'=>$userId,'roleId'=>$roleId,'itemId'=>$item['id'],'num'=>$val,'type'=>$type,'info'=>$info.$item['name']));
            }
        }
        return $result;
    }
    
    /**
     * 获取奖品信息
     * @param int $awardId 奖品id
     * @return $data
     */
    public function getAwardInfo($awardId){
    	if(!$awardId){
    		return result_data(0,'奖品ID不能为空！');
    	}else{
    		$items = get_cache('AwardItem');
    		return result_data(1,'',$items[$awardId]);
    	}
    }

}
