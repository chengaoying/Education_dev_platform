<?php
/**
 * 逻辑处理类：课程
 * @author CGY
 *
 */
namespace Common\Logic;
class CourseLogic extends BaseLogic {
	
	
	/**
	 * 查询用户订购的单个课程
	 * @param int $roleId	角色id
	 * @param int $courseId 课程id
	 * @param int $pageNo 	页号
	 * @param int $pageSize 每页记录数
	 */
	public function queryUserCourseByCourseId($userId, $courseId, $pageNo, $pageSize){
		
	}
	
	/**
	 * 查询用户购买的课程列表
	 * @param int $userId	用户id
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function queryUserCourseList($userId, $pageNo, $pageSize){
		$param['where']['userId'] = $userId;
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
		
		$data = D('RoleCourse')->selectPage($param);
		return $data;
	}
	
	/**
	 * 通过关键字查询课程列表
	 * @param int $stageId	龄段id
	 * @param int $keys		关键字id
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function queryCourseListByKeys($stageId, $keys, $pageNo, $pageSize){
		$param['where']['stageIds'] = $stageId;
		$param['where']['keys']    	= $keys;
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
		$param['sortOrder'] = 'sort asc';
		
		if(empty($pageNo) && empty($pageSize))//当pageNo,pageSize都为空，则查出所有的数据，即不走baseModel中分页查找分支
		{
			$param['initPage'] = true;
		}
		
		$data = D('Course')->selectPage($param);
		return $data;
	}
	
	/**
	 * 推荐课程查询(有帐号的课程推荐):
	 * 早教：关键字（特别推荐一/特别推荐二）,角色月龄对应的课程
	 * 幼教：关键字（特别推荐一/特别推荐二）,当前周数对应的课程
	 * 小学以上：关键字（特别推荐一/特别推荐二），
	 * @param int $stageId	龄段id
	 * @param array $param  查询参数	格式：array('key'=>'月龄/周'),(推荐课程的关键字=>课程的月龄（早教）/课程的周数（幼教）)
	 */
	public function queryRecommendCourse($stageId, $keys){
		$param['where']['stageIds'] = $stageId;
		foreach ($keys as $k => $v){
			$param['where']['keys'] = $k;
			$param['where']['name'] = $v;
			$param['page'] 		= 1;
			$param['pageSize'] 	= 1;
			$param['sortOrder'] = 'sort asc';
			$_data = D('Course')->selectPage($param);
			$data[$k] = $_data['rows'][0];
			unset($param['where']['keys']);
			unset($param['where']['name']);
		}
		return $data;
	}
	
	/**
	 * 推荐课程查询:(游客的课程推荐):
	 * @param array $keys  关键字数组，格式：array(k1,k2,k3).k1为特别推荐一，k2为特别推荐二，k3为一般推荐
	 */
	public function queryRandomRecommendCourse($keys){
		$param['page'] 		= 1;
		$param['pageSize'] 	= 10;
		$param['sortOrder'] = 'sort asc';
		
		for($i=0; $i<count($keys); $i++){
			$param['where']['keys'] = $keys[$i];
			if($i<2){
				$_data = D('Course')->selectPage($param);
				$r = rand(0, count($_data['rows'])-1);
				$data[$keys[$i]] = $_data['rows'][$r];
			}else{
				$_data = D('Course')->selectPage($param);
				$r = getRandNumber(0, count($_data['rows'])-1, 4);
				$data[$keys[$i]][0] = $_data['rows'][$r[0]];
				$data[$keys[$i]][1] = $_data['rows'][$r[1]];
				$data[$keys[$i]][2] = $_data['rows'][$r[2]];
				$data[$keys[$i]][3] = $_data['rows'][$r[3]];
			}
			unset($param['where']['keys']);
			unset($_data);
		}
		
		return $data;
	}
	
	/**
	 * 通过顶级分类（二级栏目）查询课程列表
	 * @param int $chId		分类（栏目）id
	 * @param int $pageNo	页号
	 * @param int $pageSize	每页记录数
	 */
	public function queryCourseListByChId($chId, $pageNo, $pageSize){
		$param['where']['chId']  = $chId;
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
		$param['sortOrder'] = 'sort asc';
	
		$data = D('Course')->selectPage($param);
		return $data;
	}
	
	/**
	 * 通过课程id查找单个课程
	 * @param int $courseId
	 */
	public function queryCourseById($courseId){
		$data = D('Course')->find($courseId);
		return $data;
	}
	
	/**
	 * 通过课程类型查询课程列表
	 * @param unknown_type $stageId 龄段id
	 * @param unknown_type $types 课程类型
	 * @param unknown_type $pageNo 页号
	 * @param unknown_type $pageSize 每页记录数
	 */
	public function queryCourseListByType($stageId, $types, $pageNo, $pageSize){
		$param['where']['stageIds']  = $stageId;
		if(is_array($types)){
			$param['where']['typeId']    = array('in',implode($types, ','));
		}else{
			$param['where']['typeId']    = $types;
		}
		$param['page'] 		= $pageNo;
		$param['pageSize'] 	= $pageSize;
		$param['sortOrder'] = 'sort asc';
	
		if(empty($pageNo) && empty($pageSize))//当pageNo,pageSize都为空，则查出所有的数据，即不走baseModel中分页查找分支
		{
			$param['initPage'] = true;
		}
		
		$data = D('Course')->selectPage($param);
		return $data;
	}
	
}