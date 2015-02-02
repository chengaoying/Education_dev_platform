<?php

/**
 * 订购/鉴权接口
 * @author CGY
 */

namespace Api\Controller; 

class OrderApiController extends BaseApiController{
	
	
	/**
	 * 产品鉴权
	 * @param int $userId 用户id
	 * @return array 鉴权返回，格式：array(鉴权状态，描述信息，array('userType'=>鉴权值))
	 */
	public function auth($userId){
		return D('Order','Logic')->auth($userId);
	}
	
	/**
	 * 产品订购
	 * @param int $userId 用户id
	 * @param int $backUrl 订购返回地址
	 */
	public function order($userId,$backUrl){
		return D('Order','Logic')->order($userId,$backUrl);
	}
	
	/**
	 * 取消订购
	 * @param unknown_type $userId
	 */
	public function cancelOrder($userId){
		return D('Order','Logic')->cancelOrder($userId);
	}
	
}