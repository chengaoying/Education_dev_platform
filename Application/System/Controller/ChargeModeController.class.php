<?php
/**
 * 控制器：计费模式
 * @author CGY
 *
 */
namespace System\Controller;
class ChargeModeController extends BaseAuthController {
	
	
	/**
	 * 查看操作
	 */
	public function indexAct() {
		if(!IS_POST) {
			$statusHtml = $this->getComboBox($this->statusNames, 'status',array('selVal'=>'-1','nullText'=>'请选择','width'=>80));
			$this->assign(array(			
				'buttonStyle' => $this->buttonAuthStyle(array('add','edit','del')),
				'statusHtml'  => $statusHtml,			
			));
			$this->display();
		} else {
			$param['where'] = I('post.');
			$list = D('ChargeMode')->selectPage($param);
			
			$proConf = get_pro_config_content('proConfig');
			foreach ($list['rows'] as $k => $v){
				$list['rows'][$k]['type'] = $proConf['charge'][$v['type']];
			}
			
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
		$this->showResult( D('ChargeMode')->delData(I('id')));
	}
	
	/**
	 * 添加/编辑
	 */
	private function set() {		
		if(! IS_POST) {
			$id = I( 'id', 0);
			if($id > 0) {
				$chrageMode = D('ChargeMode')->find($id);
			}else{
				$chrageMode['status'] = 1; //状态默认为启用
			}	
			$proConf    = get_pro_config_content('proConfig');
			$typeHtml  	= $this->getComboBox($proConf['charge'], 'type',array('selVal'=>$chrageMode['type'],'nullText'=>'请选择','width'=>135));
			$statusHtml = $this->getComboBox($this->statusNames, 'status',array('selVal'=>$chrageMode['status'],'nullText'=>'','width'=>135));
			$this->assign(array(
				'chrageMode'  => $chrageMode,
				'typeHtml'    => $typeHtml,
				'statusHtml'  => $statusHtml,
			));	
			$this->display( 'edit');
		} else {
			$data = I('post.');
			$this->showResult( D('ChargeMode')->saveData($data));
		}
	}
}