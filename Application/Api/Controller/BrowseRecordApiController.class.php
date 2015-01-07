<?php

/**
 * 知识点接口
 * @author CGY
 */

namespace Api\Controller; 

class BrowseRecordApiController extends BaseApiController{
	
	/**
	 * 根据角色id查找浏览记录
	 * @param int $roleId	角色id
	   @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function queryBrowseRecordList($roleId, $pageNo, $pageSize){
		$data = D('BrowseRecord','Logic')->queryBrowseRecordList($roleId, $pageNo, $pageSize);
		return $data;
	}
	
}