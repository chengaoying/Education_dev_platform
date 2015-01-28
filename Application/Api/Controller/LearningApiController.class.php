<?php

/**
 * 学习评价接口
 * @author WZH
 *
 */

namespace Api\Controller; 

class LearningApiController extends BaseApiController{
	
	/*
	 * 统计学习评价进度
	* @param array courseIds 当前页面的课程id
	* @param int roleId 角色id
	* @return
	*/
	public function statisticsDataPreschool($courseIds=array(),$roleId=0,$len=0)
	{
		$result = D('Learning', 'Logic')->statisticsDataPreschool($courseIds,$roleId,$len);
		return $result;
	}
	
	/*
	 * 统计分数
	* @param array courseIds 当前页面的课程id
	* @param int $roleId 角色ID
	* @return
	*/
	public function statisticsScore($stageId,$roleId=0,$type)
	{
		$result = D('Learning', 'Logic')->statisticsScore($stageId,$roleId,$type);
		return $result;
	}
}