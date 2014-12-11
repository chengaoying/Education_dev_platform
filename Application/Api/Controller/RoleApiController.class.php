<?php

/**
 * 用户角色信息接口
 * @author CGY
 *
 */

namespace Api\Controller; 

class RoleApiController extends BaseApiController{
	
	/**
	 * 保存或更新角色信息
	 * @param arr $role 角色信息
	 */
	public function saveOrUpdate($role){
		$result = D('Role')->saveData($role);
		return $result;
	}
	
	/**
	 * 通过roleId查询单个角色
	 * @param string $roleId
	 * @return obj
	 */
	public function load($roleId){
		$role = D('Role')->selectOne(array('id'=>$roleId));
		return $role;
	}
	
	/**
	 * 根据用户ID查询用户的角色列表
	 * @param string $id
	 */
	public function queryRoleList($id){
		$param['where'] = array('userId'=>$id);
		$list = D('Role')->selectPage($param);
		return $list['rows'];
	}
}