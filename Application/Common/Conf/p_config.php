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
			'info'	=> '',
		),
		
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
			'value' => array(1 => '语文', 2 => '数学', 3=>'英语'),
			'info'	=> '',
		),
		
		/* 课程标签配置 */
		'courseTags'=>	array(
			'type'	=> 'array',
			'title'	=> '课程标签',
			'value' => array(1 => '音乐', 2 => '美术', 3=>'书法', 4=>'科学',5=>'舞蹈',6=>'动漫',7=>'电影',8=>'写作',9=>'手工'),
			'info'	=> '',
		),
		
		/* 课程册数配置 */
		'volume'	=>	array(
			'type'	=> 'array',
			'title'	=> '课程册数',
			'value' => array(1 => '上册', 2 => '下册'),
			'info'	=> '',
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

