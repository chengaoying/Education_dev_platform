<?php

/**
 * 课程接口
 * @author CGY
 */

namespace Api\Controller; 

class CourseApiController extends BaseApiController{
	
	/**
	 * 查询角色的课程列表
	 * @param int $roleId	角色id
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function queryRoleCourseList($roleId, $pageNo, $length){
		$data = D('Course','Logic')->queryRoleCourseList($roleId, $pageNo, $length);
		return $data;
	}
	
	/**
	 * 通过关键字查询课程列表
	 * @param int $stageId	龄段id
	 * @param int $keys		关键字id
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
}