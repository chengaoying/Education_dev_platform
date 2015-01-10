<?php
/**
 * 逻辑处理类：浏览记录
 * @author WZH
 *
 */
namespace Common\Logic;
class BrowseRecordLogic extends BaseLogic {
	
	
	/**
	 * 根据contentIdId查找浏览记录
	 * @param int $contentIdId	知识点id
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function queryBrowseRecordList($contentId, $pageNo, $pageSize){
		$param['where']['contentId']  = $contentId;
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
//		$param['sortOrder'] = 'sort asc';
		
		$data = D('RoleBrowse')->selectPage($param);
		return $data;
	}
	
	/**
	 * 根据type(浏览类型(1-视频，2-课程，3-题库),keys查找浏览记录
	 * @param int $type	浏览类型
	 * @param int &keys 关键字
	 * @param int $pageNo 页号
	 * @param int $pageSize 每页记录数
	 */
	public function queryBrowseRecordListByKeys($type, $keys, $pageNo, $pageSize)
	{
		$param['where']['type'] = $type;
		$param['where']['keys'] = $keys;
		
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
		
		$data = D('RoleBrowse')->selectPage($param);
		return $data;
	}
}