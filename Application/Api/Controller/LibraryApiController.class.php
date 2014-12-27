<?php

/**
 * 题目接口
 * @author CGY
 */

namespace Api\Controller; 

class LibraryApiController extends BaseApiController{
    
    /*
     * 保存角色答的题目
     * @param int $roleId 角色ID
     * @param array $data 需要保存的数组数据包含（$sectionId,$libId,$correct,$wrong）
     * @param int $sectionId 课时ID
     * @param int $libId  题目ID
     * @param int $correct 正确答案
     * @param int $wrong 错误答案
     * @return int $status 保存状态 
     */
    public function saveRoleLib($roleId,$data = array()) {
        return D('Library','Logic')->saveRoleLib($roleId,$data = array());
    }
    
    
    /*
     * 查询角色答的错误题目
     * @param int $roleId 角色ID
     * @param int $sectionId 课时ID
     * @param int $pageNo 页号
     * @param int $pageSize 每页记录数
     * @return array $data 查询的数组
     */
    public function queryRoleWrongLib($roleId,$sectionId,$pageNo,$pageSize) {
        return D('Library','Logic')->queryRoleWrongLib($roleId,$sectionId,$pageNo,$pageSize);
    }
    
    /**
     * 查询题库
     * @param unknown_type $sectionId
     */
    public function queryLib($sectionId){
        return D('Library','Logic')->queryLib($sectionId);
    }
    
}