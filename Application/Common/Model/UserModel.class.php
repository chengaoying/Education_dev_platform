<?php
/**
 * 数据模型：用户信息
 */
namespace Common\Model;
class UserModel extends BaseModel {	
	
	
	
	//数据验证
	protected $_validate = array(
		//插入
		array('OpUserId','require','用户ID不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),	
		array('OpUserId','','用户ID已存在！',self::EXISTS_VALIDATE,'unique',self::MODEL_INSERT),
	);
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),
	);
	
	//默认排序字段
	protected  $sortOrder = 'id desc';
	
	//---------------扩展CRUD-----------------------
	
	
	/**
	 * 重写像类initWhere
	 * @see Common\Model.BaseModel::initWhere()
	 */
	protected function initWhere($condition){
		if(!is_empty_null($condition['OpUserId'])) $where['OpUserId'] = $condition['OpUserId'];
		if(!empty($condition['OpUserToken'])) $where['OpUserToken'] = $condition['OpUserToken'];
		if(!empty($condition['OpUserName'])) $where['OpUserName'] = $condition['OpUserName'];
		return $where;
	}
	
	/**
	 * 删除数据(如果某模型不想有删除方法，可在子类中重写)
	 * @param unknown_type $id
	 */
	public function delData($id){
		//用户表不允许删除		
	}
    
    /**
	 * 增加或减少某项值
	 * @param int $userId
	 * @param array $data
	 */
	public function setIncOrDec($userId,$data){		
		$rows = $this->where(array('id'=>$userId))->setField($this->getIncOrDecData($data));
		return result_data(1,'数据更新成功！',array('rows'=>$rows));
	}
	
}