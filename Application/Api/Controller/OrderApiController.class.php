<?php

/**
 * 订购/鉴权接口
 * @author CGY
 */

namespace Api\Controller; 

class OrderApiController extends \Think\Controller{
	
	/**
	 * 产品鉴权
	 */
	public function authAct(){
		$userId = I('get.userId');
		$result = D('Order','Logic')->auth($userId);
		$this->ajaxReturn($result);
	}
	
	/**
	 * 产品订购
	 */
	public function orderAct(){
		$userId = I('get.userId');
		$backUrl = I('get.backUrl');
		$result = D('Order','Logic')->order($userId,$backUrl);
		$this->ajaxReturn($result);
	}
	
	/**
	 * 取消订购
	 */
	public function cancelOrderAct(){
		$userId = I('get.userId');
		$result = D('Order','Logic')->cancelOrder($userId);
		$this->ajaxReturn($result);
	}
	
}