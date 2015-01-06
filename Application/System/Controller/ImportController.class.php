<?php
/**
 * 控制器： 导入数据
 * @author CalvinXu
 *
 */
namespace System\Controller;
class ImportController extends BaseAuthController {
    
    public function indexAct() {
        if(!IS_POST){
            $this->display();
        }else{
        	$fileUrl = I('fileUrl','');
        	$fileUrl = C('UPFILE_LOCAL_PATH') . '/' . $fileUrl;
        	$result = readExcelData($fileUrl);
			if(!$result['status']) $this->ajaxReturn($result);

			//总数据
			$data = $result['data'];
			
			$data = $this->cenvertData($data);
			
			//导入课程
			$course = $data['course'];
			$this->importCourse($course);
			
			//导入知识点
			$topic = $data['topic'];
			$this->importTopic($topic);
			
			//导入课时
			$section = $data['section'];
			$this->importSection($section);
			
			//导入视频资源
			$resource = $data['resource'];
			$this->importResource($resource);
			
			//导入题库资源
			$library = $data['library'];
			$this->importLibrary($library);
			
			$this->ajaxReturn(result_data(1,'数据导入完成！'));
        }
    }
    
    /**
     * 把表格中字段转换成英文（与数据库字段对应）
     * @param unknown_type $data
     */
    private function cenvertData($data){
    
    	$tables = array('课程'=>'course','知识点'=>'topic','课时'=>'section','视频资源'=>'resource','题库资源'=>'library');
    
    	$fields['course'] = array(
    			'课程id'=>'id','课程名'=>'name','一级分类'=>'chId','龄段名称'=>'stageIds','出版社'=>'pressId',
    			'学期'=>'session','科目'=>'subject','类型'=>'typeId','价格'=>'price','期中考试题库'=>'midLibId',
    			'期末考试题库'=>'finalLibId','知识点id列表'=>'topicIds','关键字'=>'keys','图片路径'=>'imgUrl','访问地址'=>'linkUrl',
    			'机构'=>'organization','讲师'=>'lecturer','描述'=>'description','排序'=>'sort','状态'=>'status',
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
    			'权限'=>'playAuth','关键字列表'=>'keyList','价格'=>'price','图片路径'=>'imgUrl','对外统计id'=>'outId',
    			'播放次数'=>'playCount','赞次数'=>'praiseCount','收藏次数'=>'favorCount','描述'=>'description','排序'=>'sort','状态'=>'status',
    	);
    	$fields['library'] = array(
    			'题库id'=>'id','标题'=>'title','课时id'=>'sectionId','资源提供商'=>'rpId','权限'=>'auth',
    			'价格'=>'price','题库路径'=>'libUrl','图片路径'=>'imgUrl','描述'=>'description','排序'=>'sort','状态'=>'status'
    	);
    
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
    	return $data;
    }
    
    /**
     * 导入课程
     * @param unknown_type $course
     */
    private function importCourse($course){
    	//顶级分类
    	$class = $this->getClass();
    	//龄段
    	$stage = S('Stage');
    	//配置项：
    	$proConf = get_pro_config_content('proConfig');
    	$subject = $proConf['subject'];			//科目
    	$courseType = $proConf['courseType'];	//课程类型
    	$session = $proConf['session'];			//学期
    	$keys = $proConf['keys'];				//关键字
    	$press = $proConf['press'];				//出版社
    	$rp = $proConf['rp'];					//资源提供商
    	$ap = $proConf['ap'];					//广告提供商
    	$tags = $proConf['tags'];				//标签
    	
    	$r = array(); //数据导入结果集
    	$failCount = 0; //失败记录数
    	$successCount = 0; //成功记录数
    	foreach ($course as $k => $v){
    		$v['chId'] = $this->getKeyByName($v['chId'],$class);
    		$v['session'] = array_search($v['session'], $session);
    		$v['typeId'] = array_search($v['typeId'], $courseType);
    		$v['subject'] = array_search($v['subject'], $subject);
    		$v['pressId'] = array_search($v['pressId'], $press);
    		
    		//龄段
    		$v['stageIds'] = str_replace('，',',',$v['stageIds']);
    		$_stages = explode(',', $v['stageIds']);
    		unset($v['stageIds']);
    		foreach ($_stages as $k2=>$v2){
    			$v['stageIds'] .= get_array_keyval(S('Stage'),$v2,'name','id').',';
    		}
    		$v['stageIds'] = substr($v['stageIds'], 0, strlen($v['stageIds'])-1);
    	
    		//关键字
    		$v['keys'] = str_replace('，',',',$v['keys']);
    		$_keys = explode(',', $v['keys']);
    		unset($v['keys']);
    		foreach ($_keys as $k1 => $v1){
    			$v['keys'] .= array_search($v1, $keys).',';
    		}
    		$v['keys'] = substr($v['keys'], 0, strlen($v['keys'])-1);
    		
    		$v['addTime'] = date('Y-m-d H:i:s',NOW_TIME);
    		if(empty($v['privilege'])) $v['privilege'] = 1;
    		if(empty($v['sort'])) $v['sort'] = 0;
    		if(empty($v['status'])) $v['status'] = 1;
    		
    		$_r = D('Course')->_saveData($v);
    		if(!$_r['status']){
    			$failCount ++;
    			$r[$k] = '记录'.$k.'导入失败，原因：'.$_r['info'];
    		}else{
    			$successCount ++;
    		} 
    	}
    	$r['total'] = '数据导入总条数：'.count($course);
    	$r['fail'] = '数据导入失败条数：'.$failCount;
    	$r['success'] = '数据导入成功条数：'.$successCount;
    	save_log('import_course',$r);
    }
    
