<?php

/**
 * 用户信息接口
 * @author CGY
 *
 */

namespace Api\Controller; 

class UserApiController extends BaseApiController{
	
	/**
	 * 添加/注册
	 * @param $user 用户信息
	 */
	public function add($user){
		
		return $user;
	}
}