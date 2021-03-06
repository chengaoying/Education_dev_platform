<?php
/**
 * 数据模型：角色
 * @author WZH
 *
 */
namespace Common\Model;
class RoleModel extends BaseModel {	
	
	//数据验证
	protected $_validate = array(
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
 		array('userId','require','用户ID不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		array('stageId','require','段龄ID不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		//array('sex','require','用户性别不能为空！',self::MUST_VALIDATE,''), 
		array('status',array(0,1),'请选择正确的状态！',self::MUST_VALIDATE,'in'),
	);
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),			
	);
	
	//数据同步(子项)
	protected $sync = 'Role';

	//---------------扩展CRUD-----------------------
	/**
	 * 按页读取数据并把数据中的
	 * @param array $param 选择参数 格式:请参考initSelectParam方法;
	 * @param bool $isTotal 是否返回总记录数
	 */
	public function queryRole($param='',$isTotal=true){
		$this->initSelectParam($param);
		$list['rows'] = $this->where($param['where'])->field($param['field'],$param['fieldExcept'])->order($param['sortOrder'])->page($param['page'],$param['pageSize'])->select();
		if($isTotal) $list['total'] = $this->where($param['where'])->count();
		
		return $this->returnListData($list);
	}

	/**
	 * 更新缓存（全部：NO,$exKey：YES）
	 * @param string $exKey 父栏目id
	 */
	public function updateCache($exKey=''){
		$param['sortOrder'] = 'sort asc';
		$param['where'] = array('status'=>1);
		$list = D('Role')->selectPage($param);
		S('Role',$list['rows']);
	}
    
    /**
	 * 增加或减少某项值
	 * @param int $userId
	 * @param array $data
	 */
	public function setIncOrDec($roleId,$data){		
		$rows = $this->where(array('id'=>$roleId))->setField($this->getIncOrDecData($data));
		return result_data(1,'数据更新成功！',array('rows'=>$rows));
	}

}