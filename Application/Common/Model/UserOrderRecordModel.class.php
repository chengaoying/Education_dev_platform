<?php
/**
 * 数据模型：用户订购记录模型
 * @author CGY
 *
 */
namespace Common\Model;
class UserOrderRecordModel extends BaseModel {	
	
	//数据验证
	protected $_validate = array(
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
	);
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),			
	);

}