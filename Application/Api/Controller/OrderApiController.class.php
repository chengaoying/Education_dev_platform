<?php

/**
 * 订购/鉴权接口
 * @author CGY
 */

namespace Api\Controller; 

class OrderApiController extends BaseApiController{
	
	
	/**
	 * 产品鉴权
	 * @param $userId 用户id
	 * @return array 鉴权返回，格式：array(鉴权状态，描述信息，array('userType'=>鉴权值))
	 */
	public function auth($userId){
		return D('Order','Logic')->auth($userId);
	}
	
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