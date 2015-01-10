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
	
	protected  function initSelectParam(&$param){
		if($param['isLogic']!=1 ){
			$param['where'] = $this->initWhere($param['where']);
		}
		//字段
		if($param['fieldExcept']!==true) $param['fieldExcept'] = false;
		//排序
		if(!$param['sortOrder']){
			$sort = I('sort');
			if($sort) {
				$param['sortOrder'] = $sort . ' '. I('order');
			}else{
				$param['sortOrder'] = $this->sortOrder;
			}
		}
	
		//页码
		if($param['initPage'] !== true){
			list($param['page'],$param['pageSize']) = $this->getPageNum($param['page'],$param['pageSize']);
		}
	}
}