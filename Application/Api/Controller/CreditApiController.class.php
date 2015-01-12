<?php

/**
 * 积分控制接口
 * @author WZH
 *
 */

namespace Api\Controller; 

class CreditApiController extends BaseApiController{
	
	/**
	 * 插入或更新积分
	 * @param $data
	 */
	public function saveOrUpdate($data){
		$result = D('Credit')->saveData($data);
		return $result;
	}
	
	/**
	 * 通过roleId key查询credit表
	 * @param string $roleId
	 * @return login
	 */
	public function selectOneByRoleId($roleId, $key){
		$where['roleId'] = $roleId;
		$where['key'] = $key;
		
		$result = D('Credit')->selectOne($where);
		return $result;
	}
}