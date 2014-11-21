<?php

/**
 * 当前项目通用函数库
 */

/**
 * 获取产品相关配制信息
 * @param $field  string 获取的字段内容
 */
function CP($field='') {
	return D('ProductConfig', 'Logic')->getConfig($field);
}