<?php
/**
 * 逻辑处理类：课程
 * @author CGY
 *
 */
namespace Common\Logic;
class LibraryLogic extends BaseLogic {
	
	/**
	 * 保存错题集
	 * @param int $roleId 角色id 
	 * @param array $data 要保存的数据
	 * @return int  返回插入的最后一条数据的id
	 */
public function saveRoleLib($roleId,$data){
		$sectionId = $data['sectionId'];
		$courseId = $data['courseId'];
		//查询错误的题目
		$wrongList = $this->queryRoleWrongLib($roleId,$sectionId);
		
		$delList = "";
		$saveList = "";
		$roleLibrary['roleId'] = $roleId;
		$roleLibrary['redFlower'] = $data['redFlower'];
		$roleLibrary['score'] = $data['score'];
		$userParam['id'] = $roleId;
		//查询角色信息，然后保存小红花的总数目
		$userData = D('Role')->selectOne($userParam);
		$userParam['point'] = $userData['point']+$data['redFlower'];
		D('Role')->save($userParam);
		
		$roleLibrary['courseId'] = $courseId;
		$roleLibrary['sectionId'] = $sectionId;
		//将关于本次题库获得的小红花，分数等保存到角色题库中。
		D('RoleLibrary')->saveData($roleLibrary);
		
		$i = 0;
		//利用for循环查找错误题集和已经修正的错误题目。
		foreach ($data['lib'] as $key=>$value){
			$isSave = true;
			if($wrongList!=null){
				foreach ($wrongList['rows'] as $key1=>$value1){
					if($value['itemId']==$value1['itemId']){
						$isSave = false;
						$delList.= $value1['id'].",";
						if($value['status']=='false'){//0代表答错了
							unset($value['status']);
							$saveList[] = $value;
							$i++;
						}
					}
				}
			}
			if($isSave&&$value['status']=='false'){
				unset($value['status']);
				$saveList[] = $value;
				$i++;
			}
		}
		
		if($delList!=""){
			$delList = substr($delList,0,strlen($delList)-1);
			$param['where']['roleId'] = $roleId;
			$param['id'] = array(in,$delList);
			//删除已经修改的的错误题集
			D('RoleWrongLibrary')->where($param)->delete();
		}
		
		if($saveList!=""){
			//保存本次答错的题目
			$ids  = D('RoleWrongLibrary')->addAll($saveList);
			if(is_numeric($ids)&&$ids!=0){
				return result_data(1,'数据保存成功！',null);
			}else{
				return result_data(0,'数据保存失败！',null);
			}
		}
		return result_data(1,'数据保存成功！',null);
	}
	
	/**
	 * 查询角色答的错误题目
	 * @param int $roleId 角色ID
	 * @param int $topicId 知识点ID
	 * @param int $sectionId 课时ID
	 * @param int $pageNo 页号
	 * @param int $pageSize 每页记录数
	 * @return array $data 查询的数组
	 */
public function queryRoleWrongLib($roleId,$sectionId,$initPage = true) {
		$param['where']['roleId'] = $roleId;
		$param['where']['sectionId'] = $sectionId;
		$param['where']['initPage'] = $initPage;
		//查询该课时所有题目的错题
		$data = D('RoleWrongLibrary')->selectPage($param);
		//查询题库的题目
		$dataExcl = $this->queryLib($sectionId);
		foreach ($data['rows'] as $key=>$value){
			foreach ($dataExcl['content'] as $key1=>$value1){
				if($value['itemId']==$value1['id']){
					$data['rows'][$key]['title'] = $value1['title'];
				}
			}
		}
		return $data;
	}
	
