<?php
/**
 * 数据模型：课程
 * @author CGY
 *
 */
namespace Common\Model;
class CourseModel extends BaseModel {	
	
	//数据验证
	protected $_validate = array(
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
		array('name','require','课程名称不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		array('chId','require','顶级分类不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		array('typeId','require','课程类型不能为空！',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		array('status',array(0,1),'请选择正确的状态！',self::MUST_VALIDATE,'in',self::MODEL_INSERT),
	);
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),			
	);

	//---------------扩展CRUD-----------------------
	/**
	 * 按页读取数据并把数据中的
	 * @param array $param 选择参数 格式:请参考initSelectParam方法;
	 * @param bool $isTotal 是否返回总记录数
	 */
	public function queryCourse($param='',$isTotal=true){
		$this->initSelectParam($param);
		$list['rows'] = $this->where($param['where'])->field($param['field'],$param['fieldExcept'])->order($param['sortOrder'])->page($param['page'],$param['pageSize'])->select();
		if($isTotal) $list['total'] = $this->where($param['where'])->count();
		
		//把栏目id,出版社id,类型,册数,科目id,标签,关键字id,龄段id,转换成名称在首页显示
		$channels = get_cache('Channel');
		$stages   = get_cache('Stage');
		$proConf  = get_pro_config_content('proConfig');
		foreach ($list['rows'] as $k=>$v){
			$list['rows'][$k]['pressId'] = $proConf['press'][$v['pressId']];
			$list['rows'][$k]['typeId']  = $proConf['courseType'][$v['typeId']];
			$list['rows'][$k]['session']  = $proConf['session'][$v['session']];
			$list['rows'][$k]['subject'] = $proConf['subject'][$v['subject']];
			
			$c = explode(',', $v['chId']);
			$c = array_filter($c);
			if(count($c)>0){
				foreach ($c as $k3=>$v3){
					$_c .= $channels[$v3]['name'].',';
				}
				$list['rows'][$k]['chId'] = $_c;
				unset($_c);
			}
			unset($keys);
			
			$keys = explode(',', $v['keys']);
			$keys = array_filter($keys);
			if(count($keys)>0){
				foreach ($keys as $k1=>$v1){
					$_keys .= $proConf['keys'][$v1].',';
				}
				$list['rows'][$k]['keys'] = $_keys;
				unset($_keys);
			}
			unset($keys);
			
			$s = explode(',', $v['stageIds']);
			$s = array_filter($s);
			if(count($s)>0){
				foreach ($s as $k2=>$v2){
					$_stages .= $stages[$v2]['name'].',';
				}
				$list['rows'][$k]['stageIds']	= $_stages;
				unset($_stages);
			}
			unset($s);
		}
		return $this->returnListData($list);
	}
	
	
	/**
	 * 处理筛选条件
	 * 1.处理空值
	 * 2.关键字匹配
	 */
	protected function initWhere($where){
		//处理空值
		foreach ($where as $k=>$v){
			if($v == '') unset($where[$k]);
		}
		
		//关键字匹配
		if(is_array($where['keys'])){
			$where['_string'] = '(';
			for($i=0;$i<count($where['keys']);$i++){
				$where['_string'] .= ' (`keys` like "%'.$where['keys'][$i].'%") OR';
			}
			$where['_string'] = substr($where['_string'],0,strlen($where['_string'])-2);
			$where['_string'] .= ') ';
		}else{
			$where['_string'] .= '(`keys` like "%'.$where['keys'].'%") ';
		}
		
		//顶级分类匹配
		if($where['chId'])
			$where['_string'] .= ($where['_string'] ? 'and' : '') . ' find_in_set("'.$where['chId'].'",chId)';
		
		//龄段匹配
		if($where['stageIds'])
			$where['_string'] .= ($where['_string'] ? 'and' : '') . ' find_in_set("'.$where['stageIds'].'",stageIds)';
		
		//课程名称匹配
		if($where['name'])
			$where['_string'] .= ($where['_string'] ? 'and' : '') . ' (`name` like "%'.$where['name'].'%")';
		
		unset($where['keys']);
		unset($where['chId']);
		unset($where['stageIds']);
		unset($where['name']);
		
		return $where;
	}
}