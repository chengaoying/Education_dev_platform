<?php

/**
 * 通用函数库
 */

/**
 * 返回统一格式的结果
 * @param bool $status	操作结果（true or false）
 * @param string $info  提示信息
 * @param mixed $data 	要返回的数据
 * @return array 		返回格式：array('status'=>[true|false],'info'=>string,'data'=>mixed)
 */
function result_data($status, $info = '', $data = '') {
    if (empty($info)) {
        $info = $status ? '操作成功!' : '操作失败';
    }
    return array('status' => $status, 'info' => $info, 'data' => $data);
}

/**
 * 从数据数组中根据必要及非必要条件取出所需子集
 * @param array $vals		原数组
 * @param string $require	必须项字段(不存在自动生成空值）,多字段用逗号分隔
 * @param string $optional	可选项字段(不存在不处理),多字段用逗号分隔
 * @return array 			必须项和可选项相加的数据子集
 */
function get_array_data($arr, $require, $optional = '') {
    $data = array();
    $require = explode(',', $require);
    $optional = explode(',', $optional);
    foreach ($require as $field) {
        $data [$field] = $arr [$field];
    }
    foreach ($optional as $field) {
        if (isset($arr [$field])) {
            $data [$field] = $arr [$field];
        }
    }
    return $data;
}

/**
 * 根据某个值获取数组的关键字（主要用于一维数组）或其它所属值（主要用于二维数组）
 * @param $arr array		原数组
 * @param $searchVal mixed	待查询的字段值
 * @param $searchKey string	待查询的字段KEY
 * @param $resultKey string 待返回结果的字段KEY
 * @return NULL / mixed		
 */
function get_array_keyval($arr, $searchVal, $searchKey = '', $resultKey = '') {
    foreach ($arr as $k => $v) {
        $v1 = empty($searchKey) ? $v : $v [$searchKey];
        if ($v1 == $searchVal) {
            return empty($resultKey) ? $k : $v [$resultKey];
        }
    }
    return null;
}

/**
 * 根据数组值获取键值(一维或是二维数组)
 * $val 数值值
 * return $keyItem 键值
 */
function get_array_key($val,$data=array(),$pos=0) {
	if(!is_array($data)){
		return;
	}
	$newArr = array();
	foreach ($data as $key => $value) {
		if(!is_array($value)){
			$newArr[$key] = $value;
		}else{
			$newArr[$key] = $value[$pos];
		}
	}
	$keyItem = array_search($val, $newArr);
	return $keyItem;
}

/**
 * 从数组中返回某个值（主要用于无法连续书写的语句上）
 * @param array $arr
 * @param string|int $key
 */
function get_array_val($arr, $key) {
    return $arr [$key];
}

/**
 * 从数组中返回某个列组成新数组
 * @param arr $arr
 * @param str $key 如果$key为空，则以key为值组成新数组
 */
function get_array_vals($arr, $searchKey) {
    foreach ($arr as $k => $v) {
        $newArr[$k] = $v[$searchKey];
    }
    return $newArr;
}

/**
 * 根据二维表数组某个字段值取回子集
 * @param unknown_type $arr 数组
 * @param unknown_type $field 字段名
 * @param unknown_type $val 字段值
 * @return unknown
 */
function get_array_for_fieldval($arr,$field,$fieldVal){	
	foreach($arr as $key => $val){		
		if($val[$field]!=$fieldVal) {
			unset($arr[$key]);
		}
	}
	return $arr;
}

/**
 * 获取二维数组中的一个一纬数组，根据对应的键和值
 * @param arr $arr
 * @param unknown_type $key
 * @param unknown_type $val
 */
function get_array_by_key($arr,$key,$val){
	foreach ($arr as $k=>$v){
		if($v[$key] == $val)
			return $v;
	}
	return null;
}

/**
 * 从数组中取某列值替换数组的键名
 * @param unknown_type $arr
 * @param unknown_type $keyName 新KEY所有列的KEY
 * @param string $valName 值所有列的KEY
 * @return array
 */
function array_replace_keyval($arr, $keyName='',$valName='') {
    foreach ($arr as $key => $val) {
    	$k = empty($keyName) ? $k : $val[$keyName];
    	$v = empty($valName) ? $val : $val[$valName];
        $newArr[$k] = $v;
    }
    return $newArr;
}

/**
 * 根据条件，将一个数据的字段附加到另一个数组中(只要用于关联的两个二维表数组)
 * @param unknown_type $arr1
 * @param unknown_type $arr2
 * @param unknown_type $keys
 * @param unknown_type $fields
 */
function array_add_field($arr1,$arr2,$joinKey,$fields){
	$fields = explode(',',$fields);
	foreach($arr1 as $k1=>$v1){		
		foreach($fields as $fV){
			$v1[$fV] = $arr2[$v1[$joinKey]][$fV];
		}
	}
	return $arr1;
}

