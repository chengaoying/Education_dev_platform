<?php

/**
 * 测试
 * @author CGY
 *
 */

namespace Api\Controller; 
use Think\Controller\JsonRpcController;
class JsonRPCTestController extends JsonRPCController{
	
	public function test(){
		return 'Hello, JsonRPC!';
	}
}