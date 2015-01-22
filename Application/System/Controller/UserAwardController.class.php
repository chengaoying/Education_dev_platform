<?php
/**
 * 控制器：活动
 * @author FYW
 *
 */
namespace System\Controller;
class UserAwardController extends BaseAuthController {
	
    private $awardType = array(1=>'道具',2=>'实物');


    /**
	 * 查看操作
	 */
	public function indexAct() {
		if(!IS_POST) {
            $buttonStyle = $this->buttonAuthStyle(array('del'));
            $buttonStyle['add'] = 'style="display:none;"';
            $buttonStyle['edit'] = 'style="display:none;"';
			$this->assign(array(
                'awardTypeHtml' => $this->getComboBox($this->awardType,'where[type]',array('selVal'=>-1,'width'=>80)),
				'buttonStyle' => $buttonStyle,
			));
			$this->display();
		} else {
			$data = D('UserAward')->selectPage($this->getSelectParam());
            $awardItem = get_cache('AwardItem');
            foreach ($data['rows'] as &$value) {
                $value['itemName'] = $awardItem[$value['itemId']]['name'];
                $value['typeName'] = $this->awardType[$value['type']];
            }
			$this->ajaxReturn($data);
		}
	}

	
	/**
	 * 删除操作
	 */
	public function delAct() {
        $this->showResult( D('UserAward')->delData(I('id','')));
	}


}