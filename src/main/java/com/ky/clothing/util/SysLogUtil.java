package com.ky.clothing.util;


import com.ky.clothing.entity.SysLog;
import com.ky.clothing.entity.User;
import com.ky.clothing.enums.SysParamEnum;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author Daye
 * 系统日志工具类
 */
public class SysLogUtil {

    /**
     * 将登录的用户信息存入
     * @param user 登录的用户对象
     * @param request 请求域
     * @param operate 操作名
     * @param module 操作模块
     * @param content 操作内容
     * @return 返回日志对象
     */
    public static SysLog initUserSysLog(User user,
                                        HttpServletRequest request,
                                        String operate,
                                        String module,
                                        String content) {
        //创建对象
        SysLog sysLog = new SysLog();
        //设置用户账号
        sysLog.setSysUser(user.getLoginAccount());
        //设置用户登录ip
        sysLog.setSysIp(IpUtil.getIpAddress(request));
        //设置操作信息
        sysLog.setSysOperator(operate);
        //设置操作模块
        sysLog.setSysModule(module);
        //设置具体内容
        sysLog.setSysContent(content);
        //返回日志对象
        return sysLog;
    }

    /**
     * 设置用户的操作内容等
     *
     * @param operate 操作名
     * @param module  操作模块
     * @param content 操作内容
     * @return 封装好的sysLog对象
     */
    public static SysLog setOperateInfoFromSession(HttpSession session,
                                        String operate,
                                        String module,
                                        String content) {
        SysLog sysLog = (SysLog) session.getAttribute(SysParamEnum.SESSION_SYS_LOG_NAME.toString());
        //设置操作信息
        sysLog.setSysOperator(operate);
        //设置操作模块
        sysLog.setSysModule(module);
        //设置具体内容
        sysLog.setSysContent(content);
        //返回对象
        return sysLog;
    }

    /**
     * 设置用户的操作内容等
     *
     * @param operate 操作名
     * @param module  操作模块
     * @param content 操作内容
     */
    public static void setOperateInfoByObject(SysLog sysLog,
                                              String operate,
                                              String module,
                                              String content) {
        //设置操作信息
        sysLog.setSysOperator(operate);
        //设置操作模块
        sysLog.setSysModule(module);
        //设置具体内容
        sysLog.setSysContent(content);
    }
}