    /**
     * 导入知识点
     * @param str $topic
     */
    private function importTopic($topic){
    	$r = array(); //数据导入结果集
    	$failCount = 0; //失败记录数
    	$successCount = 0; //成功记录数
    	$cTopic = array(); //课程的知识点数组
    	foreach ($topic as $k => $v){
    		$v['addTime'] = date('Y-m-d H:i:s',NOW_TIME);
    		if(empty($v['sort'])) $v['sort'] = 0;
    		if(empty($v['status'])) $v['status'] = 1;
    		
    		$_r = D('Topic')->_saveData($v);
    		if(!$_r['status']){
    			$failCount ++;
    			$r[$k] = '记录'.$k.'导入失败，原因：'.$_r['info'];
    		}else{
    			$successCount ++;
    			$cTopic[$v['courseId']] .= $v['id'].',';
    		} 
    	}
    	
    	//更新课程的知识点属性()
    	foreach ($cTopic as $k2 => $v2){
    		$param['id'] = $k2;
    		$param['topicIds'] = $v2;
    		$res = D('Course')->saveData($param);
    		if(!$res['status']){
    			$r[$k2] = '同步更新课程('.$k2.')失败，知识点id集：'.$v2.'失败原因：'.$res['info'];
    		}else{
    			$r[$k2] = '同步更新课程('.$k2.')成功,';
    		}
    		unset($param);
    	}
    	
    	
    	$r['total'] = '数据导入总条数：'.count($topic);
    	$r['fail'] = '数据导入失败条数：'.$failCount;
    	$r['success'] = '数据导入成功条数：'.$successCount;
    	save_log('import_topic',$r);
    }
    
    /**
     * 导入课时
     * @param str $section
     */
    private function importSection($section){
    	//配置项：
    	$proConf = get_pro_config_content('proConfig');
    	$tags = $proConf['tags'];	//标签
    	
    	$r = array(); //数据导入结果集
    	$failCount = 0; //失败记录数
    	$successCount = 0; //成功记录数
    	$tSection = array();//知识点的课时数组
    	foreach ($section as $k => $v){
    		$v['tags'] = str_replace('，',',',$v['tags']);
    		$_tags = explode(',', $v['tags']);
    		unset($v['tags']);
    		foreach ($_tags as $k1 => $v1){
    			$v['tags'] .= array_search($v1, $tags).',';
    		}
    		$v['tags'] = substr($v['tags'], 0, strlen($v['tags'])-1);
    		
    		$v['addTime'] = date('Y-m-d H:i:s',NOW_TIME);
    		if(empty($v['sort'])) $v['sort'] = 0;
    		if(empty($v['status'])) $v['status'] = 1;
    		if(empty($v['privilege'])) $v['privilege'] = 1;
    		
    		$_r = D('Section')->_saveData($v);
    		if(!$_r['status']){
    			$failCount ++;
    			$r[$k] = '记录'.$k.'导入失败，原因：'.$_r['info'];
    		}else{
    			$successCount ++;
    			$tSection[$v['topicId']] .= $v['id'].',';
    		} 
    	}
    	
    	//更新知识点的课时点属性()
    	foreach ($tSection as $k2 => $v2){
    		$param['id'] = $k2;
    		$param['sectionIds'] = $v2;
    		$res = D('Topic')->saveData($param);
    		if(!$res['status']){
    			$r[$k2] = '同步更新知识点('.$k2.')失败，知课时id集：'.$v2.'失败原因：'.$res['info'];
    		}else{
    			$r[$k2] = '同步更新知识点('.$k2.')成功,';
    		}
    		unset($param);
    	}
    	
    	$r['total'] = '数据导入总条数：'.count($section);
    	$r['fail'] = '数据导入失败条数：'.$failCount;
    	$r['success'] = '数据导入成功条数：'.$successCount;
    	save_log('import_section',$r);
    }
    
