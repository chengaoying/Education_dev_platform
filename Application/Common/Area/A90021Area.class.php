<?php

/**
 * 专区特殊逻辑类：四川电信（90021）
 */
namespace Common\Area;

class A90021Area extends BaseArea{
    
	
	public function __construct() {
		parent::__construct();
	}
	
	/**
	 * 产品鉴权接口
	 * @param arr $user
	 */
	public function auth($user){
		$url = $this->auth_url.'?userid='.$user['OpUserId'].'&usertoken='.$user['OpUserToken'];
		$url .= '&product='.$this->proKey.'&spid='.$this->spid;
		$result = url_data($url,'','get');
		
		//保存鉴权记录（调试模式下保存）
		if(C('DEBUG_MODE')){
			$data['userId'] = $user['id'];
			$data['opUserId'] = $user['OpUserId'];
			$data['proKey'] = $this->proKey;
			$data['url'] = $url;
			$data['result'] = $result;
			D('UserAuthRecord')->saveData($data);
		}
		
		return result_data(1,'',$result);
	}
	
	/**
	 * 产品订购
	 * @param unknown_type $user
	 * @param unknown_type $chargeMode
	 * @param unknown_type $backUrl
	 */
	public function order($user,$chargeMode,$backUrl){
		//计费参数
		$param = 'spid='.$this->spid;
		$param .= '&userid='.$user['OpUserId'];
		$param .= '&usertoken='.$user['OpUserToken'];
		$param .= '&money='.intval($chargeMode['price']);
		$param .= '&product='.$this->proKey;
		$param .= '&username='.$user['OpUserName'];
		$param .= '&action=1';
		$param .= '&paytype='.$this->charge_type;
		
		$checkCode = $param['userid'].'|'.$param['spid'].'|'.$param['product'].'|'.$this->check_key.'|'.$param['money'];
		$param .= '&checkCode='.md5($checkCode);
		$param .= '&backurl='.urlencode($backUrl);
		
		//发起订购请求
		$url = $this->order_url.'?'.$param;
		$result = url_data($url,'','get');
		$_backUrl = $backUrl.'&result='.$result;
		
		//保存订购记录
		$data['userId'] = $user['id'];
		$data['opUserId'] = $user['OpUserId'];
		$data['proKey'] = $this->proKey;
		$data['chargeMode'] = $chargeMode['type'];
		$data['price']	= $chargeMode['price'];
		$data['desc'] = $chargeMode['desc'];
		$data['checkCode'] = $param['checkCode'];
		$data['url'] = $url;
		$data['result'] = $result;
		$data['backUrl'] = $_backUrl;
		D('UserOrderRecord')->saveData($data);
		
		header("location:".$_backUrl);
		exit;
	}
	
	/**
	 * 退订产品
	 * @param unknown_type $user
	 */
	public function cancelOrder($user){
		$url = $this->cancel_order_url.'?userId='.$user['OpUserId'].'&product='.$this->proKey;
		$result = url_data($url,'','get');
		
		//保存退订记录
		$data['userId'] = $user['id'];
		$data['opUserId'] = $user['OpUserId'];
		$data['proKey'] = $this->proKey;
		$data['url'] = $url;
		$data['result'] = $result;
		D('UserCancelOrderRecord')->saveData($data);
		
		return result_data(1,'',result);
	}
	
	
	public function queryOrderList(){}
	
	
}