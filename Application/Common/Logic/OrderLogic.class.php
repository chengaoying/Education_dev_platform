<?php
/**
 * 逻辑处理类：订购
 * @author CGY
 *
 */
namespace Common\Logic;
class OrderLogic extends BaseLogic {
	
	private $area = '';
	
	public function __construct() {
		$this->area = 'A'.C('AREA_CODE');
	}
	
	/**
	 * 产品鉴权
	 * @param int $userId
	 */
	public function auth($userId){
		$user = D('User')->find($userId);
		if(empty($user['OpUserId'])) return result_data(0,'用户信息异常！');
		return D($this->area,'Area')->auth($user);
	}
	
	/**
	 * 产品订购
	 * @param int $userId  用户id
	 * @param str $backUrl 返回地址
	 * @return 
	 */
	public function order($userId,$backUrl){
		$user = D('User')->find($userId);
		if(empty($user['OpUserId'])) return result_data(0,'用户信息异常！');
		
		//计费信息
		$chargeModes = get_cache('ChargeMode');
		$chargeMode = get_array_by_key($chargeModes, 'type', '1');
		return D($this->area,'Area')->order($user,$chargeMode,$backUrl);
	}
	
	/**
	 * 退订产品
	 * @param int $userId
	 */
	public function cancelOrder($userId){
		$user = D('User')->find($userId);
		if(empty($user['OpUserId'])) return result_data(0,'用户信息异常！');
		
		return D($this->area,'Area')->cancelOrder($user);
	}
	
	
	
}