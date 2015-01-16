<?php
/**
 * 控制器：活动
 * @author FYW
 *
 */
namespace System\Controller;
class RealAwardController extends BaseAuthController {
		
	/**
	 * 查看操作
	 */
	public function indexAct() {
		if(! IS_POST) {
            $buttonStyle = $this->buttonAuthStyle(array('del'));
            $buttonStyle['add'] = 'style="display:none;"';
            $buttonStyle['edit'] = 'style="display:none;"';
			$this->assign(array(
				'buttonStyle' => $buttonStyle,
			));
			$this->display();
		} else {
			$data = D('RealAward')->selectPage($this->getSelectParam());
            $awardItem = get_cache('AwardItem');
            foreach ($data['rows'] as &$value) {
                $value['itemName'] = $awardItem[$value['itemId']]['name'];
            }
			$this->ajaxReturn($data);
		}
	}

	
	/**
	 * 删除操作
	 */
	public function delAct() {
        $this->showResult( D('RealAward')->delData(I('id','')));
	}


}