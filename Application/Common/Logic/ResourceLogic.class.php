<?php
/**
 * 逻辑处理类：资源
 */
namespace Common\Logic;
class ResourceLogic extends BaseLogic {
    
    /*
     * 根据视频id集获取资源集
     * @param array $ids 包含资源的id数组
     * @param string $field 需要查询的字段
     * @return array $data 包含资源id和资源code
     */
    public function queryResourceList($ids = array(),$field = '') {
        $param = array('where'=>array('id'=>array('in',  implode(',', $ids))),'field'=>'id,content','isLogic'=>1,'initPage'=>true);
        $resoureList = D('Resource')->selectPage($param);
        return $resoureList['rows'];
    }
    
}