<?php

/**
 * 积分规则接口
 * @author WZH
 *
 */

namespace Api\Controller; 

class CreditRuleApiController extends BaseApiController{
	
	
	/**
	 * 通过RuleKey查询积分规则
	 * @param string $ruleKey
	 * @return result
	 */
	public function selectOneByRuleKey($ruleKey){
		$where['key'] = $ruleKey; 
		$result = D('CreditRule')->selectOne($where);
		return $result;
	}
	
}