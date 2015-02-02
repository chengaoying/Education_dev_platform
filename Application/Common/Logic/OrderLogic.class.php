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
		$res = D($this->area,'Area')->auth($userId);
		return $res;
	}
	
	public function order(){
		
		D($this->area,'Area')->order($userId);
	}
	
}