	/**
	 * 查询角色答的错误题目
	 * @param int $roleId 角色ID
	 * @param int $topicId 知识点ID
	 * @param int $sectionId 课时ID
	 * @param int $pageNo 页号
	 * @param int $pageSize 每页记录数
	 * @return array $data 查询的数组
	 */
	public function queryRoleWrongLibs($roleId,$courseId,$sectionId,$s_pageNo=1,$index=1,$s_pageSize=7,$l_pageNo=1,$l_pageSize=6,$isQuerySection = false,$initPage = false) {
		//判断是否需要查询错误的课程列表
		if($isQuerySection){
			//查询错误的课时列表
			$data1 = $this->querySection($roleId,$courseId,$s_pageNo,$s_pageSize);
			$sectionId = $data1['rows'][$index-1]['sectionId'];
			//查询当前选中课时列表的分数
			$score = $this->queryScore($roleId, $sectionId);
		}
		//save_log('callapi',array('time'=>date('H:i:s'),'data'=>$isQuerySection));
		if(empty($sectionId)){
			return null;
		}
		$param['where']['sectionId'] = $sectionId;
		$param['where']['courseId'] = $courseId;
		$param['where']['roleId'] = $roleId;
		$param['page'] = $l_pageNo;
		$param['pageSize'] = $l_pageSize;
		$param['where']['initPage'] = $initPage;
		//查询该课时所有题目的错题
		$data = D('RoleWrongLibrary')->selectPage($param);
		//查询题库的题目
		$dataExcl = $this->queryLib($sectionId);
		foreach ($data['rows'] as $key=>$value){
			foreach ($dataExcl['content'] as $key1=>$value1){
				if($value['itemId']==$value1['id']){
					$data['rows'][$key]['title'] = $value1['title'];
				}
			}
		}
		$data['sectionList'] = $data1;
		$data['score'] = $score;
		return $data;
	}
	
	/**
	 * 查询当前课时所获得分数
	 * @param int $topicId
	 * @param int $roleId
	 * @param int $sectionId
	 * @return unknown
	 */
protected  function queryScore($roleId,$sectionId) {
		$param['roleId'] = $roleId;
		$param['sectionId'] = $sectionId;
		$param['sortOrder'] = 'id desc';
		$scoreArr = D('RoleLibrary')->selectOne($param);
		return $scoreArr['score'];
	}
	
	/**
	 * 查询错误的课时列表
	 * @param int $roleId
	 * @param int $topicId
	 * @param int $s_pageNo
	 * @param int $s_pageSize
	 */
public function querySection($roleId,$courseId,$s_pageNo,$s_pageSize){
		$param['where']['courseId'] = $courseId;
		$param['where']['roleId'] = $roleId;
		$param['page'] = $s_pageNo;
		$param['pageSize'] = $s_pageSize;
		$param['field'] = 't_role_wrong_library.sectionId';
		//查询课时列表，有重复
		$data = D('RoleWrongLibrary')->findSection($param);
		//去除重复的课时
		$data['rows'] = assoc_unique($data['rows'],'sectionId');
		$data['total'] = count($data['rows']);
		//手动分页
		if ($data ['total'] > $s_pageSize) {
			$i=0;
			foreach ( $data ['rows'] as $key => $value ) {
				if($i>=($s_pageNo - 1) * $s_pageSize&&$i<$s_pageNo * $s_pageSize){
					$newData[] = $value;
				}
				$i++;
			}
			unset($data['rows']);
			$data['rows'] = $newData;
		}
		return $data;
	}
	
	/**
	 * 查询题库
	 * @param int $sectionId 课程id
	 * @return array 返回题库内容
	 */
public function queryLib($sectionId){
		$param['sectionId'] = $sectionId;
		//查询题库信息，主要是要获取excel的文件
		$data = D('Library')->selectOne($param);
		if(!$data['libUrl']){
			return result_data(0,'题库或者视频不存在！');
		}
		$fileUrl = C('UPFILE_LOCAL_PATH').'/'.$data['libUrl'];
		//读取excel文件中的数据
		$_temp = readExcelData($fileUrl);
		if($_temp['status']==0){
			return $_temp;
		}
		//把表格中字段转换成英文（与数据库字段对应）
		$_temp['data'] = $this->cenvertData($_temp['data']);
		//对图片类型和文字类型的答案组合成数组
		foreach ($_temp['data']['library'] as $key=>$value){
			unset($_temp['data']['library'][$key]['answer0']);
			unset($_temp['data']['library'][$key]['answer1']);
			unset($_temp['data']['library'][$key]['answer2']);
			unset($_temp['data']['library'][$key]['answer3']);
			$_temp['data']['library'][$key]['itemList'] = array_filter($_temp['data']['library'][$key]['itemList']);
		}
		$data['content'] = $_temp['data']['library'];
		return $data;
	}
	
