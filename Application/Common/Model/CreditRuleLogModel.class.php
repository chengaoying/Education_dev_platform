<?php
/**
 * 数据模型：积分规则日志
 */
namespace Common\Model;
class CreditRuleLogModel extends BaseModel {
	
	//数据验证
	protected $_validate = array(
        array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
		//插入
		array('userId','require','用户Id不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		array('ruleId','require','规则ID不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
        
	);
	
	//自动填充
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),
        array('modTime',DATE_TIME,self::MODEL_BOTH),
	);
		
}