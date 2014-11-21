<?php
/**
 * 数据模型：栏目
 * @author CGY
 *
 */
namespace Common\Model;
class ChannelModel extends BaseModel {	
	
	//数据验证
	protected $_validate = array(
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
		array('name','require','标题不能为空！',self::MUST_VALIDATE,''),
		array('name','','角色名称已存在！',self::EXISTS_VALIDATE,'unique'),
		array('chKey','require','关键字不能为空！',self::MUST_VALIDATE,''),
		array('chKey','','该关键字已存在！',self::EXISTS_VALIDATE,'unique'),
		array('status',array(0,1),'请选择正确的状态！',self::MUST_VALIDATE,'in'),
	);
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),			
	);

	//---------------扩展CRUD-----------------------
	public function queryChannel($status='',$mode=0,$notId=0){
		if(!is_empty_null($status)) $where['status'] = $status;
		$list['rows'] = $this->where($where)->order('sort')->select();
		$list['rows'] = $this->eachData($list['rows'],0,$mode,$notId);
		return $this->returnListData($list);
	}
	
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
	 * 更新缓存（全部：NO,$exKey：YES）
	 * @param string $exKey 父栏目id
	 */
	public function updateCache($exKey=''){	
		$all = $this->queryChannel(1);
		$pChannels = get_array_for_fieldval($all['rows'], 'pId', 0); //获取父类栏目
		foreach ($pChannels as $k=>$v){
			$datas[$k] = get_array_for_fieldval($all['rows'], 'pId', $k); //获取某一个父类栏目下的子栏目
		}
		foreach ($datas as $k1=>$v1){
			S('Channel_'.$k1,$v1);
		}
		S('Channel_top',$pChannels);
		if(!empty($exKey)) return $datas[$exKey];
	}
	
}