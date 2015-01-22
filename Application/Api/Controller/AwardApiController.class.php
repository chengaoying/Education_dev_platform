<?php

/**
 * 课程接口
 * @author CGY
 */

namespace Api\Controller; 

class AwardApiController extends BaseApiController{
	
	
    /**
     * 发奖品
     * @param int $userId 用户ID
     * @param int $roleId 角色ID
     * @param int $itemId 奖品ID
     * @param int $num 数量
     * @param string $info 描述
     */
    public function sendItem($userId,$roleId,$itemId,$num,$info) {
    	return D('AwardBase','Logic')->sendItem($userId,$roleId,$itemId,$num,$info);
    }
    
    /**
     * 获取奖品信息
     * @param int $awardId 奖品id
     * @return $data
     */
    public function getAwardInfo($awardId){
    	return D('AwardBase','Logic')->getAwardInfo($awardId);
    }
    
}