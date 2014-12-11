<?php

/**
 * 用户信息接口
 * @author CGY
 *
 */

namespace Api\Controller; 

class UserApiController extends BaseApiController{
	
	/**
	 * 保存或更新用户信息
	 * @param arr $user 用户信息
	 */
	public function saveOrUpdate($user){
		$result = D('User')->saveData($user);
		return $result;
	}
	
	/**
	 * 通过id查询单个用户
	 * @param string $userId
	 * @return obj
	 */
	public function load($id){
		$user = D('User')->find($id);
		return $user;
	}
	
	/**
	 * 通过机顶盒帐号(OpUserId)查询单个用户
	 * @param string $OpUserId
	 * @return obj
	 */
	public function loadByOpUserId($OpUserId){
		$user = D('User')->selectOne(array('OpUserId'=>$OpUserId));
		return $user;
	}
}