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
	 * @param int $userId
	 */
	public function auth($userId){
		$user = D('User')->find($userId);
		if(empty($user['OpUserId'])) return result_data(0,'用户信息异常！');
		$url = $this->auth_url.'?userid='.$user['OpUserId'];
		$result = url_data($url,'','get');
		
		//本地保存鉴权记录
		$data['userId'] = $user['id'];
		$data['opUserId'] = $user['OpUserId'];
		$data['proKey'] = $this->proKey;
		$data['url'] = $url;
		$data['result'] = $result;
		D('UserAuthRecord')->saveData($data);
		
		return result_data(1,'',$result);
	}
	
	public function order(){
		$chargeModes = get_cache('ChargeMode');
		$chargeMode = get_array_by_key($chargeModes, 'type', '1');
	}
	
    /*
     * 区域包月接口处理
     * $proKey 产品key
     * $packKey 计费ID
     * $price 产品价格
     * $userData 用户信息
     */
    public function monthPay($proKey,$packKey,$price,$backUrl,$userData) {
        $monthPayData = array();
        $monthPayData['spid'] = C('ZCAPI_AREA_ID');
        $monthPayData['userid'] = $userData['opUserId'];
        $monthPayData['money'] = $price;
        if(C('PACK_PRODUCT') == 1){
            $products = get_cache('Product');
            $proId = get_array_keyval($products, $proKey, 'proKey', 'id');
            if(!empty($products[$proId]['replacePackKey'])){
                $proKey = $products[$proId]['replacePackKey'];
            }
        }
        $monthPayData['product'] = $proKey;
        $monthPayData['username'] = $userData['opUserName'];
        $checkKey = C('ZCAPI_CHECK_KEY');
        //客户端与服务端的校验码,userid|spid|product|checkKey|money按照上面的格式顺序生成MD5字符串值
        $checkCodeStr = $monthPayData['userid'] . '|' . $monthPayData['spid'] . '|' . $monthPayData['product'] . '|' . $checkKey . '|' . $monthPayData['money'];
        $monthPayData['checkCode'] = md5($checkCodeStr);
        $monthPayData['backurl'] = C('ZCAPI_BACK_URL').'?proKey='.$proKey.'&backUrl='.urlencode($backUrl);
        $monthPayUrl = C('ZCAPI_MONTH_URL'); //获取包月接口地址
        $monthPayUrl = $monthPayUrl . '/' .$proKey . '/'.C('ZCAPI_MONTH_BEHIND_URL').'?' . http_build_query($monthPayData);
        $paydata = url_data($monthPayUrl,'','get');
        //echo $monthPayData['backurl'].'&ret_msg='.$paydata;exit;
        header("location:".$monthPayData['backurl'].'&ret_msg='.str_replace('#', '@', $paydata));
        exit;
    }
    
    /*
     * 区域退订功能
     * $url 退订前面地址
     * $behindUrl 退订后面地址
     * $proKey 产品key
     * $userData 用户信息
     */
    public function cancelMonthPay($url,$behindUrl,$proKey,$userData) {
        $url = $url.'/'.$proKey.'/'.$behindUrl.'?userid='.$userData['opUserId'].'&product='.$proKey;
        return $url;
    }
}