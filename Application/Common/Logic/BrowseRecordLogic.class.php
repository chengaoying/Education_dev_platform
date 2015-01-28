<?php
/**
 * 逻辑处理类：浏览记录
 * @author WZH
 *
 */
namespace Common\Logic;
class BrowseRecordLogic extends BaseLogic {
	
	
	/**
	 * 保存浏览记录
	 * @param arr $param
	 */
	public function saveBrowseRecord($param){
		$data = D('RoleBrowse')->saveData($param);
		return $data;
	}
	
	/**
	 * 根据知识点id查找浏览记录
	 * @param int $topicId	知识点id
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function queryBrowseRecordList($roleId, $topicId, $pageNo, $pageSize){
		$param['where']['topicId']  = $topicId;
		$param['where']['roleId']  = $roleId;
		
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
		if(empty($pageNo) && empty($pageSize))//当pageNo,pageSize都为空，则查出所有的数据，即不走basemode中分页查找分支
		{
			$param['initPage'] = true;
		}
		
		$data = D('RoleBrowse')->selectPage($param);
		return $data;
	}
	
	/**
	 * 根据角色id查找最近浏览记录
	 * @param int $roleId 角色id
	 * @param int $pageNo 页号
	 * @param int $pageSize 每页记录数
	 */
	public function queryBrowseRecordListRecentlyWatch($roleId, $pageNo, $pageSize){
		$param['where']['roleId']  = $roleId;
		
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
		if(empty($pageNo) && empty($pageSize))//当pageNo,pageSize都为空，则查出所有的数据，即不走baseModel中分页查找分支
		{
			$param['initPage'] = true;
		}
		$param['sortOrder'] = 'addTime desc';
		
		$data = D('RoleBrowse')->selectPage($param);
		return $data;
	}
	
	/**
	 * 根据type(浏览类型(1-视频，2-课程，3-题库),keys查找浏览记录
	 * @param int $roleId 角色id
	 * @param int $type	浏览类型
	 * @param int &keys 关键字
	 * @param int $pageNo 页号
	 * @param int $pageSize 每页记录数
	 */
	public function queryBrowseRecordListByKeys($roleId, $type, $keys, $date, $pageNo, $pageSize)
	{
		$param['where']['roleId'] = $roleId;
		$param['where']['type'] = $type;
		$param['where']['keys'] = $keys;
		$param['where']['addTime'] = $date;
		
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
		if(empty($pageNo) && empty($pageSize))//当pageNo,pageSize都为空，则查出所有的数据，即不走baseModeL中分页查找分支
		{
			$param['initPage'] = true;
		}
		
		$data = D('RoleBrowse')->selectPage($param);
		return $data;
	}
}