<?php
/**
 * 数据模型：课时
 * @author CGY
 *
 */
namespace Common\Model;
class SectionModel extends BaseModel {	
	
	//数据验证
	protected $_validate = array(
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
		array('name','require','名称不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		array('topicId','require','知识点不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		array('status',array(0,1),'请选择正确的状态！',self::MUST_VALIDATE,'in',self::MODEL_INSERT),
	);
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),			
	);

	//---------------扩展CRUD-----------------------
	
	/*
	 * 根据topicId 查询
	 * @param array $topicIds;
	 */
	public function querySectionList($topicIds)
	{
		$where['topicId'] = array('in',$topicIds);
		$result = $this->where($where)->select();
//		save_log('callapi',array('api'=>$this->getLastSql()));
		return $result;
	}
}