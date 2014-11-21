<?php

/**
 * 配置
 * 配置类型(type)有：array,string,numeric,textarea,bool
 */
return array(
		
		/* 栏目图片缩略图 */
		'channelThumb'	=>	array(
			'type'	=> 'textarea',
			'title'	=> '栏目缩略图格式',
			'value' => 's=100*200,m=200*300', //格式：s=100*200,m=200*300
			'info'	=> 'dadf',
		),
		
		/* 课程类型配置 */
		'courseType'	=>	array(
			'type'	=> 'array',
			'title'	=> '课程类型',
			'value' => array(1 => '基础', 2 => '拓展'),
			'info'	=> 'dadf',
		),
		
		/* 关键字配置 */
		'keys'	=>	array(
			'type'	=> 'array',
			'title'	=> '关键字列表',
			'value' => array(1 => '热门', 2 => '推荐', 3 => '置顶'),
			'info'	=> '',
		),
		
		/* 资源提供商 */
		'rp'	=>	array(
			'type'	=> 'array',
			'title'	=> '资源商列表',
			'value' => array(1001 => '掌世界'),
			'info'	=> '',
		),
		
		/* 出版社 */
		'press'	=>	array(
			'type'	=> 'array',
			'title'	=> '出版商列表',
			'value' => array(2001 => '某某出版社'),
			'info'	=> '',
			
		),
);


