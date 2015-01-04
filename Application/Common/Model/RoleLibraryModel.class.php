<?php
/**
 * 数据模型：题库
 * @author CGY
 *
 */
namespace Common\Model;
class RoleLibraryModel extends BaseModel {	
	
	//数据验证
	protected $_validate = array(
	);
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),			
	);
	
}