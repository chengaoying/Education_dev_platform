<?php
/**
 * 数据模型：栏目
 * @author CGY
 *
 */
namespace Common\Model;
class LibraryModel extends BaseModel {	
	
	//数据验证
	protected $_validate = array(
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
		array('title','require','标题不能为空！',self::MUST_VALIDATE,''),
		//array('rpId','require','所属于资源商ID不能为空',self::MUST_VALIDATE,''),
		array('libUrl','require','资源路径不能为空',self::MUST_VALIDATE,''),
		array('sort','require','资源排序不能为空',self::MUST_VALIDATE,''),
		array('status',array(0,1),'请选择正确的状态！',self::MUST_VALIDATE,'in'),
	);
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),			
	);
	
	/**
	 * 迭代排序
	 * @param unknown_type $list
	 * @param int $pId 父栏目ID
	 * @param int $mode 模式（0－列表，1－多维数组）
	 * @param int $notId	不读取的ID（包括下级）
	 * @param int $level 起始层数
	 */
	private function eachData(&$list,$pId,$mode=0,$notId=0,$level=0,$path=''){
		foreach($list as $row){
			if($row['pId']==$pId && $row['id']!=$notId) {
				$row['level'] = $level;
				$row['path'] = $path . ($path ? ',':'').$row['id'];
				$row['childIds'] = $row['id']; 
				if($mode){ //多维数组
					$row['childNodes'] = $this->eachData($list,$row['id'],$mode,$notId,$level+1,$row['path']);
					foreach($row['childNodes'] as $v){
						$row['childIds'] .= ','.$v['childIds'];
					}
					$arr[$row['id']] = $row;
				}else{ //列表					
					$arr[$row['id']] = '';
					$childArr = $this->eachData($list, $row['id'],$mode,$notId,$level+1,$row['path']);
					foreach($childArr as $v){
						$row['childIds'] .= ','.$v['childIds'];
						$arr[$v['id']] = $v;
					}				
					$arr[$row['id']] = $row;	
					//if(is_array($childArr))	$arr = array_push($arr,$childArr);
				}
			}
		}
		return $arr;	
	}
	
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
	
	/**
	 * 更新缓存（全部：NO,$exKey：YES）
	 * @param string $exKey 父栏目id
	 */
	public function updateCache($exKey=''){	
// 		$all = $this->queryChannel(1);
// 		$pChannels = get_array_for_fieldval($all['rows'], 'pId', 0); //获取父类栏目
// 		foreach ($pChannels as $k=>$v){
// 			$datas[$k] = get_array_for_fieldval($all['rows'], 'pId', $k); //获取某一个父类栏目下的子栏目
// 		}
// 		foreach ($datas as $k1=>$v1){
// 			S('Channel_'.$k1,$v1);
// 		}
// 		S('Channel_top',$pChannels);
// 		if(!empty($exKey)) return $datas[$exKey];
	}
	
}