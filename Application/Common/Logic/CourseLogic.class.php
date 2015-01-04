<?php
/**
 * 逻辑处理类：课程
 * @author CGY
 *
 */
namespace Common\Logic;
class CourseLogic extends BaseLogic {
	
	
	/**
	 * 查询用户订购的单个课程
	 * @param int $roleId	角色id
	 * @param int $courseId 课程id
	 * @param int $pageNo 	页号
	 * @param int $pageSize 每页记录数
	 */
	public function queryUserCourseByCourseId($userId, $courseId, $pageNo, $pageSize){
		
	}
	
	/**
	 * 查询角色的课程列表
	 * @param int $roleId	角色id
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function queryRoleCourseList($roleId, $pageNo, $pageSize){
		
	}
	
	/**
	 * 通过关键字查询课程列表
	 * @param int $stageId	龄段id
	 * @param int $keys		关键字id
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function queryCourseListByKeys($stageId, $keys, $pageNo, $pageSize){
		$param['where']['stageIds'] = $stageId;
		$param['where']['keys']    	= $keys;
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
		$param['sortOrder'] = 'sort asc';
		
		$data = D('Course')->selectPage($param);
		return $data;
	}
	
	/**
	 * 通过顶级分类（二级栏目）查询课程列表
	 * @param int $chId		分类（栏目）id
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function queryCourseListByChId($chId, $pageNo, $pageSize){
		$param['where']['chId']  = $chId;
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
		$param['sortOrder'] = 'sort asc';
	
		$data = D('Course')->selectPage($param);
		return $data;
	}
	
	/**
	 * 通过课程id查找单个课程
	 * @param int $courseId
	 */
	public function queryCourseById($courseId){
		$data = D('Course')->find($courseId);
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
		$param['where']['stageIds']  = $stageId;
		$param['where']['typeId']    = $type;
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
		$param['sortOrder'] = 'sort asc';
	
		$data = D('Course')->selectPage($param);
		return $data;
	}
	
}