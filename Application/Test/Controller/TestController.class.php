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
		
		$this->importTest();
		
		
		$this->display();
	}
	
	private function importTest(){
		$fileUrl = 'b/5493d6271a28e.xlsx';//I('fileUrl','');
		$fileUrl = './upfiles/' . $fileUrl;
		
		//加载第三方类库PHPExcel
         vendor('PHPExcel.PHPExcel');
         vendor('PHPExcel.PHPExcel.IOFactory');
         //vendor('PHPExcel.PHPExcel.Reader.Excel5');
         //vendor('PHPExcel.PHPExcel.Reader.Excel2007');
         
         $objReader = \PHPExcel_IOFactory::createReaderForFile($fileUrl);
         $objPHPExcel = $objReader->load($fileUrl);
		 $sheet_count = $objPHPExcel->getSheetCount(); 
		 for ($s = 0; $s < $sheet_count; $s++) 
   		 { 
		    $currentSheet = $objPHPExcel->getSheet($s);		// 当前工作表 
		    $row_num = $currentSheet->getHighestRow();		// 当前工作表行数 
		    $col_max = $currentSheet->getHighestColumn(); 	// 当前工作表列数 
		    $arr = $currentSheet->toArray(null, true, true, true);
		    array_filter($arr);
		 	dump($arr);
		 	
		 	exit;
		    // 循环从第二行开始，第一行往往是表头 
		    /* for($i = 2; $i <= $row_num; $i++) 
		    { 
		        $cell_values = array(); 
		        for($j = 'A'; $j < $col_max; $j++) 
		        { 
		            $address = $j . $i; // 单元格坐标 
		            $cell_values[] = $currentSheet->getCell($address)->getFormattedValue(); 
		        } 
		 
		        // 看看数据 
		        print_r($cell_values); 
		    }  */
		} 
		exit;
	}
	
	
	
}