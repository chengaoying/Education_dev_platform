<?php
/**
 * 数据模型：积分规则
 * author wzh
 */
namespace Common\Model;
class CreditRuleModel extends BaseModel {	
	
	//默认排序字段
	protected  $sortOrder = 'id desc';
	
	//数据验证
	protected $_validate = array(
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
        //全部
        array('creditId','require','积分类型ID不能为空',self::MUST_VALIDATE,''),
        array('keyName','require','规则KEY不能为空',self::MUST_VALIDATE,''),
        array('keyName','','规则KEY已存在！',self::MUST_VALIDATE,'unique'),
        array('name','require','名称不能为空',self::MUST_VALIDATE,''),
        array('timeType','require','时间类型不能为空',self::MUST_VALIDATE,''),
        array('timeNum','require','时间长度不能为空',self::MUST_VALIDATE,''),
        array('ruleTypeNum','require','次数上限不能为空',self::MUST_VALIDATE,''),
        array('creditNum','require','积分数量不能为空',self::MUST_VALIDATE,''),
        array('ruleType','require','积分规则类型不能为空',self::MUST_VALIDATE,''),
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
        if(!is_empty_null($condition['creditId'])) $where['creditId'] = $condition['creditId'];
		if($condition['keyName']) $where['keyName'] = $condition['keyName'];
        if($condition['name']) $where['name'] = $condition['name'];
        if(in_array($condition['ruleType'],array('1','2'))) $where['ruleType'] = $condition['ruleType'];
		if(in_array($condition['status'],array('0','1'))) $where['status'] = $condition['status'];
		return $where;
	}
	
	/**
	 * 更新缓存（全部：NO,$exKey：YES）
	 * $exKey = proId（有效状态）
	 */
	
	public function updateCache(){
		$list = $this->where('status=1')->select();
        S('CreditRule',$list);
        return $list;
	}
	
	
}