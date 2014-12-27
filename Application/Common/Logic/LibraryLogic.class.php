<?php
/**
 * 逻辑处理类：课程
 * @author CGY
 *
 */
namespace Common\Logic;
class LibraryLogic extends BaseLogic {
	
	/**
	 * 根据课时id查询题库
	 * @param unknown_type $sectionId
	 */
	public function queryLib($sectionId){
		$param['where']['sectionId'] = $sectionId;
		//$data = D('Library')->selectPage($param);
		$fileUrl = C('UPFILE_LOCAL_PATH').'/2/test.xls';
		$_temp = readExcelData($fileUrl);
		$data['content'] = $_temp['data'];
		return $data;
	}
	
}