    /**
     * 导入视频资源
     * @param str $resource
     */
    private function importResource($resource){
    	//配置项：
    	$proConf = get_pro_config_content('proConfig');
    	$keys = $proConf['keys'];	//标签
    	
    	$r = array(); //数据导入结果集
    	$failCount = 0; //失败记录数
    	$successCount = 0; //成功记录数
    	$sResource = array();//课时的视频资源数组
    	foreach ($resource as $k => $v){
    		/* $v['keyList'] = str_replace('，',',',$v['keyList']);
    		$_keys = explode(',', $v['keyList']);
    		unset($v['keyList']);
    		foreach ($_keys as $k1 => $v1){
    			$v['keyList'] .= array_search($v1, $keys).',';
    		}
    		$v['keyList'] = substr($v['keyList'], 0, strlen($v['keyList'])-1); */
    		$v['addTime'] = date('Y-m-d H:i:s',NOW_TIME);
    		if(empty($v['sort'])) $v['sort'] = 0;
    		if(empty($v['status'])) $v['status'] = 1;
    		
    		$_r = D('Resource')->_saveData($v);
    		if(!$_r['status']){
    			$failCount ++;
    			$r[$k] = '记录'.$k.'导入失败，原因：'.$_r['info'];
    		}else{
    			$successCount ++;
    			$sResource[$v['sectionId']] .= $v['id'].',';
    		} 
    	}
    	
    	//更新课时的视频资源属性()
    	foreach ($sResource as $k2 => $v2){
    		$param['id'] = $k2;
    		$param['lessonList'] = $v2;
    		$res = D('Section')->saveData($param);
    		if(!$res['status']){
    			$r[$k2] = '同步更新课时('.$k2.')失败，视频id集：'.$v2.'失败原因：'.$res['info'];
    		}else{
    			$r[$k2] = '同步更新课时('.$k2.')成功,';
    		}
    		unset($param);
    	}
    	
    	$r['total'] = '数据导入总条数：'.count($resource);
    	$r['fail'] = '数据导入失败条数：'.$failCount;
    	$r['success'] = '数据导入成功条数：'.$successCount;
    	save_log('import_resource',$r);
    }
    
    /**
     * 导入题库资源
     * @param str $library
     */
    private function importLibrary($library){
    	$r = array(); //数据导入结果集
    	$failCount = 0; //失败记录数
    	$successCount = 0; //成功记录数
    	$sLibrary = array();//课时的题库数组
    	foreach ($library as $k => $v){
    		$v['addTime'] = date('Y-m-d H:i:s',NOW_TIME);
    		if(empty($v['sort'])) $v['sort'] = 0;
    		if(empty($v['status'])) $v['status'] = 1;
    		
    		$_r = D('Library')->_saveData($v);
    		if(!$_r['status']){
    			$failCount ++;
    			$r[$k] = '记录'.$k.'导入失败，原因：'.$_r['info'];
    		}else{
    			$successCount ++;
    			$sLibrary[$v['libId']] = $v['id'].',';
    		} 
    	}
    	
    	//更新课时的题库属性()
    	foreach ($sLibrary as $k2 => $v2){
    		$param['id'] = $k2;
    		$param['libId'] = $v2;
    		$res = D('Section')->saveData($param);
    		if(!$res['status']){
    			$r[$k2] = '同步更新课时('.$k2.')失败，题库id集：'.$v2.'失败原因：'.$res['info'];
    		}else{
    			$r[$k2] = '同步更新课时('.$k2.')成功,';
    		}
    		unset($param);
    	}
    	
    	$r['total'] = '数据导入总条数：'.count($library);
    	$r['fail'] = '数据导入失败条数：'.$failCount;
    	$r['success'] = '数据导入成功条数：'.$successCount;
    	save_log('import_library',$r);
    }
    
    /**
     * 获取二维数组中value对应的key
     * @param str $name
     * @param arr $class
     */
    private function getKeyByName($name,$class){
    	foreach ($class as $k => $v){
    		if($v['name'] == $name) return $v['id'];
    	}
    }
}