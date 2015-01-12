<?php
/**
 * 数据模型：积分规则
 * author wzh
 */
namespace Common\Model;
class CreditRuleModel extends BaseModel {	
	
	
	
	//数据验证
	protected $_validate = array(
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
		array('title','require','title不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),	
		array('key','require','key不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),	
		array('num','require','num不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),	
	);
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),
	);
	
	//默认排序字段
	protected  $sortOrder = 'id asc';
	
	
}