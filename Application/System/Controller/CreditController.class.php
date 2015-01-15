<?php
/**
 * 控制器：积分设置
 * @author Administrator
 *
 */
namespace System\Controller;
class CreditController extends BaseAuthController {
	
    private $userOrRole = array(1=>'用户',2=>'角色');


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
            $data = D('Credit')->selectPage($this->getSelectParam());
            foreach ($data['rows'] as $key => &$value) {
                $value['userOrRole'] = $this->userOrRole[$value['userOrRole']];
            }
			$this->ajaxReturn($data);
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
                    'userRoleHtml'=> $this->getComboBox($this->userOrRole, 'userOrRole',array('selVal'=>$credit['userOrRole'],'nullText'=>'')),
					'cKeyHtml' => $this->getComboBox($proConfig['roleCredit'], 'keyName',array('selVal'=>$credit['keyName'])),
					'statusHtml'=> $this->getComboBox($this->statusNames, 'status',array('selVal'=>$credit['status'],'nullText'=>'')),
					
			));
			$this->display( 'edit');
		} else {			
			$this->showResult(D( 'Credit')->saveData(I('post.')));
		}
	}
    
    /*
     * 获取积分KEY列表
     */
    public function getKeyListAct(){
        $proConfig = get_pro_config_content('proConfig');
        $userOrRole = $_GET['type'];
        $data = $keyData = array();
        if($userOrRole == 1){
            $data = $proConfig['userCredit'];
        }else if($userOrRole == 2){
            $data = $proConfig['roleCredit'];
        }else{
            return;
        }
        foreach ($data as $key => $value) {
            $keyData[] = array('id'=>$key,'title'=>$value);
        }

        $this->ajaxReturn($keyData);
    }

}