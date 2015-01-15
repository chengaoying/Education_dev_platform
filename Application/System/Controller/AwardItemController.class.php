<?php
/**
 * 控制器：奖品
 *
 */
namespace System\Controller;
class AwardItemController extends BaseAuthController {
	
	
	private $aTypes = array(0=>'实物',1=>'积分体系',2=>'道具');
	
	
	/**
	 * 查看操作
	 */
	public function indexAct() {
        $credits = get_cache('Credit');
		if(! IS_POST) {
			$this->assign(array(
				'buttonStyle' => $this->buttonAuthStyle(array('add','edit','del')),
				'aTypeHtml' => $this->getComboBox($this->aTypes, 'where[aType]',array('selVal'=>-1)),
			));
			$this->display();
		} else {
			$data = D('AwardItem')->selectPage($this->getSelectParam());
			foreach($data['rows'] as $key=>$row){
				$data['rows'][$key]['aType'] = $this->aTypes[$row['aType']];
                $data['rows'][$key]['creditId'] = $credits[$row['creditId']]['name'];
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
		$this->showResult( D('AwardItem')->delData(I('id')));
	}
	
	/**
	 * 添加/编辑
	 */
	private function set() {		
		if(! IS_POST) {
			$id = I( 'id', 0);
			if($id > 0) {
				$awardItem = D( 'AwardItem')->find($id);
			}else{
				$awardItem['aType'] = 0;
                $awardItem['status'] = 1;
			}
			$this->assign(array(
				'awardItem' => $awardItem,
                'creditHtml' => $this->getComboBox(get_cache('Credit'),'creditId',array('selVal'=>$awardItem['creditId'],'valKey'=>'id','textKey'=>'name','nullText'=>'')),
				'aTypeHtml' => $this->getComboBox($this->aTypes, 'aType',array('selVal'=>$awardItem['aType'],'nullText'=>'','editable'=>true)),
                'statusHtml' => $this->getComboBox($this->statusNames,'status',array('selVal'=>$awardItem['status'],'nullText'=>'','editable'=>true)),
			));	
			$this->display( 'edit');
		} else {
            $data = I('post.');
            if($data['aType'] == 1){
                $data['propId'] = 0;
                if(!$data['creditId']){
                    $this->showResult(result_data(0, '请选择积分类型'));
                }
            }
            if($data['aType'] == 2){
                $data['creditId'] = 0;
                if(!$data['propId']){
                    $this->showResult(result_data(0, '请填写道具ID'));
                }
            }
			$this->showResult( D( 'AwardItem')->saveData($data));
		}
	}

}