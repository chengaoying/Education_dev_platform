<?php

/**
 * 题目接口
 * @author CGY
 */

namespace Api\Controller; 

class LibraryApiController extends BaseApiController{
    
    /**
     * 保存角色答的题目
     * @param int $roleId 角色ID
     * @param array $data 需要保存的数组数据包含（$topicId,$sectionId,$libId,$correct,$wrong）
     * @param int $topicId 知识点id
     * @param int $sectionId 课时ID
     * @param int $libId  题目ID
     * @param int $correct 正确答案
     * @param int $wrong 错误答案
     * @return array
     */
    public function saveRoleLib($roleId,$data = array()) {
        return D('Library','Logic')->saveRoleLib($roleId,$data);
    }
    
    
    /**
	 * 查询角色答的错误题目
	 * @param int $roleId 角色ID
	 * @param int $topicId 知识点ID
	 * @param int $sectionId 课时ID
	 * @param int $s_pageNo 课时页号
     * @param int $s_pageSize 课时每页记录数
     * @param int $l_pageNo 题目页号
     * @param int $l_pageSize 题目每页记录数
	 * @return array $data 查询的数组
	 */
    public function queryRoleWrongLib($roleId,$topicId,$sectionId,$s_pageNo,$index,$s_pageSize,$l_pageNo,$l_pageSize) {
        return D('Library','Logic')->queryRoleWrongLib($roleId,$topicId,$sectionId,$s_pageNo,$index,$s_pageSize,$l_pageNo,$l_pageSize,true);
    }
    
	/**
	 * 查询题库
	 * @param int $sectionId 课程id
	 * @return array 返回题库内容
	 */
    public function queryLib($sectionId){
        $data = D('Library','Logic')->queryLib($sectionId);
        return $data;
    }
    
    /**
     * 查询该$sectionId的题库信息
     * @param int $sectionId
     */
    public function queryLibraryInfo($sectionId){
        $data = D('Library','Logic')->queryLibraryInfo($sectionId);
        return $data;
    }
    
}