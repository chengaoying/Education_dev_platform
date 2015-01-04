<?php
/**
 * 数据模型：用户订购的课程表
 * @author CGY
 *
 */
namespace Common\Model;
class RoleCourseModel extends BaseModel {	
	
	//数据验证
	protected $_validate = array(
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
		array('userId','require','用户id不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		array('courseId','require','课程id不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
	);
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),			
	);

	//---------------扩展CRUD-----------------------
}