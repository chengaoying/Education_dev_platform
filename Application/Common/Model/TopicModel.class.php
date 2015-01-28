<?php
/**
 * 数据模型：知识点
 * @author CGY
 *
 */
namespace Common\Model;
class TopicModel extends BaseModel {	
	
	//数据验证
	protected $_validate = array(
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
		array('name','require','名称不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		array('courseId','require','课程不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		//array('sectionIds','require','课时ID列表不能为空！',self::MUST_VALIDATE,''),
		array('status',array(0,1),'请选择正确的状态！',self::MUST_VALIDATE,'in',self::MODEL_INSERT),
	);
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),			
	);

	public function queryTopicByCourseIds($courseIds=array())
	{
		$where['_string'] = '(';
		for($i=0;$i<count($courseIds);$i++){
			$where['_string'] .= ' (`courseId` = '.$courseIds[$i].') OR';
		}
		$where['_string'] = substr($where['_string'],0,strlen($where['_string'])-2);
		$where['_string'] .= ') ';
		
		$result = $this->where($where)->select();
		//save_log('callapi',array('api'=>$this->getLastSql()));
		return $result;
	}
}