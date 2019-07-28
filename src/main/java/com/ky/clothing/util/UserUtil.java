package com.ky.clothing.util;

import com.ky.clothing.entity.User;

/**
 * @author Daye
 * 用户工具类
 */
public class UserUtil {

    public static boolean mergeUser(User master, User pull){
        if(master == null || pull == null){
            return false;
        }
        boolean flag = false;
        if(StringUtil.isNotEmpty(pull.getIdCard()) && (StringUtil.isEmpty(master.getIdCard()) || !master.getIdCard().equals(pull.getIdCard()))){
            master.setIdCard(pull.getIdCard());
            flag = true;
        }
        if(StringUtil.isNotEmpty(pull.getPhone()) && (StringUtil.isEmpty(master.getPhone()) || ! master.getPhone().equals(pull.getPhone()))){
            master.setPhone(pull.getPhone());
            flag = true;
        }
        if(StringUtil.isNotEmpty(pull.getEmail()) && (StringUtil.isEmpty(master.getEmail()) || ! master.getEmail().equals(pull.getEmail()))){
            master.setEmail(pull.getEmail());
            flag = true;
        }
        if(StringUtil.isNotEmpty(pull.getSex()) && (StringUtil.isEmpty(master.getSex()) || ! master.getSex().equals(pull.getSex()))){
            master.setSex(pull.getSex());
            flag = true;
        }
        return flag;
    }
}
