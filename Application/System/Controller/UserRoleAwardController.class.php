<?php

/**
 * 控制器：用户/角色获得的奖品
 *
 */

namespace System\Controller;

class UserRoleAwardController extends BaseAuthController {

    /**
     * 查看操作
     */
    public function indexAct() {
        $credits = get_cache('Credit');
        if (!IS_POST) {
            $this->assign(array(
                'buttonStyle' => $this->buttonAuthStyle(array('add', 'edit', 'del')),
            ));
            $this->display();
        } else {
            $data = D('UserRoleAward')->selectPage($this->getSelectParam());
            $this->ajaxReturn($data);
        }
    }

}