	/**
	 * 查询该$sectionId的题库信息
	 * @param int $sectionId
	 */
	public function queryLibraryInfo($sectionId){
		$param['sectionId'] = $sectionId;
		$data = D('Library')->selectOne($param);
		return $data;
	}
	
	
	/**
	 * 把表格中字段转换成英文（与数据库字段对应）
	 * @param unknown_type $data
	 */
	private function cenvertData($data){
		$tables = array('题库'=>'library');
		$fields['library'] = array(
				'编号'=>'id',
				'题目类型(文字/图片)'=>'kind',
				'题目'=>'title',
				'选项A'=>'answer0',
				'选项B'=>'answer1',
				'选项C'=>'answer2',
				'选项D'=>'answer3',
				'分值'=>'score',
				'正确答案'=>'correct'
		);
		
		foreach ($data as $k => $v){
			$data[$tables[$k]] = $v;
			unset($data[$k]);
		}
		foreach ($data as $k1 => $v1){
			foreach ($v1 as $k2 => $v2){
				foreach ($v2 as $k3 => $v3){
					$data[$k1][$k2][$fields[$k1][$k3]] = $v3;
					if($data[$k1][$k2]['correct']=='A'){
						$data[$k1][$k2][$fields[$k1][$k3]]=1;
					}else if($data[$k1][$k2]['correct']=='B'){
						$data[$k1][$k2][$fields[$k1][$k3]]=2;
					}else if($data[$k1][$k2]['correct']=='C'){
						$data[$k1][$k2][$fields[$k1][$k3]]=3;
					}else if($data[$k1][$k2]['correct']=='D'){
						$data[$k1][$k2][$fields[$k1][$k3]]=4;
					}
					if($data[$k1][$k2]['kind']=='文字'){
						$data[$k1][$k2][$fields[$k1][$k3]]='word';
						$data[$k1][$k2]['itemList'][] = trim($data[$k1][$k2]['选项A']);
						$data[$k1][$k2]['itemList'][] = trim($data[$k1][$k2]['选项B']);
						$data[$k1][$k2]['itemList'][] = trim($data[$k1][$k2]['选项C']);
						$data[$k1][$k2]['itemList'][] = trim($data[$k1][$k2]['选项D']);
					}else if($data[$k1][$k2]['kind']=='图片'){
						$data[$k1][$k2][$fields[$k1][$k3]]='pic';
						$data[$k1][$k2]['itemList'][] = get_upfile_url(trim($data[$k1][$k2]['选项A']));
						$data[$k1][$k2]['itemList'][] = get_upfile_url(trim($data[$k1][$k2]['选项B']));
						$data[$k1][$k2]['itemList'][] = get_upfile_url(trim($data[$k1][$k2]['选项C']));
						$data[$k1][$k2]['itemList'][] = get_upfile_url(trim($data[$k1][$k2]['选项D']));
						unset($data[$k1][$k2]);
						break;
					}else if($data[$k1][$k2]['kind']=='图片文字'){
						//暂时过滤掉图片文字类型。
						$data[$k1][$k2][$fields[$k1][$k3]]='picText';
						$data[$k1][$k2]['title'] = get_upfile_url($data[$k1][$k2]['题目']);
						$data[$k1][$k2]['itemList'][] = trim($data[$k1][$k2]['选项A']);
						$data[$k1][$k2]['itemList'][] = trim($data[$k1][$k2]['选项B']);
						$data[$k1][$k2]['itemList'][] = trim($data[$k1][$k2]['选项C']);
						$data[$k1][$k2]['itemList'][] = trim($data[$k1][$k2]['选项D']);
						unset($data[$k1][$k2]);
						break;
					}
					unset($data[$k1][$k2][$k3]);
				}
			}
		}
		sort($data['library']);
		return $data;
	}
	
}