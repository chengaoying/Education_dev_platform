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
    		} 
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
    		
    		$_r = D('Section')->_saveData($v);
    		if(!$_r['status']){
    			$failCount ++;
    			$r[$k] = '记录'.$k.'导入失败，原因：'.$_r['info'];
    		}else{
    			$successCount ++;
    		} 
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
    	foreach ($resource as $k => $v){
    		$v['keyList'] = str_replace('，',',',$v['keyList']);
    		$_keys = explode(',', $v['keyList']);
    		unset($v['keyList']);
    		foreach ($_keys as $k1 => $v1){
    			$v['keyList'] .= array_search($v1, $keys).',';
    		}
    		$v['keyList'] = substr($v['keyList'], 0, strlen($v['keyList'])-1);
    		$v['addTime'] = date('Y-m-d H:i:s',NOW_TIME);
    		if(empty($v['sort'])) $v['sort'] = 0;
    		if(empty($v['status'])) $v['status'] = 1;
    		
    		$_r = D('Resource')->_saveData($v);
    		if(!$_r['status']){
    			$failCount ++;
    			$r[$k] = '记录'.$k.'导入失败，原因：'.$_r['info'];
    		}else{
    			$successCount ++;
    		} 
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
    		} 
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