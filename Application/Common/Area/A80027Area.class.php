<?php

/**
 * 专区特殊逻辑类：天津广电（80027）
 */
namespace Common\Area;

class A80027Area extends BaseArea{
    
	
	public function __construct() {
		parent::__construct();
	}
	
	/**
	 * 产品鉴权接口
	 * @param arr $user
	 */
	public function auth($user){
		$url = $this->auth_url.'?userid='.$user['OpUserId'];
		$result = url_data($url,'','get');
		
		//保存鉴权记录
		$data['userId'] = $user['id'];
		$data['opUserId'] = $user['OpUserId'];
		$data['proKey'] = $this->proKey;
		$data['url'] = $url;
		$data['result'] = $result;
		D('UserAuthRecord')->saveData($data);
		
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
		$param['spid'] = $this->spid;
		$param['userid'] = $user['OpUserId'];
		$param['money'] = $chargeMode['price'];
		$param['product'] = $this->proKey;
		$param['username'] = $user['OpUserName'];
		$param['backurl'] = $backUrl;
		
		$checkCode = $param['userid'].'|'.$param['spid'].'|'.$param['product'].'|'.$this->check_key.'|'.$param['money'];
		$param['checkCode'] = md5($checkCode);
		
		//发起订购请求
		$url = $this->order_url.'?'.http_build_query($param);
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
		
		//保存订购记录
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