/**
 * 获取一定范围内的随机数字 位数不足补零
 * @param integer $min 最小值
 * @param integer $max 最大值
 * @return string
 */
function rand_number($min, $max) {
    return sprintf("%0" . strlen($max) . "d", mt_rand($min, $max));
}

/**
 * 判断除0外的空
 * @param unknown_type $val
 * @return boolean
 */
function is_empty_null($val){
	return ($val==='' || $val===null);
}

/**
 * 判断是否为json数据
 * @param unknown_type $string
 * @return boolean
 */
function is_json($string){
	json_decode($string); 
	return (json_last_error() == JSON_ERROR_NONE);
}

/**
 * 读取Excel表格中的数据
 * @param unknown_type $fileUrl 文件地址
 */
function readExcelData($fileUrl){
	if(strpos($fileUrl,"http://") === 0){
		$_fileUrl = './upfiles/lib/test.xls';
		$fp_input = fopen($fileUrl, 'r');
		file_put_contents($_fileUrl, $fp_input);
	}else{
		$_fileUrl = $fileUrl;
	}
	if(!file_exists($_fileUrl)) return result_data(0,'文件'.$_fileUrl.'不存在！');
	
	//加载第三方类库PHPExcel
	vendor('PHPExcel.PHPExcel');
	vendor('PHPExcel.PHPExcel.IOFactory');
	
	//创建reader对象
	$objReader = \PHPExcel_IOFactory::createReaderForFile($_fileUrl);
	$objPHPExcel = new \PHPExcel();
	$objPHPExcel = $objReader->load($_fileUrl);
	$sheet_count = $objPHPExcel->getSheetCount();
		
	//存储数据的变量
	$data = array();
	
	for ($s = 0; $s < $sheet_count; $s++)
	{
		$currentSheet = $objPHPExcel->getSheet($s);		// 当前工作表
		$workbookTitle = $currentSheet->getTitle();		// 当前工作薄名称
		$row_num = $currentSheet->getHighestRow();		// 当前工作表行数
		$col_max = $currentSheet->getHighestColumn(); 	// 当前工作表列数
		$arr = $currentSheet->toArray(null, true, true, true); //转换成数组
		
		// 数据从从第二行开始，第一行是表头
		for($i = 2; $i <= $row_num; $i++)
		{
			for($j = 'A'; $j <= $col_max; $j++)
			{
				$field = $arr[1][$j]; //字段名称
				$cell_value = $arr[$i][$j]; //单元格数据
				if(empty($arr[$i]['A']) && empty($arr[$i]['B']))
					continue;
				$data[$workbookTitle][$i-2][$field] = $cell_value;
			}
		}
	}
	
	return result_data(1,'',$data);
}


/**
 * 因为某一键名的值不能重复，删除重复项
 * @param 二维数组$arr
 * @param 重复的键值$key
 * @return 返回删除了重复键值的数组
 */
function assoc_unique($arr, $key)
{
	$tmp_arr = array();
	foreach($arr as $k => $v)
	{
		if(in_array($v[$key], $tmp_arr))//搜索$v[$key]是否在$tmp_arr数组中存在，若存在返回true
		{
			unset($arr[$k]);
		}
		else {
			$tmp_arr[] = $v[$key];
		}
	}
	sort($arr); //sort函数对数组进行排序
	return $arr;
}

/**
 * 一维数组不能完全相同，而删除重复项
 * @param 二维数组$array2D
 * @return 数组
 */
function array_unique_fb($array2D){
	foreach ($array2D as $v){
		$v = join(",",$v); //降维,也可以用implode,将一维数组转换为用逗号连接的字符串
		$temp[] = $v;
	}
	$temp = array_unique($temp);    //去掉重复的字符串,也就是重复的一维数组
	foreach ($temp as $k => $v){
		$temp[$k] = explode(",",$v);   //再将拆开的数组重新组装
	}
	return $temp;
}

/**
 * 获取字符传中的分隔符(英文逗号(,)、中文逗号(，)、回车键)
 * @param unknown_type $str
 */
function getDelimiterInStr($str){
	$s = ',';
	if(strchr($str,',')){
		$s = ',';
	}
	elseif(strchr($str,'，')){
		$s = '，';
	}
	elseif(strchr($str,PHP_EOL)){
		$s = PHP_EOL;
	}
	return $s;
}

/**
 * 在某一范围内取N个不重复的随机数
 * @param int $min   取值范围最小值
 * @param int $max	   取值范围最大值
 * @param int $n	   取不重复随机数个数
 */
function getRandNumber($min,$max,$n){
	$rand_array = range($min,$max);
	shuffle($rand_array);//调用现成的数组随机排列函数
	return array_slice($rand_array,0,$n);//截取前$n个
}


