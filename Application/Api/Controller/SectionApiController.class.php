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
	
}