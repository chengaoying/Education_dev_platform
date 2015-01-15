<?php
/**
 * 数据模型：积分日志
 */
namespace Common\Model;
class CreditLogModel extends BaseModel {
	
	
	//数据验证
	protected $_validate = array(
		//插入
		array('userId','require','用户Id不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
        array('ruleId','require','积分规则ID不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		array('ruleName','require','规则标题不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
        array('creditNum','require','积分数量不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
        array('type','require','积分规则类型不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
	);
	
	//自动填充
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),
	);
    
    /**
	 * 重写像类initWhere
	 * @see Common\Model.BaseModel::initWhere()
	 */
	protected function initWhere($condition){
		if(!empty($condition['userId'])) $where['userId'] = $condition['userId'];
        if(!empty($condition['roleId'])) $where['roleId'] = $condition['roleId'];
        if(!empty($condition['ruleId'])) $where['ruleId'] = $condition['ruleId'];
		return $where;
	}
		
}