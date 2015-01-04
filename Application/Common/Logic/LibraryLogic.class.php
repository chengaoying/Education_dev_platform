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
		$delList = "";
		$saveList = "";
		$roleLibrary['roleId'] = $roleId;
		$roleLibrary['redFlower'] = $data['redFlower'];
		$roleLibrary['score'] = $data['score'];
		$i = 0;
// 		return $data['lib'];
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
				return result_data(1,'数据保存失败！',null);
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
		}
		$param['where']['topicId'] = $topicId;
		$param['where']['roleId'] = $roleId;
		$param['where']['sectionId'] = $sectionId;
		$param['page'] = $l_pageNo;
		$param['pageSize'] = $l_pageSize;
        $param['where']['initPage'] = $initPage;
		$data = D('RoleWrongLibrary')->selectPage($param);
		$dataExcl = $this->queryLib($topicId,$sectionId);
		foreach ($data['rows'] as $key=>$value){
			foreach ($dataExcl['content'] as $key1=>$value1){
				if($value['itemId']==$value1['id']){
					$data['rows'][$key]['title'] = $value1['title'];
				}
			}
		}
		$data['sectionList'] = $data1;
		return $data;
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
		return $data;
	}
	
	/**
	 * 查询题库
	 * @param int $sectionId 课程id
	 * @return array 返回题库内容
	 */
	public function queryLib($sectionId){
		$param['sectionId'] = $sectionId;
// 		$param['where']['topicId'] = $topicId;
		$data = D('Library')->selectOne($param);
		$fileUrl = C('UPFILE_LOCAL_PATH').'/'.$data['libUrl'];
		$_temp = readExcelData($fileUrl);
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
}