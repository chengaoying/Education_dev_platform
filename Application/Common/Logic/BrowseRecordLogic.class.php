<?php
/**
 * 逻辑处理类：知识点
 * @author CGY
 *
 */
namespace Common\Logic;
class BrowseRecordLogic extends BaseLogic {
	
	
	/**
	 * 根据角色id查找浏览记录
	 * @param int $roleId	角色id
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function queryBrowseRecordList($roleId, $pageNo, $pageSize){
		$param['where']['roleId']  = $roleId;
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
//		$param['sortOrder'] = 'sort asc';
		
		$data = D('RoleBrowse')->selectPage($param);
		return $data;
	}
	
}