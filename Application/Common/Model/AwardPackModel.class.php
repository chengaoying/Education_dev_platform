<?php
/**
 * 数据模型：奖项
 */
namespace Common\Model;
class AwardPackModel extends BaseModel {	
	protected $sortOrder = 'id asc'; //排序
	
	//数据验证
	protected $_validate = array(
		//插入
		array('name','require','奖项名称不能为空',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		array('items','require','奖品列表不能为空',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		//更新
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
		array('name','require','奖项名称不能为空',self::EXISTS_VALIDATE,'',self::MODEL_UPDATE),
		array('items','require','奖品列表不能为空',self::EXISTS_VALIDATE,'',self::MODEL_UPDATE),
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
		return $where;
	}
	
	public function saveData($data){
		if(is_array($data['items'])) $data['items'] = serialize($data['items']);
		return parent::saveData($data);
	}
	
	/**
	 * 更新缓存（全部：NO,$exKey：YES）
	 * $exKey = proId(有效状态) 	 
	 */	
	public function updateCache($exKey=''){
		$list = $this->where('status=1')->order($this->sortOrder)->select();
        $data = array();
		foreach($list as $key=>$row){
            $data[$row['id']] = $row;
		}
        S('AwardPack',$data);
        return $data;
	}
	
}