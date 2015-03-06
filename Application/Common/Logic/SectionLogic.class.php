<?php
/**
 * 逻辑处理类：课时
 * @author CGY
 *
 */
namespace Common\Logic;
class SectionLogic extends BaseLogic {
	
	
	/**
	 * 根据知识点id查找该知识点下的课时列表
	 * @param arr $topicId	知识点id数组
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function querySectionList($topicIds, $pageNo, $pageSize){
		if(is_array($topicIds)){
			foreach ($topicIds as $k => $v){
				$param['where']['_string'] .= ' (`topicId` like "%'.$v.'%") OR';
			}
			$param['where']['_string'] = substr($param['where']['_string'],0,strlen($param['where']['_string'])-2);
		}else{
			$param['where']['_string'] .= ' (`topicId` like "%'.$topicIds.'%")';
		}
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
		$param['sortOrder'] = 'sort asc';
		
		$data = D('Section')->selectPage($param);
		return $data;
	}
	
	/**
	 * 根据课时id数组查找该知识点下的课时列表
	 * @param arr $sectionIds 课时id数组
	 * @param int $pageNo 页号
	 * @param int $pageSize 每页记录数
	 */
	public function querySectionListBySectionIds($sectionIds, $pageNo, $pageSize){
		$param['where']['id'] = array('in',implode($sectionIds,','));
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
		$param['sortOrder'] = 'sort asc';
		
		$data = D('Section')->selectPage($param);
		return $data;
	}
	
	/**
	 * 根据知识点id查找该知识点下的课时列表
	 * @param arr $topicId	知识点id数组
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function querySectionListByPrivilege($privilege, $pageNo, $pageSize){
		if(is_array($privilege)){
			$param['where']['privilege'] = array('in',implode($privilege,','));
		}else{
			$param['where']['privilege']  = $privilege;
		}
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
		$param['sortOrder'] = 'sort asc';
		
		$data = D('Section')->selectPage($param);
		return $data;
	}
	
	/**
	 * 根据知识点id查找该知识点下的课时列表
	 * @param arr $topicId	知识点id数组
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function querySectionListBySort($topicIds,$sorts,$pageNo=1, $pageSize=3){
		$param['where']['sort'] = array('in',implode($sorts,','));
		$param['where']['topicId'] = array('in',implode($topicIds,','));
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
		$param['sortOrder'] = 'sort asc';
		
		$data = D('Section')->selectPage($param);
		return $data;
	}
	
}