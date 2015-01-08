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
	 * 查询用户购买的课程列表
	 * @param int $userId	用户id
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function queryUserCourseList($userId, $pageNo, $pageSize){
		$data = D('Course','Logic')->queryUserCourseList($userId, $pageNo, $pageSize);
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
	 * 推荐课程查询:(有帐号的课程推荐):
	 * 早教：关键字（特别推荐一/特别推荐二）,角色月龄对应的课程
	 * 幼教：关键字（特别推荐一/特别推荐二）,当前周数对应的课程
	 * 小学以上：关键字（特别推荐一/特别推荐二），
	 * @param int $stageId	龄段id
	 * @param array $param  查询参数	格式：array('key'=>'月龄/周'),(推荐课程的关键字=>课程的月龄（早教）/课程的周数（幼教）)
	 */
	public function queryRecommendCourse($stageId, $keys){
		$data = D('Course','Logic')->queryRecommendCourse($stageId, $keys);
		return $data;
	}
	
	/**
	 * 推荐课程查询:(游客的课程推荐):
	 * @param array $keys  关键字数组，格式：array(k1,k2,k3).k1为特别推荐一，k2为特别推荐二，k3为一般推荐
	 */
	public function queryRandomRecommendCourse($keys){
		$data = D('Course','Logic')->queryRandomRecommendCourse($keys);
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