<?php

/**
 * 测试
 * @author Administrator
 *
 */

namespace Test\Controller;

class TestController extends \Think\Controller {
	
	public function indexAct(){
		//$data['where'] = array('cKey'=>'p*confi');
		//$record = D('ProConfig')->selectOne($data);
		$config = D('ProConfig','Logic')->getConfig('p*config');
		//$c = get_cache('ProConfig_p*config');
		dump($config);exit;
		$this->display();
	}
}