<?php

/**
 * 接口调用控制器基类
 * @author CGY
 *
 */

namespace Api\Controller; 
use Think\Controller\HproseController;

class BaseApiController extends HproseController{
	
	/* 异常/错误描述信息 */
	const ERROR_USER = 10001;
}