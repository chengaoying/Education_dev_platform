<?php

/**
 * 题目接口
 * @author CGY
 */

namespace Api\Controller; 

class ResourceApiController extends BaseApiController{
    
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