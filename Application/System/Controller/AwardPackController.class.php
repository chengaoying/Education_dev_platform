<?php
/**
 * 控制器：奖项
 *
 */
namespace System\Controller;
class AwardPackController extends BaseAuthController {
	
	
		
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
			$data = D('AwardPack')->selectPage($this->getSelectParam());
			foreach($data['rows'] as $key=>&$row){
				$row['items'] = D('AwardBase','Logic')->showAwardName($row['items']);
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
		$this->showResult( D('AwardPack')->delData(I('id')));
	}
	
	/**
	 * 添加/编辑
	 */
	private function set() {		
	
		if(! IS_POST) {
			$id = I( 'id', 0);			
			$awardItems = get_cache('AwardItem');
			if($id > 0) {
				$awardPack = D( 'AwardPack')->find($id);
				$awardPack['items'] = unserialize($awardPack['items']);
				foreach($awardPack['items'] as $key=>$val){
					$tmp[] = $key.','.$val.','.$awardItems[$key]['name'];
				}
				$awardPack['items'] = implode('|', $tmp);
			}else{
                $awardPack['status'] = 1;
            }
			$this->assign(array(
				'awardPack' => $awardPack,
				'awardItemHtml' => $this->getcomboBox($awardItems,'awardItem',array('selVal'=>-1,'valKey'=>'id','textKey'=>'title','editable'=>true)),
                'statusHtml' => $this->getComboBox($this->statusNames,'status',array('selVal'=>$awardPack['status'],'nullText'=>'','editable'=>true)),
			));	
			$this->display( 'edit');
		} else {
			$data = I('post.');
			unset($data['awardItem']);
			$this->showResult(D( 'AwardPack')->saveData($data));
		}
	}

}