<?php
/**
 * 数据模型：积分控制
 * author wzh
 */
namespace Common\Model;
class CreditModel extends BaseModel {	
	
	//默认排序字段
	protected  $sortOrder = 'id desc';
	
	//数据验证
	protected $_validate = array(
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
        //全部
        array('keyName','require','积分KEY不能为空',self::MUST_VALIDATE,''),
        array('keyName','','积分KEY已存在！',self::MUST_VALIDATE,'unique'),
		array('name','require','名称不能为空',self::MUST_VALIDATE,''),
	);
	
	//自动填充	
	protected $_auto = array(
        array('addTime',DATE_TIME,self::MODEL_INSERT),
		array('modTime',DATE_TIME,self::MODEL_BOTH),	
	);
    
    /* (non-PHPdoc)
	 * @see Common\Model.BaseModel::initWhere()
	 */
	protected function initWhere($condition) {
		if(!is_empty_null($condition['id'])) $where['id'] = $condition['id'];
		if($condition['keyName']) $where['keyName'] = $condition['keyName'];
		if(in_array($condition['status'],array('0','1'))) $where['status'] = $condition['status'];
		return $where;
	}
	
	/**
	 * 更新缓存（全部：NO,$exKey：YES）
	 * $exKey = proId（有效状态）
	 */
	
	public function updateCache(){
		$list = $this->where('status=1')->select();
        $data = array();
        foreach ($list as $key => $value) {
            $data[$value['id']] = $value;          
        }
        S('Credit',$data);
        return $data;
	}
	
	
}