<?php

/**
 * 逻辑处理类：学习评价控制
 * @author WZH
 *
 */

namespace Common\Logic;

class LearningLogic extends BaseLogic {

	/*
	 * 统计学习评价进度
	* @param array courseIds 当前页面的课程id
	* @param int roleId 角色id
	* @return
	*/
	public function statisticsDataPreschool($courseIds=array(), $roleId=0,$len=0)
	{
		if(!isset($courseIds) || empty($roleId) )
		{
			return result_data(0,'缺少参数！');
		}
		
		$topic = D('Topic') -> queryTopicByCourseIds($courseIds);
		
		$proConf = get_pro_config_content('proConfig');
		if($proConf['sectionVideo'] == 1)//此时一个课时对应一个视频，根据t_topic中lessonList字段中课时id个数判断视频总个数
		{
			foreach($topic as $key=>$value)
			{
				$total[$value['courseId']][$value['id']] = $this -> getCountOfStr($value['sectionIds']);
			}
		}
		else //此时一个课时对应多个视频，只能通过在t_section(课时表)根据topicId查数据库方式判断视频总个数。速度较慢。后来表有修改，需要修改
		{
			foreach ($topic as $key => $value)
			{
				$topicIds[] = $value['id'];
			}
			//$section = D('Section')->querySectionList($topicIds);
			$section = D('Section','Logic')->querySectionList($topicIds,1,100);
			foreach($section as $key => $value)
			{
				$total_temp[$value['topicId']] += $this -> getCountOfStr($value['lessonList']);
			}
			//组装为total['courseId']['topicId']的形式
			foreach($topic as $key=>$value)
			{
				foreach($total_temp as $k1 => $v1)
				{
					if($value['id'] == $k1)
					{
						$total[$value['courseId']][$value['id']] = $v1;
						break;
					}
				}
			}
		}
		
		/* 以下代码得到完成数 */
		//获得topiId数组
/* 		foreach($total as $k => $v)
		{
			foreach($v as $key => $value)
			{
				$finish[$k][$key] = D('RoleBrowse') -> queryBrowseRecordList($roleId, $key);
			}
		}*/
		
		if(empty($topicIds))
		{
			foreach ($topic as $key => $value)
			{
				$topicIds[] = $value['id'];
			}
		}
		$browse = D('RoleBrowse') -> queryBrowseRecordList1($roleId, $topicIds);
		if(!empty($browse)) 
		{
			foreach($browse as $key=>$value)
			{
				$finish[$value['courseId']][$value['topicId']] = $value['count'];
			}
		}

 		foreach($total as $k => $v)
		{
			foreach($v as $k1 => $v1)
			{
				if(empty($finish[$k][$k1]) || empty($total[$k][$k1]))
				{
					$progress[$k][$k1] = 0;
				}
				else if($finish[$k][$k1] > $total[$k][$k1])
				{
					$progress[$k][$k1] = 1;
				}
				else 
				{
					$progress[$k][$k1] = $finish[$k][$k1]/$total[$k][$k1];
				}
			}
		} 
		return result_data(1,'success',$progress);
	}
	
	
	/*
	 * 统计分数
	* @param array courseIds 当前页面的课程id
	* @param int $roleId 角色ID
	* @return
	*/
	public function statisticsScore($stageId,$roleId=0,$type=0)
	{
		if(empty($stageId) || empty($roleId) || empty($type))
		{
			return result_data(0,'缺少参数！');
		}
		//得到所有课程id
		$course = D('Course','Logic')->queryCourseListByType($stageId, $type,1,1000);
		foreach($course['rows'] as $key => $value)
		{
			$courseIds[] = $value['id'];
		}
		
		$data['courseScore'] = D('RoleLibrary') -> queryRoleLibraryByCourseIds($roleId, $courseIds);
		if(!empty($data['courseScore'])) 
		{
			foreach($data['courseScore'] as $key => $value)
			{
				$data['courseScore'][$value['courseId']]['sum'] = $value['sumScore'];
				$data['roleScore'] += $data['courseScore'][$value['courseId']]['sum'];
				unset($data['courseScore'][$key]);
			}
		}
		
		/* 领先排名 */
		$temp = "(";
		foreach($courseIds as $key => $value)
		{
			$temp.="$value ,";
		}
		$temp = substr($temp,0,strlen($temp)-2);
		$temp .= ")";
		
		$m=M();

		//$result = $m->query("SELECT count(*) AS `tb_count` from (SELECT count(*) FROM `t_role_library` WHERE `courseId` IN ".$temp." GROUP BY roleId) AS tb_temp "); 
		$result = $m->query("SELECT count(*) AS 'tb_count' FROM `t_role` WHERE `stageId` = ".$stageId); 
		$totalRole = $result ? $result[0]['tb_count'] : 0;//角色总数
		
		//大于等于自己总分的角色个数
		$data['roleScore'] = empty($data['roleScore']) ? 0 : $data['roleScore'];
		$result=$m->query("SELECT count(*) as tb_count from (SELECT sum(score) AS `sumScore` FROM `t_role_library` WHERE `courseId` in ".$temp." GROUP BY roleId) AS tb_sum WHERE tb_sum.sumScore>=".$data['roleScore']);
		$countRole = $result ? $result[0]['tb_count'] : 0;
		if($countRole > $totalRole) $countRole =$totalRole;
		$countRole = $totalRole - $countRole;//比自己总分少的其它角色个数
		$data['rank'] = ($totalRole-$countRole === 1) ? 1 : round($countRole/$totalRole,2);//得到领先率，countRole/totalRole 结果为小于等于1的数
		$data['rank'] *= 100;//转换成百分比
		
		return result_data(1,'success',$data);
	}
	
	/*
	 * 得到$str中以逗号分隔的字段个数
	* @param $str	要处理字符串
	* @return $count	字段个数
	*/
	private function getCountOfStr($str)
	{
		$count = 0;
		$total = explode(getDelimiterInStr($str),$str);
		foreach($total as $key => $value)
		{
			if(!empty($value))
			{
				$count++;
			}
		}
		return $count;
	}
}

