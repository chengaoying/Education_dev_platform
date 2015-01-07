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
	
	
// 	/**
// 	 * 重写像类initWhere
// 	 * @see Common\Model.BaseModel::initWhere()
// 	 */
// 	protected function initWhere($condition){
// 		if(!empty($condition['sectionId'])) $where['sectionId'] = $condition['sectionId'];
// 		return $where;
// 	}
	
	public function findSection($param='',$isTotal=true){
		$this->initSelectParam($param);
		$query = '(select name from t_section where id = t_role_wrong_library.sectionId) as sectionName';

		if($param['field']){
			$findField = $param['field'].','.$query;
		}else{
			$findField = '*,'.$query;
		}
		$list['rows'] = $this->where($param['where'])->field($findField,$param['fieldExcept'])->order($param['sortOrder'])->select();
		save_log('execute_sql',array('sql'=>$this->getLastSql()));
		if($isTotal) $list['total'] = $this->where($param['where'])->count();
		return $this->returnListData($list);
	}
	
}