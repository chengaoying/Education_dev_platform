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
		$param['where']['roleId'] = $roleId;
		$sectionId = $data['sectionId'];
		$topicId = $data['topicId'];
		$wrongList = $this->queryRoleWrongLib($roleId,$topicId,$sectionId);
		if($wrongList==null){
			return $wrongList;
		}
		$delList = "";
		$saveList = "";
		$roleLibrary['roleId'] = $roleId;
		$roleLibrary['redFlower'] = $data['redFlower'];
		$roleLibrary['score'] = $data['score'];
		$userParam['id'] = $roleId;
		$userData = D('Role')->selectOne($userParam);
		$userParam['point'] = $userData['point']+$data['redFlower'];
		D('Role')->save($userParam);
		$i = 0;
		foreach ($data['lib'] as $key=>$value){
			$roleLibrary['topicId'] = $value['topicId'];
			$roleLibrary['sectionId'] = $value['sectionId'];
			$isSave = true;
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
			if($isSave&&$value['status']=='false'){
				unset($value['status']);
				$saveList[] = $value;
				$i++;
			}
		}
		D('RoleLibrary')->saveData($roleLibrary);
		if($delList!=""){
			$delList = substr($delList,0,strlen($delList)-1);
			$param['id'] = array(in,$delList);
			D('RoleWrongLibrary')->where($param)->delete();
		}
// 		return $saveList;
		if($saveList!=""){
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
	public function queryRoleWrongLib($roleId,$topicId,$sectionId,$s_pageNo=1,$s_pageSize=7,$l_pageNo=1,$l_pageSize=6,$isQuerySection = false,$initPage = false) {
		if($isQuerySection){
			$data1 = $this->querySection($roleId,$topicId,$s_pageNo,$s_pageSize);
			$score = $this->queryScore($topicId, $roleId, $sectionId);
		}
		$param['where']['topicId'] = $topicId;
		$param['where']['roleId'] = $roleId;
		$param['where']['sectionId'] = $sectionId;
		$param['page'] = $l_pageNo;
		$param['pageSize'] = $l_pageSize;
        $param['where']['initPage'] = $initPage;
		$data = D('RoleWrongLibrary')->selectPage($param);
		$dataExcl = $this->queryLib($sectionId);
		if($dataExcl['status']==0){
			return null;
		}
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
	
	protected  function queryScore($topicId,$roleId,$sectionId) {
		$param['topicId'] = $topicId;
		$param['roleId'] = $roleId;
		$param['sectionId'] = $sectionId;
		$param['sortOrder'] = 'id desc';
		$scoreArr = D('RoleLibrary')->selectOne($param);
		return $scoreArr['score'];
	}
	
	public function querySection($roleId,$topicId,$s_pageNo,$s_pageSize){
		$param['where']['topicId'] = $topicId;
		$param['where']['roleId'] = $roleId;
		$param['page'] = $s_pageNo;
		$param['pageSize'] = $s_pageSize;
		$param['field'] = 't_role_wrong_library.sectionId';
		$data = D('RoleWrongLibrary')->findSection($param);
		$data['rows'] = assoc_unique($data['rows'],'sectionId');
		$data['total'] = count($data['rows']);
		if ($data ['total'] > $s_pageSize) {
			$i=0;
			foreach ( $data ['rows'] as $key => $value ) {
				if($i>=($s_pageNo - 1) * $s_pageSize&&$i<$s_pageNo * $s_pageSize){
					$newData[] = $value;
				}
				$i++;
			}
			unset($data['rows']);
		}
		$data['rows'] = $newData;
		return $data;
	}
	
	/**
	 * 查询题库
	 * @param int $sectionId 课程id
	 * @return array 返回题库内容
	 */
	public function queryLib($sectionId){
		$param['sectionId'] = $sectionId;
		$data = D('Library')->selectOne($param);
		if($data==null){
			return result_data(0,'题库不存在！',null);
		}
		$fileUrl = C('UPFILE_LOCAL_PATH').'/'.$data['libUrl'];
		$_temp = readExcelData($fileUrl);
		$_temp['data'] = $this->cenvertData($_temp['data']);
		foreach ($_temp['data']['library'] as $key=>$value){
			if($value['kind']=='word'){
				$_temp['data']['library'][$key]['itemList'][] = $_temp['data']['library'][$key]['answer0'];
				$_temp['data']['library'][$key]['itemList'][] = $_temp['data']['library'][$key]['answer1'];
				$_temp['data']['library'][$key]['itemList'][] = $_temp['data']['library'][$key]['answer2'];
				$_temp['data']['library'][$key]['itemList'][] = $_temp['data']['library'][$key]['answer3'];
				unset($_temp['data']['library'][$key]['answer0']);
				unset($_temp['data']['library'][$key]['answer1']);
				unset($_temp['data']['library'][$key]['answer2']);
				unset($_temp['data']['library'][$key]['answer3']);
			}else{
				$_temp['data']['library'][$key]['itemList'][] = get_upfile_url($_temp['data']['library'][$key]['answer0']);
				$_temp['data']['library'][$key]['itemList'][] = get_upfile_url($_temp['data']['library'][$key]['answer1']);
				$_temp['data']['library'][$key]['itemList'][] = get_upfile_url($_temp['data']['library'][$key]['answer2']);
				unset($_temp['data']['library'][$key]['answer0']);
				unset($_temp['data']['library'][$key]['answer1']);
				unset($_temp['data']['library'][$key]['answer2']);
				unset($_temp['data']['library'][$key]['answer3']);
			}
		}
		
// 		$_temp['data']['library'] = array(
// 				0=>array('id'=>1,'kind'=>'word','title'=>'3+2=?','itemList'=>array(3,4,5,6),'score'=>5,'correct'=>'3'),
// 				1=>array('id'=>2,'kind'=>'pic', 'title'=>'下列图片中哪个是苹果?','itemList'=>array(get_upfile_url('__HD__/images/library/1/pic_1.png'),get_upfile_url('__HD__/images/library/1/pic_2.png'),get_upfile_url('__HD__/images/library/1/pic_3.png')),'score'=>5,'correct'=>'1')
// 				);
		$data['content'] = $_temp['data']['library'];
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
					}else if($data[$k1][$k2]['kind']=='图片'){
						$data[$k1][$k2][$fields[$k1][$k3]]='pic';
					}
					unset($data[$k1][$k2][$k3]);
				}
			}
		}
		return $data;
	}
	
}