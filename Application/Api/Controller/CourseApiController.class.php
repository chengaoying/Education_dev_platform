<?php

/**
 * 课程接口
 * @author CGY
 */

namespace Api\Controller; 

class CourseApiController extends BaseApiController{
	
	/**
	 * 查询角色购买的课程列表
	 * @param string $roleId 角色id
	 * @param int $offset  起始位置
	 * @param int $length  长度
	 */
	public function queryRoleCourseList($roleId, $offset, $length){
		
	}
	
	public function queryRecommendCourseList(){}
}