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
			'value' => array(1 => '基础', 2 => '专题', 3 => '拓展'),
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
			),
			'info'	=> '',
		),
		
		/* 能力标签配置 */
		'tags'		=>	array(
			'type'	=> 'array',
			'title'	=> '能力标签',
			'value' => array(
				1 => '健康', 
				2 => '语言',
				3 => '科学', 
				4 => '数学',
				5 => '社会',
				6 => '习惯',
				7 => '美术',
				8 => '音乐',
				9 => '综合',
			),
			'info'	=> '',
		),
		
		/* 兴趣爱好配置 */
		'interest'	=>	array(
			'type'	=> 'array',
			'title'	=> '兴趣爱好',
			'value' => array(
				1  => '科学',
				2  => '美术',
				3  => '书法',
				4  => '音乐',
				5  => '舞蹈',
				6  => '写作',
				7  => '手工',
				8  => '动漫',
				9  => '电影',
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
			'value' => array(1 => '特别推荐一',2=>'特别推荐二', 3 => '一般推荐', 4 => '嗨皮幼儿园推荐', 5 => '最新'),
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
		
		/* 课时对应的视频数 */
		'sectionVideo'	=>	array(
			'type'	=> 'numeric',
			'title'	=> '课时对应的视频数',
			'value' => 1,
			'info'	=> '值为   1 ：  课时只有一个正文视频,<br/>其它值： 课时有多个正文视频',
		),
		
		
);

