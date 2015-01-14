<?php
/**
 * 数据模型：积分控制
 * author wzh
 */
namespace Common\Model;
class CreditModel extends BaseModel {	
	
	
	
	//数据验证
	protected $_validate = array(
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
		array('roleId','require','roleId不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),	
		array('key','require','key不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),	
		array('continueCnt','require','continueCnt不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),	
	);
	
	//自动填充	
	protected $_auto = array(
		array('lastTime',DATE_TIME,self::MODEL_BOTH),
	);
	
	//默认排序字段
	protected  $sortOrder = 'id asc';
	
	
}