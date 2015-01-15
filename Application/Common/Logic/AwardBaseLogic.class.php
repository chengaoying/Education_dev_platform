<?php

/**
 * 逻辑处理类：奖品和奖项
 *
 */

namespace Common\Logic;

class AwardBaseLogic extends BaseLogic {
    /*
     * 将数据库保存的奖品序列化转换为具体奖品名称
     * @param string $awardStr 奖品序列化字符串
     * @return string $awardRealStr 返回奖品名称和数量字符串
     */

    public function showAwardName($awardStr) {
        if (empty($awardStr))
            return result_data(0, '奖项不存在');
        $awardArr = unserialize($awardStr);
        $items = get_cache('AwardItem');
        $awardRealStr = '';
        foreach ($awardArr as $key => $value) {
            $item = $items[$key];
            if ($item['aType'] == 2) {//虚拟道具
                $awardRealStr .= ' 【道具奖品：' . $item['name'] . ' &nbsp;数量：' . $value . '】' . "\r\n";
            } else if ($item['aType'] == 0) {
                $awardRealStr .= ' 【实物奖品：' . $item['name'] . ' &nbsp;数量：' . $value . '】' . "\r\n";
            } else if ($item['aType'] == 1) {
                $awardRealStr .= ' 【积分体系奖品：' . $item['name'] . ' &nbsp;数量：' . $value . '】' . "\r\n";
            }
        }
        return $awardRealStr;
    }

}
