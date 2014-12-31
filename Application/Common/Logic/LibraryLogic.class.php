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
		$wrongList = $this->queryRoleWrongLib($roleId, $sectionId,1,1000);
		$delList = "";
		$saveList = "";
		$i = 0;
		foreach ($data as $key=>$value){
			$isSave = true;
			foreach ($wrongList['rows'] as $key1=>$value1){
				if($value['itemId']==$value1['itemId']){
					$isSave = false;
					$delList.= $value1['id'].",";
					if($value['state']==0){//0代表答错了
						unset($value['state']);
						$saveList[$i] = $value;
						$i++;
					}
				}
			}
			if($isSave&&$value['state']==0){
				unset($value['state']);
				$saveList[] = $value;
				$i++;
			}
		}
		if($delList!=""){
			$delList = substr($delList,0,strlen($delList)-1);
			$param['id'] = array(in,$delList);
			D('RoleWrongLibrary')->where($param)->delete();
		}
		if($saveList!=""){
			return D('RoleWrongLibrary')->addAll($data);
		}
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
	public function queryRoleWrongLib($roleId,$topicId,$sectionId,$pageNo=1,$pageSize=6) {
		$param['where']['roleId'] = $roleId;
		$param['where']['topicId'] = $topicId;
		$param['where']['page'] = 1;
		$param['where']['pageSize'] = 10000;
		$data1 = D('RoleWrongLibrary')->findSection($param);
		$data1 = assoc_unique($data1['rows'],'sectionId');
		$param['where']['sectionId'] = $sectionId;
		$param['where']['page'] = $pageNo;
		$param['where']['pageSize'] = $pageSize;
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
	
	/**
	 * 查询题库
	 * @param int $topicId 知识点id
	 * @param int $sectionId 课程id
	 * @return array 返回题库内容
	 */
	public function queryLib($topicId,$sectionId){
		$param['where']['sectionId'] = $sectionId;
		$param['where']['topicId'] = $topicId;
		$data = D('Library')->selectOne($param);
		$fileUrl = C('UPFILE_LOCAL_PATH').'/lib/test.xls';
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