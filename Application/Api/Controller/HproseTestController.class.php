<?php

/**
 * 测试
 * @author CGY
 *
 */

namespace Api\Controller; 
use Think\Controller\HproseController;

class HproseTestController extends HproseController{
	
	public function test(){
		return 'Hello, Hprose!';
	}
}