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
	
}