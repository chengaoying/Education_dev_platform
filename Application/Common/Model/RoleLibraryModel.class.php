<?php
/**
 * 数据模型：题库
 * @author CGY
 *
 */
namespace Common\Model;
class RoleLibraryModel extends BaseModel {	
	
	//数据验证
	protected $_validate = array(
	);
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),			
	);
	
	public function queryRoleLibraryByCourseIds($roleId=0,$courseIds)
	{
		$where['roleId'] = $roleId;
		$where['courseId'] = array('in',$courseIds);
		//$result = $this->where($where)->field(array('courseId','topicId',"count(*)"=>"count"))->group('topicId')->select();
		$result = $this->where($where)->field(array('courseId',"sum(score)"=>"sumScore")) ->group('courseId')->select();
		return $result;
	}
	
	public function queryRoleLibraryCount($roleId=0,$courseIds)
	{
		$where['roleId'] = $roleId;
		$where['topicId'] = array('in',$courseIds);
		//$result = $this->where($where)->field(array('courseId','topicId',"count(*)"=>"count"))->group('topicId')->select();
		//$result = $this->query("select *  from t_user where id >50");
		//save_log('callapi',array('api'=>$this->getLastSql()));
		return $result;
	}
}