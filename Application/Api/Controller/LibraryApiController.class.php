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
     * @return int 返回插入的最后一条数据的id
     */
    public function saveRoleLib($roleId,$data = array()) {
        return D('Library','Logic')->saveRoleLib($roleId,$data);
    }
    
    
    /**
	 * 查询角色答的错误题目
	 * @param int $roleId 角色ID
	 * @param int $topicId 知识点ID
	 * @param int $sectionId 课时ID
	 * @param int $pageNo 页号
	 * @param int $pageSize 每页记录数
	 * @return array $data 查询的数组
	 */
    public function queryRoleWrongLib($roleId,$topicId,$sectionId,$pageNo,$pageSize) {
        return D('Library','Logic')->queryRoleWrongLib($roleId,$topicId,$sectionId,$pageNo,$pageSize);
    }
    
	/**
	 * 查询题库
	 * @param int $topicId 知识点id
	 * @param int $sectionId 课程id
	 * @return array 返回题库内容
	 */
    public function queryLib($topicId,$sectionId){
        $data = D('Library','Logic')->queryLib($topicId,$sectionId);
        return $data;
    }
    
}