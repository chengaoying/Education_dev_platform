<?php

/**
 * 角色加入学习计划的课程接口
 * @author CGY
 */

namespace Api\Controller; 

class RoleCourseApiController extends BaseApiController{
	
	/**
	 * 加入学习计划
	 * @param int $roleId  角色id
	 * @param int $courseId 课程id
	 * @param string $courseName 课程名
	 * @param string $courseImg 课程图片地址
	 */
	public function addCourse($roleId,$courseId,$courseName,$courseImg){
		$data = D('RoleCourse','Logic')->addCourse($roleId,$courseId,$courseName,$courseImg);
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
		$data = D('RoleCourse','Logic')->queryRoleCourseByCourseId($roleId, $courseId, $pageNo, $pageSize);
		return $data;
	}
	
	/**
	 * 查询角色加入学习计划的课程列表
	 * @param int $roleId	用户id
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function queryRoleCourseList($roleId, $pageNo, $pageSize){
		$data = D('RoleCourse','Logic')->queryRoleCourseList($roleId, $pageNo, $pageSize);
		return $data;
	}
}