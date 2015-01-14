<?php
/**
 * 控制器：积分设置
 * @author Administrator
 *
 */
namespace System\Controller;
class CreditController extends BaseAuthController {
	
	
	/**
	 * 查看操作
	 */
	public function indexAct() {		
		if(! IS_POST) {
			$this->assign(array(
					'buttonStyle' => $this->buttonAuthStyle(array('add','edit','del')),
			));
			$this->display();
		} else {			
			$this->ajaxReturn(D('Credit')->selectPage($this->getSelectParam()));
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
		$this->showResult( D('Credit')->delData(I('id')));
	}
	
	/**
	 * 添加/编辑
	 */
	private function set() {		
		if(! IS_POST) {
			$id = I( 'id', 0);
			if($id > 0) {
				$credit = D( 'Credit')->find($id);				
			}else{
                $credit['initValue'] = 0;
				$credit['status'] = 1;
			}
            $proConfig = get_pro_config_content('proConfig');
			//积分关键字
			$this->assign(array(
					'credit' => $credit,
					'cKeyHtml' => $this->getComboBox($proConfig['ROLECREDIT'], 'keyName',array('selVal'=>$credit['keyName'])),
					'statusHtml'=> $this->getComboBox($this->statusNames, 'status',array('selVal'=>$credit['status'],'nullText'=>'')),
					
			));
			$this->display( 'edit');
		} else {			
			$this->showResult(D( 'Credit')->saveData(I('post.')));
		}
	}

}