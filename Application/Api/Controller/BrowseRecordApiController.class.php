<?php

/**
 * 浏览记录接口
 * @author WZH
 */

namespace Api\Controller; 

class BrowseRecordApiController extends BaseApiController{
	
	/**
	 * 保存浏览记录
	 * @param arr $param
	 */
	public function saveBrowseRecord($param){
		$data = D('BrowseRecord','Logic')->saveBrowseRecord($param);
		return $data;
	}
	
	/**
	 * 根据知识点id查找浏览记录
	 * @param int $roleId 知识点$roleId
	 * @param int $topictId 知识点id
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function queryBrowseRecordList($roleId, $topictId, $pageNo, $pageSize){
		$data = D('BrowseRecord','Logic')->queryBrowseRecordList($roleId, $topictId, $pageNo, $pageSize);
		return $data;
	}
	
	/**
	 * 根据角色id查找最近浏览记录
	 * @param int $roleId 角色id
	 * @param int $pageNo 页号
	 * @param int $pageSize 每页记录数
	 */
	public function queryBrowseRecordListRecentlyWatch($roleId, $pageNo, $pageSize){
		$data = D('BrowseRecord','Logic')->queryBrowseRecordListRecentlyWatch($roleId, $pageNo, $pageSize);
		return $data;
	}
	
	/**
	 * 根据type(浏览类型(1-视频，2-课程，3-题库),keys查找浏览记录
	 * @param int $roleId 角色id
	 * @param int $type	浏览类型
	 * @param int &keys 关键字
	 * @param array date 日期范围
	 * @param int $pageNo 页号
	 * @param int $pageSize 每页记录数
	 */
	public function queryBrowseRecordListByKeys($roleId, $type, $keys, $date,$pageNo, $pageSize)
	{
		$data = D('BrowseRecord','Logic') -> queryBrowseRecordListByKeys($roleId, $type, $keys, $date,$pageNo, $pageSize);;
		return $data;
	}
	
}