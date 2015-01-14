<?php
/**
 * 数据模型：产品计费模式
 * @author CGY
 *
 */
namespace Common\Model;
class ChargeModeModel extends BaseModel {	
	
	//数据验证
	protected $_validate = array(
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
		array('name','require','计费模式名称不能为空！',self::MUST_VALIDATE,''),
		array('type','require','计费模式类型不能为空！',self::MUST_VALIDATE,''),
		array('chargeId','require','计费id不能为空！',self::MUST_VALIDATE,''),
		array('status',array(0,1),'请选择正确的状态！',self::MUST_VALIDATE,'in'),
	);
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),			
	);

	//数据同步(子项)
	protected $sync = 'ChargeMode';
	
	//---------------扩展CRUD-----------------------
	
	/**
	 * 更新缓存（全部：NO,$exKey：YES）
	 * @param string $exKey 父栏目id
	 */
	public function updateCache($exKey=''){
		$param['where'] = array('status'=>1);
		$list = D('ChargeMode')->selectPage($param);
		foreach ($list['rows'] as $k => $v){
			$data[$v['id']] = $v;
		}
		S('ChargeMode',$data);
	}
}