<?php
/**
 * 模型处理类：产品相关配置
 * @author CGY
 *
 */
namespace Common\Model;
class ProConfigModel extends BaseModel
{
    
	//数据验证
	protected $_validate = array(
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
		array('name','require','名称不能为空！',self::MUST_VALIDATE,''),
		array('cKey','require','配置关键字不能为空！',self::MUST_VALIDATE,''),
		array('templete','require','配置文件不能为空！',self::MUST_VALIDATE,''),
		array('templete','','该模版已经配置过！',self::EXISTS_VALIDATE,'unique'),
		array('templete', 'checkTemplete', '该配置文件不存在！', self::MUST_VALIDATE,'callback', self::MODEL_INSERT),
		//array('templete,cKey', 'isSame', '配置关键字和模版文件格式不匹配！', self::MUST_VALIDATE,'callback', self::MODEL_BOTH),
	);
	
	//自动填充
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),
	);
	
	//自定义函数验证
	protected function checkTemplete($templete){
		$filename = CONF_PATH . $templete;
		if(is_file($filename)) 
			return true;
		else
			return false;
	}
	
	//自定义函数验证
	protected function isSame($data){
		$templete = $data['templete'];
		$cKey = $data['cKey'];
		$arr = explode('.', $templete);
		$t_name = $arr[0];
		if($t_name === $cKey)
			return true;
		else
			return false;
	}
	
	//---------------扩展CRUD-----------------------
	
	/**
	 * 获取一条数据
	 * @param arr $param
	 */
	public function selectOne($param){
		$param['where'] = $param;
		$data = $this->where($param)->select();
		return $data[0];
	}
	
	/**
	 * 更新缓存（全部：NO,$exKey：YES）
	 * @param string $exKey
	 */
	public function updateCache($exKey=''){
		$data = D('ProConfig')->selectPage();
		foreach ($data['rows'] as $k => $v){
			$v['content'] = unserialize($v['content']);
			S('ProConfig_'.$v['cKey'],$v);
		}
		if (!empty($exKey)) return S('ProConfig_'.$exKey);
	}
}