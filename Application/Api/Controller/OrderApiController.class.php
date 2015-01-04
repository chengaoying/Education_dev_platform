<?php

/**
 * 订购接口
 * @author CGY
 */

namespace Api\Controller; 

class OrderApiController extends BaseApiController{
	
	/**
	 * 订购课程
	 * @param int $userId	用户id
	 * @param int $roleId	角色id
	 * @param int $courseId	课程id
	 */
	public function orderCourse($userId, $roleId, $courseId){
		return D('Order','Logic')->orderCourse($userId, $roleId, $courseId);
	}
	
}