<?php
/**
 * 数据模型：题库
 * @author CGY
 *
 */
namespace Common\Model;
class RoleWrongLibraryModel extends BaseModel {	
	
	//数据验证
	protected $_validate = array(
	);
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),			
	);
	
	
	/**
	 * 重写像类initWhere
	 * @see Common\Model.BaseModel::initWhere()
	 */
	protected function initWhere($condition){
		if(!is_empty_null($condition['id'])) $where['id'] = $condition['id'];
		//资源商
		if(!empty($condition['rpId'])) $where['rpId'] = $condition['rpId'];
		//题库权限
		if(!is_empty_null($condition['auth'])) $where['auth'] = $condition['auth'];
		//状态
		if(!is_empty_null($condition['status'])) $where['status'] = $condition['status'];
		
		return $where;
	}
	
	public function findSection($param='',$isTotal=true){
		$this->initSelectParam($param);
		$query = '(select name from t_section where id = t_role_wrong_library.sectionId) as sectionName';
		if($param['field']){
			$findField = $param['field'].','.$query;
		}else{
			$findField = '*,'.$query;
		}
		$list['rows'] = $this->where($param['where'])->field($findField,$param['fieldExcept'])->order($param['sortOrder'])->page($param['page'],$param['pageSize'])->select();
		save_log('execute_sql',array('sql'=>$this->getLastSql()));
		if($isTotal) $list['total'] = $this->where($param['where'])->count();
		return $this->returnListData($list);
	}
	
}