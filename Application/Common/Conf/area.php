<?php
/**
 * 专区配置信息
 */
return array (
		
	/* 专区适配设置 */	
	'DEFAULT_MODULE'	=> 'System',	//默认分组模块
	'AREA_CODE' 		=> '80027', 	//地区编码
	'PRO_KEY'			=> 'hipi',		//产品key
	
	/* 主数据库  */
	'DB_TYPE'		=> 'mysql', 		// 数据库类型
	'DB_HOST'		=> '192.168.0.5',	// 服务器地址
	'DB_NAME'		=> 'edu_hipi',	 	// 数据库名
	'DB_USER'		=> 'edu', 			// 用户名
	'DB_PWD'		=> 'edu',		 	// 密码
	'DB_PORT'		=> '3306', 			// 端口
	'DB_PREFIX'		=> 't_', 			// 数据库表前缀
	'DB_CHARSET'	=> 'utf8',
   
	/* 附件上传  */
	'UPFILE_ISREMOTE'	=> false,		 //是否保存到远程文件服务器
	'UPFILE_FTP_SERVER'	=> '127.0.0.1',	 //远程FTP服务器	
	'UPFILE_FTP_PROT'	=> '21',		 //远程FTP端口
	'UPFILE_FTP_USER'	=> '',			 //远程FTP帐号
	'UPFILE_FTP_PWD'	=> '',			 //远程FTP密码
	'UPFILE_FTP_TIMEOUT'=> '90',		 //远程FTP超时时间(默认90秒)	
	'UPFILE_LOCAL_PATH' => './upfiles',  //本地文件保存地址
	
    /* 模版常量及常用资源访问路径设置  */
	'DEFAULT_THEME'     => 'v1',	//模板主题（此处一经修改，请同时修改TMPL_PARSE_STRING项下的各子项路径）	
	'TMPL_PARSE_STRING' => array (
		'__TITLE__' 		=> '掌世界嗨皮课堂', 						// 站点标题		
		'__COMMON__' 		=> '/static/v1/common',					//公共资源路径
		'__SD__'			=> '/static/v1/sd',	 					//标清公共资源路径
		'__HD__'			=> '/static/v1/hd',						//高清公共资源路径
		'__THEME__' 		=> '/static/v1', 						//分组模块资源路径
		'__UPFILE__'		=> 'http://192.168.0.152:8500/upfiles',	//附件访问地址,请使用绝对地址(正式环境不要使用localhost)
        '__CSSJS_VERSION__'	=> '20140208173232',  					//CSS和JS版本
	),
	
	/* 与前端通讯参数  */
	'WEB_URL'	 =>	'http://192.168.0.152:8501/Api/Sync',	    //数据同步地址
	'CHECK_CODE' =>	'2014edu!@#',								//通讯校验码
	
	/* 接口相关参数 */
	'BASE_URI'				=>	'http://192.168.0.4:8246/', 			 //接口地址前缀
	'AUTH_URL'				=>	'/api/services/month_order_enabled',	 //鉴权地址
	'ORDER_URL'				=>	'/games/month_order',					 //包月订购地址
	'QUERY_ORDER_LIST_URL'	=>	'/api/base/services/MonthPayOrder/query',//查询订单列表地址
	'CANCEL_ORDER_URL'		=>	'/api/services/cancel_month_order',		 //取消订购地址
	'PV_URL'				=>	'/remote/PvRemote/save_pv',				 //pv记录地址
	'CHECK_KEY'				=>	'rkONetpI5N1amFCGRbPHHq0zZQajmvep',		 //通讯校验码
	'SPID'					=>	'10030000',								 //运营商提供的spid(订购参数)
	'CHARGE_TYPE'			=>	0,										 //计费类型：0-包月，1-按次，2-包时段，99-其他
	'OPTION_FLAG'			=>	'EDUCATION',							 //教育产品标识
       
);
