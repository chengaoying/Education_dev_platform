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
			$param['where']['topicId'] = array('in',implode($topicIds,','));
		}else{
			$param['where']['topicId']  = $topicIds;
		}
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
		$param['sortOrder'] = 'sort asc';
		
		$data = D('Section')->selectPage($param);
		return $data;
	}
	
}