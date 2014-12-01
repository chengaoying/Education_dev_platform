<?php
/**
 * 数据模型：产品
 */
namespace Common\Model;
class ProductConfigModel extends BaseModel {	
	
	//数据验证
	protected $_validate = array(			
		//插入
		array('proId','require','所属产品不能为空',self::MUST_VALIDATE,'',self::MODEL_INSERT),
		//更新
		array('id','require','id不能为空',self::MUST_VALIDATE,'',self::MODEL_UPDATE),
		array('proId','require','所属产品不能为空',self::EXISTS_VALIDATE,'',self::MODEL_UPDATE),
		//全部
		array('proId','','产品Id已存在！',self::EXISTS_VALIDATE,'unique'),
	);
	
	//自动填充	
	protected $_auto = array(
		array('addTime',DATE_TIME,self::MODEL_INSERT),
	);		
	
	
	
	//数据同步
	protected $sync = array('proIdField'=>'proId','key'=>'Config');
	
	//---------------扩展CRUD-----------------------
		
	
	/**
	 * 获取一条数据
	 * @param int|string $id
	 */
	public function selectOne($id){
		if(empty($id)) return;
		$data = $this->find($id);
		$this->margerConfig($data);
		return $data;
	}
	
	public function selectOneByProId($proId){
		if(empty($proId)) return;
		$data = $this->where(array('proId'=>$proId))->find();
		$this->margerConfig($data);
		return $data;
	}
	
	
	
	
	/**
	 * 保存数据
	 * @param array $data
	 */
	public function saveData($data){
		if(!$data['id']){
			unset($data['setVals']);
			$data['template'] = serialize($data['template']);			
			$proCnf = $this->where(array('proId'=>$data['proId']))->find();			
			if(!$proCnf){ //添加记录
				if(!$data['proId']) return result_data(0,'所属产品不能为空');
				$id = $this->add($data);
				return result_data(1,'数据保存成功！',array('id'=>$id));
			}else{
				$data['id'] = $proCnf['id'];				
				$rows = $this->save($data); //更改模板
				return result_data(1,'数据保存成功！',array('rows'=>$rows));
			}
								
		}else{
			$proCnf = $this->find($data['id']);
			if(!$proCnf) return result_data(0,'产品配制记录不存在！');
			unset($data['proId']);			
			$proCnf['template'] = unserialize($proCnf['template']);
			foreach($proCnf['template'] as $key=>$item){
				if(empty($data['setVals'][$key])){//如果没有设置值，则用模板默认值代替
					$data['setVals'][$key]  = $item['defVal'];
				}else{
					if($item['type']=='array'){
						$rows = explode("\r\n",$data['setVals'][$key]);
						foreach($rows as $row){
							if(empty($row)) continue;
							$row = explode('=',$row);
							if(count($row)>1){
								$arr[$row[0]] = $row[1];
							}else{
								$arr[] = $row[0];
							}
						}
						$data['setVals'][$key] = $arr;
						$arr = '';
					}elseif($item['type']=='textarea'){
						$data['setVals'][$key] = str_replace("\r\n",'<br/>',$data['setVals'][$key]);
					}elseif($item['type']=='file'){
						if($item['isAdd']) $data['setVals'][$key] = str_replace("\r\n",',',$data['setVals'][$key]);
					}
				}
			}
			$data['setVals'] = serialize($data['setVals']);
			$rows = $this->save($data);
			$this->updateCache();
			$this->syncSend($proCnf['proId'],'Config'); //同步数据
			return result_data(1,'数据保存成功！',array('rows'=>$rows));
		}		
	}
			
	
	/**
	 * 更新缓存（全部：NO,$exKey：YES）
	 * $exKey = proId(无状态)	 
	 */
	public function updateCache($exKey=''){
		if($exKey) $where['proId']=$exKey;
		$list = $this->where($where)->select();		
		foreach($list as $row){
			$this->margerConfig($row);	
			S('ProductConfig',$row['setVals']);
			if($exKey == $row['proId']) $r = $row['setVals'];
		}
		if($exKey) return $r;
	}
	
	
	/**
	 * 合并自定义值和默认值
	 * @param array $data
	 */
	private function margerConfig(&$data){
		if (!$data) return;
		$data['template'] = unserialize($data['template']);
		$data['setVals'] = unserialize($data['setVals']);
		foreach($data['template'] as $key=>$item){
			if(empty($data['setVals'][$key])) $data['setVals'][$key] = $item['defVal'];
		}
	}
	
}