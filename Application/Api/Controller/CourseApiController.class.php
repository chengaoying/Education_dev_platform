<?php

/**
 * 课程接口
 * @author CGY
 */

namespace Api\Controller; 

class CourseApiController extends BaseApiController{
	
	/**
	 * 查询用户订购的单个课程
	 * @param int $userId	用户id
	 * @param int $courseId 课程id
	 * @param int $pageNo 	页号
	 * @param int $pageSize 每页记录数
	 */
	public function queryUserCourseByCourseId($userId, $courseId, $pageNo, $pageSize){
		$data = D('Course','Logic')->queryUserCourseByCourseId($userId, $courseId, $pageNo, $pageSize);
		return $data;
	}
	
	/**
	 * 查询用户订购的课程列表
	 * @param int $roleId	角色id
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function queryRoleCourseList($roleId, $pageNo, $pageSize){
		$data = D('Course','Logic')->queryRoleCourseList($roleId, $pageNo, $pageSize);
		return $data;
	}
	
	/**
	 * 通过关键字查询课程列表
	 * @param int $stageId	龄段id
	 * @param array $keys	关键字id
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function queryCourseListByKeys($stageId, $keys, $pageNo, $pageSize){
		$data = D('Course','Logic')->queryCourseListByKeys($stageId, $keys, $pageNo, $pageSize);
		return $data;
	}
	
	/**
	 * 通过顶级分类（二级栏目）查询课程列表
	 * @param int $chId		分类（栏目）id
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function queryCourseListByChId($chId, $pageNo, $pageSize){
		$data = D('Course','Logic')->queryCourseListByChId($chId, $pageNo, $pageSize);
		return $data;
	}
	
	/**
	 * 通过课程id查找单个课程
	 * @param int $courseId
	 */
	public function queryCourseById($courseId){
		$data = D('Course','Logic')->queryCourseById($courseId);
		return $data;
	}
	
	/**
	 * 通过课程类型查询课程列表
	 * @param unknown_type $stageId 龄段id
	 * @param unknown_type $type 课程类型
	 * @param unknown_type $pageNo 页号
	 * @param unknown_type $pageSize 每页记录数
	 */
	public function queryCourseListByType($stageId, $type, $pageNo, $pageSize){
		$data = D('Course','Logic')->queryCourseListByType($stageId, $type, $pageNo, $pageSize);
		return $data;
	}
}