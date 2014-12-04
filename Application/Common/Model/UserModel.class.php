<?php
/**
 * 数据模型：专题
 */
namespace Common\Model;
class UserModel extends BaseModel {	
	
	
	
		//数据验证
	protected $_validate = array(
		//插入
		array('opUserId','require','运营商的用户ID不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),	
		array('nickName','require','用户昵称不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),	
		//更新
		//array('opUserId','require','运营商的用户ID不能为空！',self::EXISTS_VALIDATE,'',self::MODEL_UPDATE),
		//全部			
		array('opUserId','','运营商的用户ID已存在！',self::EXISTS_VALIDATE,'unique'),
	);
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),
	);
	
	//默认排序字段
	protected  $sortOrder = 'userId desc';
	
	//---------------扩展CRUD-----------------------
	
	
	/**
	 * 重写像类initWhere
	 * @see Common\Model.BaseModel::initWhere()
	 */
	protected function initWhere($condition){
		if(!is_empty_null($condition['userId'])) $where['userId'] = $condition['userId'];
		if(!empty($condition['opUserId'])) $where['opUserId'] = $condition['opUserId'];
		if(!empty($condition['opUserName'])) $where['opUserName'] = $condition['opUserName'];
		if(!empty($condition['phone'])) $where['phone'] = $condition['phone'];
// 		if(!empty($condition['email'])) $where['email'] = $condition['email'];
// 		if(!empty($condition['address'])) $where['address'] = $condition['address'];
        if(!is_empty_null($condition['addTime']) && is_empty_null($condition['addTime2'])) $where['addTime'] = $condition['addTime'];
        if(is_empty_null($condition['addTime']) && !is_empty_null($condition['addTime2'])) $where['addTime'] = $condition['addTime2'];
        if(!is_empty_null($condition['addTime']) && !is_empty_null($condition['addTime2'])) $where['addTime'] = array($condition['addTime'],$condition['addTime2'],'and');
		return $where;
	}
	
		
	
	/**
	 * 保存数据
	 * @param array $data
	 */
	public function saveData($data){
		if($this->create($data)){
			if(!$data['userId']){
				$userId = $this->add();
				$result = result_data(1,'数据添加成功！',array('userId'=>$userId));
			}else{
				$rows = $this->save();
				$result = result_data(1,'数据更新成功！',array('rows'=>$rows));
			}
			return $result;
		}else{
			return result_data(0,$this->getError());
		}
	}
	
		
	
	/**
	 * 增加或减少某项值
	 * @param int $userId
	 * @param array $data
	 */
	public function SetIncOrDec($userId,$data){		
		$rows = $this->where(array('userId'=>$userId))->setField($this->getIncOrDecData($data));
		return result_data(1,'数据更新成功！',array('rows'=>$rows));
	}
	
	/**
	 * 删除数据(如果某模型不想有删除方法，可在子类中重写)
	 * @param unknown_type $id
	 */
	public function delData($id){
		//用户表不允许删除		
	}
	
}