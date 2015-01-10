<?php
/**
 * 逻辑处理类：资源
 * @author WZH
 *
 */
namespace Common\Logic;
class ResourceLogic extends BaseLogic {
	
	
   /*
     * 根据keyList查询资源
     * @param array $keyList 查询资源
  	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
     * @param string $field 需要显示的字段
     */
	public function queryResourceListByKeyList($keyList,$pageNo, $pageSize,$field){
		
		$param['where']['keyList'] = $keyList;
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
		$param['sort'] = 'sort asc';
		$param['field'] = $field;
		$data = D('Resource')->selectPage($param);
		return $data;
	}
	
	
}