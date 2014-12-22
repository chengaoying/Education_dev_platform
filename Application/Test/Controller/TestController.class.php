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
		//$config = D('ProConfig','Logic')->getConfig('p*config');
		//$c = get_cache('ProConfig_p*config');
		
		/* 龄段,顶级分类测试
		$topChannel = S('Channel_top');
		$topChannel = get_array_for_fieldval($topChannel, 'chKey','allcourse');
		$topChannel = array_slice($topChannel,0,count($topChannel));
		$class = S('Channel_'.$topChannel[0]['id']);
		dump($class);  */
		
		/* $list = D('Stage')->selectPage();
		$list = array_values($list['rows']);
		foreach ($list as $k => $v){
			$list[$k]['chId'] = $class[$list[$k]['chId']]['name'];
		}
		dump($list); */
		
		//dump(S('Stage_20'));
		
		//exit;
		
		//数据同步测试
		/* $url = "http://192.168.0.152:8501/Api/Sync/recive";
		vendor('Hprose.HproseHttpClient');
		$client = new \HproseHttpClient($url);
		$result = $client->recive('hello');
		dump($result); */
		
		//
		//D('Sync','Logic')->send();
		
		/* dump(get_pro_config_content('proConfig'));
		dump(get_cache('ProConfig'));
		$proConf  = get_pro_config_content('proConfig');
		dump($proConf['keys']); */
		
		//$stages = get_cache('Stage');
		//$data = get_array_for_fieldval($stages, 'chId',20);
		//$stages = D('Stage')->updateCache();
		/* dump(S('Stage'));
		exit; */
		
		//$this->importTest();
		
		$key = get_array_keyval(S('Channel'),18,'id','chKey');
		dump($key);
		
		$this->display();
	}
	
	private function importTest(){
		 $fileUrl = './upfiles/a/5494d93f388d2.xlsx';
		 $result = readExcelData($fileUrl);
		 $data = $result['data'];
		 
		 //顶级分类
		 $class = $this->getClass();
		 //配置项：
		 $proConf = get_pro_config_content('proConfig');
		 $subject = $proConf['subject'];		//科目
		 $courseType = $proConf['courseType'];	//课程类型
		 $session = $proConf['session'];		//学期
		 $keys = $proConf['keys'];				//关键字
		 $press = $proConf['press'];			//出版社
		 $rp = $proConf['rp'];					//资源提供商
		 $ap = $proConf['ap'];					//广告提供商
		 $tags = $proConf['tags'];				//标签
		 
		 //dump($proConf);exit;
		 
		 //课程
		 $course = $data['course'];
		 foreach ($course as $k => $v){
		 	$v['chId'] = $this->getKeyByName($v['chId'],$class);
		 	$v['session'] = array_search($v['session'], $session);
		 	$v['typeId'] = array_search($v['typeId'], $courseType);
		 	$v['subject'] = array_search($v['subject'], $subject);
		 	$v['pressId'] = array_search($v['pressId'], $press);
		 	
		 	$_keys = explode(',', $v['keys']);
		 	unset($v['keys']);
		 	foreach ($_keys as $k1 => $v1){
		 		$v['keys'] .= array_search($v1, $keys).',';
		 	}
		 	$v['keys'] = substr($v['keys'], 0, strlen($v['keys'])-1);
		 	$r = D('Course')->_saveData($v);
		 }
		 exit;
		/*  foreach ($data as $k => $v){
		 	$mode = D(ucfirst($k));
		 	foreach ($v as $k1 => $v2){
		 		$r = $mode->_saveData($v2);
		 		dump($r);
		 		exit;
		 	}
		 }
		 
		 // 看看数据
		 dump($r);
		 exit; */
	}
	
	/**
	 * 获取龄段顶级分类(顶级栏目-全部课程下的二级栏目)
	 * 先获取顶级栏目-全部课程，然后再获取全部课程下的二级栏目(顶级分类)
	 */
	private function getClass(){
		$channel = S('Channel');
		$topChannel = get_array_for_fieldval($channel, 'chKey','allcourse');
		$topChannel = array_slice($topChannel,0,count($topChannel));
		$id = $topChannel[0]['id'];
		$class = get_array_for_fieldval($channel, 'pId',$id);//二级栏目(顶级分类)
		return $class;
	}
	
	private function getKeyByName($name,$class){
		foreach ($class as $k => $v){
			if($v['name'] == $name) return $v['id'];
		}
	}
	
}