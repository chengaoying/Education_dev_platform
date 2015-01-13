<?php
/**
 * 数据模型：角色加入学习计划的课程
 * @author CGY
 *
 */
namespace Common\Model;
class RoleCourseModel extends BaseModel {	
	
	//数据验证
	protected $_validate = array(
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
		array('roleId','require','角色id不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		array('courseId','require','课程id不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		array('roleId,courseId','','本课程已加入学习计划！',self::MUST_VALIDATE,'unique'),
	);
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),			
	);

	//---------------扩展CRUD-----------------------
}