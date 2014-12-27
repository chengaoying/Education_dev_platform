<?php

/**
 * 产品相关配置
 * 配置类型(type)有：array,string,numeric,textarea,bool
 */
return array(
		
		/* 课程类型配置 */
		'courseType'	=>	array(
			'type'	=> 'array',
			'title'	=> '课程类型',
			'value' => array(1 => '基础', 2 => '拓展'),
			'info'	=> '',
		),
		
		/* 科目配置 */
		'subject'	=>	array(
			'type'	=> 'array',
			'title'	=> '科目',
			'value' => array(
				1  => '语文',
				2  => '数学',
				3  => '英语',
				4  => '科学',
				5  => '美术',
				6  => '书法',
				7  => '音乐',
				8  => '舞蹈',
				9  => '写作',
				10 => '手工',
				11 => '动漫',
				12 => '电影',
			),
			'info'	=> '',
		),
		
		/* 能力标签配置 */
		'tags'		=>	array(
			'type'	=> 'array',
			'title'	=> '能力标签',
			'value' => array(
				1 => '社会', 
				2 => '习惯',
				3 => '健康', 
				4 => '科学',
				5 => '习惯',
				6 => '语言',
				7 => '综合',
			),
			'info'	=> '',
		),
		
		/* 学期配置 */
		'session'	=>	array(
			'type'	=> 'array',
			'title'	=> '学期',
			'value' => array(1 => '上学期', 2 => '下学期'),
			'info'	=> '',
		),
		
		/* 关键字配置 */
		'keys'	=>	array(
			'type'	=> 'array',
			'title'	=> '关键字列表',
			'value' => array(1 => '特别推荐', 2 => '一般推荐'),
			'info'	=> '',
		),
		
		/* 资源提供商 */
		'rp'	=>	array(
			'type'	=> 'array',
			'title'	=> '资源商列表',
			'value' => array(1001 => '掌世界'),
			'info'	=> '',
		),
    
		/* 广告提供商 */
        'ap'	=> array(
            'type'	=> 'array',
            'title'	=> '广告商列表',
            'value' => array(1001=>'掌世界'),
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

