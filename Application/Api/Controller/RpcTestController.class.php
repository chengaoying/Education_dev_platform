<?php

/**
 * 测试
 * @author CGY
 *
 */

namespace Api\Controller; 
use Think\Controller\RpcController;

class RpcTestController extends RpcController{
	
	public function test(){
		return 'Hello,RPC!';
	}
}