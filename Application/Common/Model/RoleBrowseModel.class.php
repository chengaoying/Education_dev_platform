<?php
/**
 * 数据模型浏览记录
 * @author WZH
 *
 */
namespace Common\Model;
class RoleBrowseModel extends BaseModel {	
	
	//数据验证
	protected $_validate = array(
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
		array('roleId','require','角色id不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		array('title','require','title不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		array('sectionId','','该浏览记录已经存在已存在！',self::EXISTS_VALIDATE,'unique'),
	);
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_BOTH),			
	);


	/**
	 * 处理筛选条件
	 * 1.处理空值
	 * 2.关键字匹配
	 */
	protected function initWhere($where){
		//处理空值
		foreach ($where as $k=>$v){
			if($v === '') unset($where[$k]);
		}
	
		//关键字匹配
		if(!empty($where['keys']))
		{
			if(is_array($where['keys'])){
				$where['_string'] = '(';
				for($i=0;$i<count($where['keys']);$i++){
					$where['_string'] .= ' (`keys` like "%'.$where['keys'][$i].'%") OR';
				}
				$where['_string'] = substr($where['_string'],0,strlen($where['_string'])-2);
				$where['_string'] .= ') ';
			}else{
				$where['_string'] .= '(`keys` like "%'.$where['keys'].'%") ';
			}
		}

		
		if(!empty($where['addTime']))
		{
			$where['_string'] .= ($where['_string'] ? 'AND' : '') . ' (`addTime` between "'. $where['addTime'][0] .'" and "'. $where['addTime'][1] .'")';
		}
	
		unset($where['keys']);
		unset($where['addTime']);
			
		return $where;
	}
	
	/*
	 * 根据topicId 查询
	* @param array $topicIds;
	*/
	public function queryBrowseRecordList($roleId=0,$topicId=0)
	{
		$where['roleId'] = $roleId;
		$where['topicId'] = $topicId;
		$count = $this->where($where)->count();
//		save_log('callapi',array('api'=>$this->getLastSql()));
		return $count;
	}
	/*
	 * 根据topicId 查询
	* @param array $topicIds;
	*/
	public function queryBrowseRecordList1($roleId=0,$topicIds)
	{
		$where['roleId'] = $roleId;
		$where['topicId'] = array('in',$topicIds);
		$result = $this->where($where)->field(array('courseId','topicId',"count(*)"=>"count"))->group('topicId')->select();
		//save_log('callapi',array('api'=>$this->getLastSql()));
		return $result;
	}
}