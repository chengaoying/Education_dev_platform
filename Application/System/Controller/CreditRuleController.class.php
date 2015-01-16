<?php
/**
 * 控制器：积分规则
 * @author Administrator
 *
 */
namespace System\Controller;
class CreditRuleController extends BaseAuthController {
	
	private $timeTypes = array('不限','全局','月','天');
    private $ruleTypes = array(1=>'赚取',2=>'消耗');
	/**
	 * 查看操作
	 */
	public function indexAct() {
        $credits = get_cache('Credit');
		if(! IS_POST) {
			$this->assign(array(
				'buttonStyle' => $this->buttonAuthStyle(array('add','edit','del')),
				'credits' => $credits,
			));
			$this->display();
		} else {
			$list = D('CreditRule')->selectPage($this->getSelectParam());
			foreach($list['rows'] as $key=>$row){
                $list['rows'][$key]['creditId'] = $credits[$row['creditId']]['name'];
				$list['rows'][$key]['ruleType'] = $this->ruleTypes[$row['ruleType']];
                $list['rows'][$key]['timeType'] = $this->timeTypes[$row['timeType']];
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
		$this->showResult( D('CreditRule')->delData(I('id')));
	}
	
	/**
	 * 添加/编辑
	 */
	private function set() {		
		if(! IS_POST) {
			$id = I( 'id', 0);
			if($id > 0) {
				$creditRule = D( 'CreditRule')->find($id);				
			}else{
				$creditRule['timeType'] = 0;
                $creditRule['timeNum'] = 1;
                $creditRule['ruleTypeNum'] = 1;
				$creditRule['status'] = 1;
			}
			//积分关键字
			$this->assign(array(
					'creditRule' => $creditRule,
                    'creditHtml' => $this->getComboBox(get_cache('Credit'),'creditId',array('selVal'=>$creditRule['creditId'],'valKey'=>'id','textKey'=>'name','nullText'=>'')),
					'timeTypeHtml' => $this->getComboBox($this->timeTypes, 'timeType',array('selVal'=>$creditRule['timeType'],'nullText'=>'')),
					'ruleTypeHtml' => $this->getComboBox($this->ruleTypes, 'ruleType',array('selVal'=>$creditRule['ruleType'],'nullText'=>'')),
					'statusHtml'=> $this->getComboBox($this->statusNames, 'status',array('selVal'=>$creditRule['status'],'nullText'=>'')),
					
			));
			$this->display( 'edit');
		} else {			
			$this->showResult(D( 'CreditRule')->saveData(I('post.')));
		}
	}

}