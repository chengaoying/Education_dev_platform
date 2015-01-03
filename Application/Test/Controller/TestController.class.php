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
		
		/* $str = '这是中文逗号，';
		dump($str);
		$str = str_replace('，',',',$str);
		dump($str); */
		//$this->importTest();
		
		/* $key = get_array_keyval(S('Channel'),18,'id','chKey');
		dump($key); */
		
		/* //测试读取excel表格中的图片
		$this->readExcelImages(); */
		/* $str = get_array_keyval(S('Stage'),'0-1岁','name','id');
		dump($str);*/
		
		/* $r = D('Course','Logic')->queryCourseListByKeys(3,'1',1,2);
		dump($r);
		exit;  */
		
		/* $wk_day = date('w');
		$week   = date('W');
		dump($week);
		
		exit;  */
		
		/* $wk_day=date('w');   //得到今天是星期几
		$date_now=date('j'); //得到今天是几号
		$wkday_ar=array('日','一','二','三','四','五','六'); //规范化周日的表达
		$cal_result=ceil($date_now/7); //计算是第几个星期几
		$str=date("Y年n月j日")." 星期".$wkday_ar[$wk_day]." - 本月的第 ".$cal_result." 个星期".$wkday_ar[$wk_day];
		echo $str;  */
		//$course = D('Course')->find(1001);
		/* $param['id'] = 1001;
    	$param['topicIds'] = '1001,1002';
    	$res = D('Course')->saveData($param);
    	save_log('test',$res);
    	dump($res); */
		
		//$this->readExcelImages();
		
		$this->cenvertData();
		
    	//exit;
		$this->display();
	}
	
	private function readExcelImages(){
		$fileUrl = './upfiles/0/test.xls';
		$result = readExcelData($fileUrl);
		$data = $result['data'];
		dump($data);exit;
	}
	
	private function cenvertData(){
		
		$tables = array('课程'=>'course','知识点'=>'topic','课时'=>'section','视频资源'=>'resource','题库资源'=>'library');
		
		$fields['course'] = array(
			'课程id'=>'id','课程名'=>'name','一级分类'=>'chId','龄段名称'=>'stageIds','出版社'=>'pressId',
			'学期'=>'session','科目'=>'subject','类型'=>'typeId','价格'=>'price','期中考试题库'=>'midLibId',
			'期末考试题库'=>'finalLibId','知识点id列表'=>'topicIds','关键字'=>'keys','图片路径'=>'imgUrl','访问地址'=>'linkUrl',
			'机构'=>'organization','讲师'=>'lecturer','描述'=>'description','排序'=>'sort','状态(0-禁用，1-启用)'=>'status',
		);
		$fields['topic'] = array(
			'知识点id'=>'id','知识点名称'=>'name','课程id'=>'courseId','课时列表id'=>'sectionIds',
			'图片路径'=>'imgUrl','描述'=>'description','排序'=>'sort','状态'=>'status'
		);
		$fields['section'] = array(
			'课时id'=>'id','课时名'=>'name','知识点id'=>'topicId','题库id'=>'libId','预习视频列表'=>'previewList',	
			'正文视频列表'=>'lessonList','图片路径'=>'imgUrl','标签'=>'tags','描述'=>'description','排序'=>'sort','状态'=>'status'			
		);
		$fields['resource'] = array(
			'资源id'=>'id','标题'=>'title','课时id'=>'sectionId','code'=>'content','资源商id'=>'rpId',
			'权限(0-免费，1-收费)'=>'playAuth','关键字'=>'keyList','价格'=>'price','图片路径'=>'imgUrl','对外统计id'=>'outId',
			'播放次数'=>'playCount','赞次数'=>'praiseCount','收藏次数'=>'favorCount','描述'=>'description','排序'=>'sort','状态'=>'status',	
		);
		$fields['library'] = array(
			'题库id'=>'id','标题'=>'title','课时id'=>'sectionId','资源提供商'=>'rpId','权限'=>'auth',
			'价格'=>'price','题库路径'=>'libUrl','图片路径'=>'imgUrl','描述'=>'description','排序'=>'sort','状态'=>'status'							
		);
		
		$data = $this->importTest();
		foreach ($data as $k => $v){
			$data[$tables[$k]] = $v;
			unset($data[$k]);
		}
		
		foreach ($data as $k1 => $v1){
			foreach ($v1 as $k2 => $v2){
				foreach ($v2 as $k3 => $v3){
					$data[$k1][$k2][$fields[$k1][$k3]] = $v3;
					unset($data[$k1][$k2][$k3]);
				}
			}
		}
		
		dump($data);exit;
	}
	
	private function importTest(){
		 $fileUrl = './upfiles/6/54a403009f51f.xlsx';
		 $result = readExcelData($fileUrl);
		 $data = $result['data'];
		 return $data;
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