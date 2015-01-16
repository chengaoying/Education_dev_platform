<?php
/**
 * 数据模型：活动－获奖名单
 */
namespace Common\Model;
class ActWinnerModel extends BaseModel {	

	protected $aId;
    //字段映射
	protected $fields = array(
			'id', 'userId', 'roleId', 'packId','isSend','autoInfo','info','addTime','modTime', '_pk' => 'id', '_autoinc' => true
	);
	//数据验证
	protected $_validate = array(
		//插入		
		array('userId','require','用户ID不能为空',self::MUST_VALIDATE,'',self::MODEL_INSERT),
        array('packId','require','奖项ID不能为空',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		//更新
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),		
		//全部
	);
		
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),	
        array('modTime',DATE_TIME,self::MODEL_BOTH),
	);

		
	/**
	 * 设置产品用户表
	 */
	public function setActivity($aId){
		$this->setTableName(C('DB_PREFIX').'act_winner_'.$aId);
		$this->aId = $aId;
		return $this;
	}
	
	
	//---------------扩展CRUD-----------------------
		
	/**
	 * 重写像类initWhere
	 * @see Common\Model.BaseModel::initWhere()
	 */
	protected function initWhere($condition){
		if(!is_empty_null($condition['id'])) $where['id'] = $condition['id'];
		if(!is_empty_null($condition['userId'])) $where['userId'] = $condition['userId'];
        if(!is_empty_null($condition['roleId'])) $where['roleId'] = $condition['roleId'];
		if(!is_empty_null($condition['packId'])) $where['packId'] = $condition['packId'];
		if(!is_empty_null($condition['isSend'])) $where['isSend'] = $condition['isSend'];
		if(!empty($condition['addTime'])) $where['addTime'] = $condition['addTime'];
		return $where;
	}
	
	/**
	 * 删除数据
	 * @param int|array $id
	 */
	public function delData($id){
		if(!$id) return result_data(0,'没有数据被删除！');
		if(is_array($id)) $id = $id[0];
		$winner = $this->find($id);echo $this->getLastSql();
		if($winner['isSend']>0) return result_data(0,'该中奖记录已经发奖，不允许删除！');
		$num = $this->delete($id);
		if($num===false){
			return result_data(0,'数据删除失败：'.$this->getError(),$num);
		}else{
			return result_data(1,'数据记录('.$num.'条)删除成功！',$num);
		}
	}
	
}