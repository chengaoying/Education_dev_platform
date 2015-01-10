<?php

/**
 * 知识点接口
 * @author CGY
 */

namespace Api\Controller; 

class TopicApiController extends BaseApiController{
	
	/**
	 * 根据课程id查找该课程下的知识点
	 * @param int $courseId	课程id
	   @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function queryTopicList($courseId, $pageNo, $pageSize){
		$data = D('Topic','Logic')->queryTopicList($courseId, $pageNo, $pageSize);
		return $data;
	}
	
	/**
	 * 通过知识点id查找单个知识点
	 * @param int $topicId
	 */
	public function queryTopicById($topicId){
		$data = D('Topic','Logic')->queryTopicById($topicId);
		return $data;
	}
	
}