<?php

/**
 * 逻辑处理类：积分体系
 *
 */

namespace Common\Logic;

class CreditLogic extends BaseLogic {
    
    /*
     * 不按规则更新积分不写日志
     * 当角色ID不为空的时候，那主要是根据角色判断
     * @param int $userId 用户ID
     * @param int $roleId 角色ID
     * @$creditData array 更新数据  如 array('point'=>10) point 指更新的字段，10为更新的数量
     */
    public function incOrDec($userId = 0,$roleId = 0,$creditData = array(), $info = '',$log = true){
        if(!$userId && !$roleId){
            return result_data(0,'缺少用户ID或是角色ID!');
        }
        if($roleId){ //更新角色积分
            $result = D('Role')->setIncOrDec($roleId,$creditData);
        }else{ //更新用户积分
            $result = D('User')->setIncOrDec($userId,$creditData);
        }
        if($log){
            foreach ($creditData as $key => $value) {
                if($value >= 0){ //赚取
                    $type = 1;
                }else{ //消耗
                    $type = 2;
                }
                $result = $this->saveCreditLog($userId, $roleId, 0, $key, $value, $type, $info);
            }  
        }
        return $result;
    }
    
    /*
     * 根据规则更新积分写日志
     * 当角色ID不为空的时候，那主要是根据角色判断
     * @param int $userId 用户ID
     * @param int $roleId 角色ID
     * @param string $ruleKey 规则KEY
     * @param string $info 备注信息
     */
    public function ruleIncOrDec($userId = 0,$roleId = 0,$ruleKey = '',$info = '') {
        if(!$userId && !$roleId){
            return result_data(0,'缺少用户ID或是角色ID！');
        }
        if(empty($ruleKey)){ //根据规则更新积分
            return result_data(0,'缺少积分规则！');
        }
        
        $rule = get_array_val(get_cache('CreditRule'),$ruleKey); //单条规则
        if(!$rule) return result_data(0,'该积分规则不存在！');
        if($rule['timeType']){
            if(!intval($rule['timeNum'])) return result_data(0,'时间长度大于0！');
            if(!intval($rule['ruleTypeNum'])) return result_data(0,'次数上线必须大于0！');
            if($rule['timeType'] == 1){ //根据全局
                $where = array('userId'=>$userId,'roleId'=>$roleId,'ruleId'=>$rule['id']);
            }else if($rule['timeType'] > 1){ //根据时间类型  月和天
                $days = intval($rule['timeNum']);
                if($rule['timeType'] == 2){
                    $days = $rule['timeNum'] * 30;
                }
                $curTime = date("Y-m-d H:i:s",NOW_TIME); //当天时间
                $curTime2 = date("Y-m-d",NOW_TIME);
                $beginTime = date("Y-m-d H:i:s",strtotime('-'.$days.' days', NOW_TIME)); //开始时间
                $where = array('userId'=>$userId,'roleId'=>$roleId,'ruleId'=>$rule['id'],array('modTime'=>array(array('egt',$beginTime),array('elt',$curTime),'and')));
            }
            $sumNum = D('CreditRuleLog')->where($where)->sum('num');
            if($sumNum >= $rule['ruleTypeNum']) return result_data(0,'超出次数规则上限');
            $curWhere = array('userId'=>$userId,'roleId'=>$roleId,'ruleId'=>$rule['id'],'modTime'=>$curTime2);
            $ruleLog = D('CreditRuleLog')->where($curWhere)->find();
            if(!$ruleLog){ //不存在则添加今天的积分规则日志
                $result = D('CreditRuleLog')->saveData(array('userId'=>$userId,'roleId'=>$roleId,'ruleId'=>$rule['id'],'num'=>1));
            }else{ //存在更新次数
                $result = D('CreditRuleLog')->saveData(array('id'=>$ruleLog['id'],'num'=>$ruleLog['num']+1));
            }   
        }
        //接下来添加积分
        $credit = get_array_val(get_cache('Credit'),$rule['creditId']);
        if($rule['ruleType'] == 1){ //赚取
            $creditNum = $rule['creditNum'];
        }else{
            $creditNum = '-'.$rule['creditNum'];
        }
        $result = $this->incOrDec($userId,$roleId,array($credit['keyName']=>$creditNum),$info,false);
        
        //添加积分日志
        $creditLog = array(
            'userId' => $userId,
            'roleId' => $roleId,
            'ruleId' => $rule['id'],
            'ruleName' => $rule['name'],
            'creditNum' => $rule['creditNum'],
            'type' => $rule['ruleType'],
            'info' => $info,
        );
        
        $result = $this->saveCreditLog($userId, $roleId, $rule['id'], $rule['name'], $rule['creditNum'],$rule['ruleType'],$info);
        return $result;
    }
    
    /*
     * 保存积分日志
     */
    public function saveCreditLog($userId=0,$roleId=0,$ruleId=0,$ruleName='',$creditNum=0,$type,$info='') {
        $creditLog = array(
            'userId' => $userId,
            'roleId' => $roleId,
            'ruleId' => $ruleId,
            'ruleName' => $ruleName,
            'creditNum' => $creditNum,
            'type' => $type,
            'info' => $info,
        );
        $result = D('CreditLog')->saveData($creditLog);
        return $result;
    }
    
    
}