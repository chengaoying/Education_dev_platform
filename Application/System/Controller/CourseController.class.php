<?php
/**
 * 控制器：课程
 * @author CGY
 *
 */
namespace System\Controller;
class CourseController extends BaseAuthController{
	
	
	/**
	 * 查看操作
	 */
	public function indexAct() {		
		if(!IS_POST) {
			//栏目和龄段
			$classes = $this->getClass();
			$channelHtml = $this->getComboBox($classes, 'chId',array('selVal'=>'','valKey'=>'id','textKey'=>'name','levelKey'=>'','nullText'=>'请选择','width'=>80));
			$stageHtml = $this->getComboBox(get_cache('Stage'), 'stageId',array('selVal'=>'','valKey'=>'id','textKey'=>'name','levelKey'=>'','nullText'=>'请选择','width'=>80));
			
			//出版商，册数，课程类型,关键字
			$proConf = get_pro_config_content('proConfig');
			$pressHtml  = $this->getComboBox($proConf['press'], 'pressId',array('selVal'=>'','nullText'=>'请选择','width'=>120));
			//$volumeHtml = $this->getComboBox($proConf['volume'], 'volume',array('selVal'=>'','nullText'=>'请选择','width'=>80));
			$typeHtml   = $this->getComboBox($proConf['courseType'], 'typeId',array('selVal'=>'','nullText'=>'请选择','width'=>80));
			$keysHtml   = $this->getComboBox($proConf['keys'], 'keys',array('selVal'=>'','nullText'=>'请选择','width'=>80));
				
			$statusHtml = $this->getComboBox($this->statusNames, 'status',array('selVal'=>'-1','nullText'=>'请选择','width'=>80));
			
			$this->assign(array(			
				'buttonStyle'	=> $this->buttonAuthStyle(array('add','edit','del')),
				'channelHtml'	=> $channelHtml,
				'stageHtml'		=> $stageHtml,	
				'pressHtml'		=> $pressHtml,
				'typeHtml'		=> $typeHtml,
				'keysHtml'		=> $keysHtml,
				'statusHtml'	=> $statusHtml,						
			));
			$this->display();
		} else {
			$param['where'] = I('post.');
			$list = D('Course')->queryCourse($param);
			$list = array_values($list['rows']);
			$this->ajaxReturn($list);
		}		
	}
		
	/**
	 * 添加操作
	 */
	public function addAct() {
		$this->set();
	}
	/**
	 * 编辑操作
	 */
	public function editAct() {
		$this->set();
	}
	
	/**
	 * 删除操作
	 */
	public function delAct() {
		$this->showResult( D('Course')->delData(I('id')));
	}
	
	/**
	 * 添加/编辑
	 */
	private function set() {		
		if(! IS_POST) {
			$id = I( 'id', 0);
			if($id > 0) {
				$course = D('Course')->find($id);
			}else{
				$course['status'] = 1; //状态默认为启用
			}	
			//栏目和龄段
			$classes = $this->getClass();
			$channelHtml = $this->getComboBox($classes, 'chId',array('selVal'=>$course['chId'],'valKey'=>'id','textKey'=>'name','levelKey'=>'','nullText'=>'请选择','width'=>150));
			$stageHtml = $this->getComboBox(get_cache('Stage'), 'stageId',array('selVal'=>$course['stageId'],'valKey'=>'id','textKey'=>'name','levelKey'=>'','nullText'=>'请选择','width'=>150));
			
			//出版商，册数，课程类型,关键字
			$proConf = get_pro_config_content('proConfig');
			$pressHtml  = $this->getComboBox($proConf['press'], 'pressId',array('selVal'=>$course['pressId'],'nullText'=>'请选择','width'=>150));
			$volumeHtml = $this->getComboBox($proConf['volume'], 'volume',array('selVal'=>$course['volume'],'nullText'=>'请选择','width'=>150));
			$typeHtml   = $this->getComboBox($proConf['courseType'], 'typeId',array('selVal'=>$course['typeId'],'nullText'=>'请选择','width'=>150));
			
			$statusHtml = $this->getComboBox($this->statusNames, 'status',array('selVal'=>$course['status'],'nullText'=>'','width'=>150));
			
			$this->assign(array(
				'course'	  => $course,
				'channelHtml' => $channelHtml,
				'stageHtml'   => $stageHtml,
				'pressHtml'   => $pressHtml,
				'volumeHtml'  => $volumeHtml,
				'typeHtml'    => $typeHtml,
				'statusHtml'  => $statusHtml,
			));	
			$this->display( 'edit');
		} else {
			$data = I('post.');
			$this->showResult( D('Course')->saveData($data));
		}
	}
	
	/**
	 * 异步加载信息：龄段
	 */
	public function loadAct(){
		$type = I('type','');
		$chId = I('chId','');
		save_log('load',array('chId'=>'chId='.$chId));
		if($type == 'stage'){
			$stages = get_cache('Stage');
			$data = get_array_for_fieldval($stages, 'chId',$chId);
		}
		$this->ajaxReturn($data);
	}
	
	/**
	 * 获取龄段顶级分类(顶级栏目-全部课程下的二级栏目)
	 * 先获取顶级栏目-全部课程，然后再获取全部课程下的二级栏目(顶级分类)
	 */
	private function getClass(){
		$channel = S('Channel');
		$topChannel = get_array_for_fieldval($channel, 'chKey','allcourse');
		$topChannel = array_slice($topChannel,0,count($topChannel));
		$id = $topChannel[0]['id'];
		$class = get_array_for_fieldval($channel, 'pId',$id);//二级栏目(顶级分类)
		return $class;
	}
}