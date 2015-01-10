<?php
/**
 * 逻辑处理类：知识点
 * @author CGY
 *
 */
namespace Common\Logic;
class TopicLogic extends BaseLogic {
	
	
	/**
	 * 根据课程id查找该课程下的知识点
	 * @param int $courseId	课程id
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function queryTopicList($courseId, $pageNo, $pageSize){
		$param['where']['courseId']  = $courseId;
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
		$param['sortOrder'] = 'sort asc';
		
		$data = D('Topic')->selectPage($param);
		return $data;
	}
	
	/**
	 * 通过知识点id查找单个知识点
	 * @param int $topicId
	 */
	public function queryTopicById($topicId){
		$data = D('Topic')->find($topicId);
		return $data;
	}
	
}