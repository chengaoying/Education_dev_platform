<?php
/**
 * 控制器：中奖名单
 * @author FYW
 *
 */
namespace System\Controller;
class ActWinnerController extends BaseAuthController {
	
		
	protected  $isSends = array('未发奖','虚拟物品已发','已全发');
	
	/**
	 * 查看操作
	 */
	public function indexAct() {
		$activitys = get_cache('Activity');
		if(!IS_POST) {			
			$this->assign(array(
				'buttonStyle' => $this->buttonAuthStyle(array('add','edit','del','send')),
				'activityHtml' => $this->getcomboBox($activitys,'aId',array('selVal'=>-1,'valKey'=>'id','textKey'=>'title','editable'=>true)),
				'isSendHtml' =>$this->getComboBox($this->isSends, 'where[isSend]',array('selVal'=>-1,'editable'=>true)),				
			));
			$this->display();
		} else {			
			$param = $this->getSelectParam();
			if(!$param['aId']) $this->ajaxReturn(result_data(0,'请先选择活动再进行操作！'));
            $data = D('ActWinner')->setActivity($param['aId'])->selectPage($this->getSelectParam());
            $awardPack = get_cache('AwardPack');
			foreach($data['rows'] as $key=>$row ){
                $awardPacks = get_array_val($awardPack,$row['packId']);
				$data['rows'][$key]['packId'] = $awardPacks['name'];
				$data['rows'][$key]['isSend'] = $this->isSends[$row['isSend']];
			}
			$this->ajaxReturn($data);			
		}
	}
	
	

	/**
	 * 编辑操作
	 */
	public function editAct() {
		$aId = I('aId',0);
		$id = I('id',0);		
		if($id>0 && $aId>0){
			$ActWinner = D('ActWinner')->setActivity($aId);
			if(!IS_POST){				
				$winner = $ActWinner->find($id);				
				$act = get_array_val(get_cache('Activity'),$aId);
				$winner['actName'] = $act['title'];
				$pack = get_cache('AwardPack'); 
				$winner['packName'] = $pack[$winner['packId']]['name'];				
				$items = unserialize($pack[$winner['packId']]['items']);
				unset($pack);
				$awardItems = get_cache('AwardItem');
				foreach($items as $key=>$val){
					$items[$key] = array('num'=>$val,'title'=>$awardItems[$key]['name']);
				}
				$winner['items'] = $items;
				foreach($this->isSends as $key=>$val){
					if($key>=$winner['isSend']) $isSends[$key] = $val;
				}
				$this->assign(array(
					'aId' => $aId,
					'winner' => $winner,
					'isSendHtml' => $this->getComboBox($isSends, 'isSend',array('selVal'=>$winner['isSend'],'nullText'=>'','editable'=>true)),
				));
				$this->display();
			}else{
				$data = I('post.');		
				$this->showResult( $ActWinner->saveData($data));
			}
		}else{
			$this->showResult(result_data(0,'参数错误！'));
		}
	}
	
	/**
	 * 添加操作
	 */
	public function addAct(){
		$aId = I('aId',0);
		if($aId<=0) $this->showResult(result_data(0,'请先选择活动！'));				
		if(!IS_POST){			
			$act = get_array_val(get_cache('Activity'),$aId);
			$winner['actName'] = $act['title'];
			$this->assign(array(
				'aId' => $aId,
				'winner' => $winner,
			));
			$this->display();
		}else{
			$data = I('post.');
            //判断是否存在用户ID 角色ID 奖项ID
            $userData = D('User')->selectOne(array('id'=>$data['userId']));
            if(!$userData) $this->showResult(result_data (0, '该用户ID不存在'));
            if($data['roleId']){
                $roleData = D('Role')->selectOne(array('id'=>$data['roleId'],'status'=>1));
                if(!$roleData) $this->showResult(result_data (0, '该角色ID不存在'));
            }
            $packData = D('AwardPack')->selectOne(array('id'=>$data['packId'],'status'=>1));
            if(!$packData) $this->showResult(result_data (0, '该奖项ID不存在'));
			$this->showResult(D('ActWinner')->setActivity($data['aId'])->saveData($data));
		}
	}
	
	/**
	 * 删除操作
	 */
	public function delAct() {		
		$aId = I('get.aId',0);
		if($aId<=0) $this->showResult(result_data(0,'请先选择活动！'));	
		$this->showResult( D('ActWinner')->setActivity($aId)->delData(I('id')));
	}
	
	
	/**
	 * 发奖操作
	 */
	public function sendAct(){
		$aId = I('get.aId',0);
		$id = I('id');		
		if($aId<=0) $this->showResult(result_data(0,'请先选择活动！'));
		$this->showResult(D('ActBase','Logic')->setActivity($aId)->send($id));
		
	}
	
}