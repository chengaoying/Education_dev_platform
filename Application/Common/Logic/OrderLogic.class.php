<?php
/**
 * 逻辑处理类：订购
 * @author CGY
 *
 */
namespace Common\Logic;
class OrderLogic extends BaseLogic {
	
	public function __construct() {
		
	}
	
	/**
	 * 产品鉴权接口
	 * @param int $userId
	 */
	public function auth($userId){
		//TODO 调接口
		
		
		//把接口返回状态更新到用户表中
		$user['userId']   = $userId;
		$user['userType'] = $type;
		D('User')->saveData($user);
	}
	
	/**
	 * 订购课程
	 * @param int $userId	用户id
	 * @param int $roleId	角色id
	 * @param int $courseId	课程id
	 */
	public function orderCourse($userId, $roleId, $courseId){
		//TODO 调用接口
	
		//接口返回成功状态，则保存用户订购的课程
		$course = D('Course')->find($courseId);
		$roleCourse['userId']	= $userId;
		$roleCourse['roleId']	= $roleId;
		$roleCourse['courseId']	= $courseId;
		$roleCourse['courseName'] = $course['name'];
		$roleCourse['courseImg']  = $course['imgUrl'];	
		$data = D('RoleCourse')->saveData($roleCourse);
		return $data;
	}
	
}