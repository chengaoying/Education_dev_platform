<?php
/**
 * 逻辑处理类：角色加入学习计划的课程
 * @author CGY
 *
 */
namespace Common\Logic;
class RoleCourseLogic extends BaseLogic {
	
	/**
	 * 加入学习计划
	 * @param int $roleId
	 * @param int $courseId
	 */
	public function addCourse($roleId,$courseId,$courseName,$courseImg){
		$roleCourse['roleId']	= $roleId;
		$roleCourse['courseId']	= $courseId;
		$roleCourse['courseName'] = $courseName;
		$roleCourse['courseImg']  = $courseImg;	
		$data = D('RoleCourse')->saveData($roleCourse);
		return $data;
	}
	
	/**
	 * 查询角色加入学习计划的单个课程
	 * @param int $roleId	角色id
	 * @param int $courseId 课程id
	 * @param int $pageNo 	页号
	 * @param int $pageSize 每页记录数
	 */
	public function queryRoleCourseByCourseId($roleId, $courseId, $pageNo, $pageSize){
		$param['where']['roleId'] = $roleId;
		$param['where']['courseId'] = $courseId;
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
		
		$data = D('RoleCourse')->selectOne($param);
		return $data;
	}
	
	/**
	 * 查询角色加入学习计划的课程列表
	 * @param int $roleId	角色id
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function queryRoleCourseList($roleId, $pageNo, $pageSize){
		$param['where']['roleId'] = $roleId;
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
		
		$data = D('RoleCourse')->selectPage($param);
		return $data;
	}
	
}