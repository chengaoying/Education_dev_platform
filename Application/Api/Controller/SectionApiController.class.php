<?php

/**
 * 课时接口
 * @author CGY
 */

namespace Api\Controller; 

class SectionApiController extends BaseApiController{
	
	/**
	 * 根据课时id查找单个课时
	 * @param int $sectionId
	 */
	public function querySectionById($sectionId){
		return D('Section')->find($sectionId);
	}
	
	/**
	 * 根据知识点id查找该知识点下的课时列表
	 * @param arr $topicId	知识点id数组
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function querySectionList($topicIds, $pageNo, $pageSize){
		$data = D('Section','Logic')->querySectionList($topicIds, $pageNo, $pageSize);
		return $data;
	}
	
	/**
	 * 根据课时id数组查找该知识点下的课时列表
	 * @param arr $sectionIds 课时id数组
	 * @param int $pageNo 页号
	 * @param int $pageSize 每页记录数
	 */
	public function querySectionListBySectionIds($sectionIds, $pageNo, $pageSize){
		$data = D('Section','Logic')->querySectionListBySectionIds($sectionIds, $pageNo, $pageSize);
		return $data;
	}
	
	/**
	 * 根据privilege(免费/收费)查找该知识点下的课时列表
	 * @param arr $topicId	知识点id数组
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function querySectionListByPrivilege($privilege, $pageNo, $pageSize){
		$data = D('Section','Logic')->querySectionListByPrivilege($privilege, $pageNo, $pageSize);
		return $data;
	}
	
	
	/**
	 * 根据知识点id查找相邻的两个视频
	 * @param arr $topicIds	知识点id数组
	 * @param arr $sorts	排序id数组
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function querySectionListBySort($topicIds,$sorts,$pageNo, $pageSize){
		$data = D('Section','Logic')->querySectionListBySort($topicIds,$sorts,$pageNo, $pageSize);
		return $data;
	}
	
}