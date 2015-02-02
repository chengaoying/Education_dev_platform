<?php

/**
 * 专区特殊逻辑基础类
 */
namespace Common\Area;

class BaseArea{
	
	protected $auth_url	= '';				//鉴权地址
	protected $order_url = '';				//订购地址
	protected $query_order_list_url = '';	//查询订购列表地址
	protected $cancel_order_url = '';		//取消订购地址
	protected $pv_url = '';					//pv记录地址
	
	protected $check_key  = '';				//通讯校验码
	protected $area_id  = ''; 			//专区code（运营商分配）
	protected $charge_type = '';			//计费类型
	protected $option_flag = '';			//可选参数
	
	protected $proKey = '';					//产品key
	
	public function __construct() {
		$this->proKey = C('PRO_KEY');
		$base_uri = C('BASE_URI').$this->proKey;
		
		$this->auth_url = $base_uri.C('AUTH_URL');
		$this->order_url = $base_uri.C('ORDER_URL');
		$this->query_order_list_url = $base_uri.C('QUERY_ORDER_LIST_URL');
		$this->cancel_order_url = $base_uri.C('CANCEL_ORDER_URL');
		$this->pv_url = $base_uri.C('PV_URL');
		
		$this->check_key = C('CHECK_KEY');
		$this->area_id = C('AREA_ID');
		$this->charge_type = C('CHARGE_TYPE');
		$this->option_flag = C('OPTION_FLAG');
	}
	
	
	
}