<?php

/**
 * 当前项目通用函数库
 */

/**
 * 获取配置中的配置内容
 * @param string $cKey 配置key
 */
function get_pro_config_content($cKey){
	$conf = get_cache('ProConfig');
	$conf = $conf[$cKey];
	$content = $conf['content'];
	return unserialize($content);
}