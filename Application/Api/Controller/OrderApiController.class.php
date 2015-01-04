<?php

/**
 * 订购接口
 * @author CGY
 */

namespace Api\Controller; 

class OrderApiController extends BaseApiController{
	
	/**
	 * 根据知识点id查找该知识点下的课时列表
	 * @param int $userId	知识点id数组
	 * @param int $roleId	页号
	 * @param int $courseId	每页记录数
	 */
	public function orderCourse($userId, $roleId, $courseId){
		//TODO 调用接口
		
		//接口返回成功状态，则保存用户订购的课程
		$data = D('MyCourse','Logic')->save($userId, $roleId, $courseId);
		return $data;
	}
	
}