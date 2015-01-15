<?php
/**
 * 数据模型：奖品
 */
namespace Common\Model;
class AwardItemModel extends BaseModel {	
	
	//数据验证
	protected $_validate = array(
		//插入
		array('name','require','奖品标题不能为空',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		array('aType',array(0,1,2),'奖品类型不能为空',self::MUST_VALIDATE,'in',self::MODEL_INSERT),
		//更新
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
		array('name','require','奖品标题不能为空',self::EXISTS_VALIDATE,'',self::MODEL_UPDATE),
		array('aType',array(0,1,2),'奖品类型不能为空',self::EXISTS_VALIDATE,'in',self::MODEL_UPDATE),
		//全部
	);
		
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),
		array('modTime',DATE_TIME,self::MODEL_BOTH),	
	);

		
	//---------------扩展CRUD-----------------------
		
	/**
	 * 重写像类initWhere
	 * @see Common\Model.BaseModel::initWhere()
	 */
	protected function initWhere($condition){
		if(!is_empty_null($condition['id'])) $where['id'] = $condition['id'];	
		if(!is_empty_null($condition['aType'])) $where['aType'] = $condition['aType'];	
		return $where;
	}
	
		
	
	/**
	 * 更新缓存（全部：YES,$exKey：NO）
	 */
	
	public function updateCache(){
		$list = $this->where('status=1')->order('id')->select();
        $data = array();
		foreach($list as $key=>$row){
			$data[$row['id']] = $row;
		}
		S('AwardItem',$data);
	}
	
}