<?php
/**
 * 数据模型：广告
 */
namespace Common\Model;
class RealAwardModel extends BaseModel {	
	
    //默认排序字段
	protected  $sortOrder = 'id desc'; 
    
	//数据验证
	protected $_validate = array(
		//插入
		array('userId','require','用户ID不能为空',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		array('itemId','require','奖品ID不能为空',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		array('num','require','奖品数量不能为空',self::MUST_VALIDATE,'',self::MODEL_INSERT),
        array('info','require','备注不能为空',self::MUST_VALIDATE,'',self::MODEL_INSERT),
	);
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),			
	);
    
	/**
	 * 初始化条件
	 */
	protected function initWhere($condition){
		if(!is_empty_null($condition['id'])) $where['id'] = $condition['id'];
		if(!empty($condition['userId'])) $where['userId'] = $condition['userId'];
		if(!empty($condition['roleId'])) $where['roleId'] = $condition['roleId'];
        if(!empty($condition['itemId'])) $where['itemId'] = $condition['itemId'];
		return $where;
	}
	
}