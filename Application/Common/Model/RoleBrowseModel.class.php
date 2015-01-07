<?php
/**
 * 数据模型浏览记录
 * @author WZH
 *
 */
namespace Common\Model;
class RoleBrowseModel extends BaseModel {	
	
	//数据验证
	protected $_validate = array(
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
		array('roleId','require','角色id不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		array('title','require','title不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		array('url','require','url不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		//array('sectionIds','require','课时ID列表不能为空！',self::MUST_VALIDATE,''),
	);
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),			
	);

	//---------------扩展CRUD-----------------------
}