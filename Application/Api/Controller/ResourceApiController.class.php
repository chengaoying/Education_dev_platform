<?php

/**
 * 资源接口
 * @author WZH
 */

namespace Api\Controller; 

class ResourceApiController extends BaseApiController{
	
   /*
     * 根据keyList查询资源
     * @param array $keyList 查询资源
  	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
     * @param string $field 需要显示的字段
     */
	public function queryResourceListByKeyList($keyList,$pageNo, $pageSize,$field){
		$data = D('Resource','Logic')->queryResourceListByKeyList($keyList,$pageNo, $pageSize,$field);
		return $data;
	}
    
     /*
     * 根据视频id集获取资源集
     * @param array $ids 包含资源的id数组
     * @param string $field 需要查询的字段
     * @return array $data 包含资源id和资源code
     */
    public function queryResourceList($ids = array(),$field = '') {
        $data = D('Resource','Logic')->queryResourceList($ids,$field);
        return $data;
    }
	
}