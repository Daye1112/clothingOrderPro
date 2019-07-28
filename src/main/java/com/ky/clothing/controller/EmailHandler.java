package com.ky.clothing.controller;

import com.ky.clothing.entity.User;
import com.ky.clothing.enums.SysParamEnum;
import com.ky.clothing.service.SysLogService;
import com.ky.clothing.service.UserService;
import com.ky.clothing.util.RandomUtil;
import com.ky.clothing.util.SendMailUtil;
import com.ky.clothing.util.StringUtil;
import com.ky.clothing.util.SysLogUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.UUID;

/**
 * @author Daye
 * email相关操作处理器
 */
@Controller
@RequestMapping("/email")
public class EmailHandler {
    private static final Logger LOGGER = LoggerFactory.getLogger(EmailHandler.class);
    private UserService userService;
    private SysLogService sysLogService;

    /**
     * 根据用户提供的验证码和新密码修改密码
     *
     * @param checkCode        验证码
     * @param newPassword      新密码
     * @param newPasswordCheck 新密码确认
     * @param request          请求域
     * @return modelAndView
     */
    @RequestMapping(value = "/modify/pwd", method = RequestMethod.POST)
    public ModelAndView modifyPwdByEmail(String checkCode, String newPassword, String newPasswordCheck, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        try {
            //0. 空值校验
            if (StringUtil.isEmpty(checkCode) || StringUtil.isEmpty(newPassword) || StringUtil.isEmpty((newPasswordCheck))) {
                modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "存在空值");
            } else { //无空值
                //1. 新密码和确认密码进行核对
                if (!newPassword.equals(newPasswordCheck)) {
                    modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "两次密码不一致");
                } else { //核对成功
                    Object sessionCheckCode = request.getSession().getAttribute(SysParamEnum.SESSION_RANDOM_NUMBER_NAME.toString());
                    //1.5 判断session是否为空
                    if (sessionCheckCode == null) {
                        modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "您已修改过密码或还未请求修改密码");
                    } else {    //session不为空
                        //2. checkCode与session中的checkCode校对
                        if (!(checkCode.trim()).equals(sessionCheckCode.toString().trim())) {
                            modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "验证码错误");
                        } else { //校队成功
                            //3. 取出session中的用户信息
                            User user = (User) request.getSession().getAttribute(SysParamEnum.SESSION_USER_NAME.toString());
                            //4. 修改密码
                            userService.updatePasswordByUserId(user.getUserId(), newPassword);
                            //5. 记录日志
                            sysLogService.insertSelective(SysLogUtil.initUserSysLog(user, request, "修改密码", "/email/modify/pwd", "通过忘记密码修改了密码"));
                            //6. 销毁session中的checkCode对象
                            request.getSession().removeAttribute(SysParamEnum.SESSION_RANDOM_NUMBER_NAME.toString());
                            request.getSession().removeAttribute(SysParamEnum.SESSION_USER_NAME.toString());
                            //设置返回值
                            modelAndView.addObject(SysParamEnum.SUCCEED_MSG_NAME.toString(), "修改成功！");
                        }//2. checkCode与session中的checkCode校对 End
                    }//1.5 判断session是否为空 End
                }//1. 新密码和确认密码进行核对End
            }   // 0. 空值校验end
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "操作异常");
        }
        modelAndView.setViewName("pages/forgot_password_modify");
        return modelAndView;
    }

    /**
     * 发送忘记密码邮件
     *
     * @param email   email地址
     * @param request 请求域
     * @return 返回modelAndView
     */
    @RequestMapping(value = "/pwd/send", method = RequestMethod.POST)
    public ModelAndView sendEmailForModifyPwd(String email, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        try {
            //1. email空值判断
            if (StringUtil.isEmpty(email)) {
                modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "邮箱不可为空");
            } else { //不为空值
                //2. email是否绑定账号
                User user = userService.selectUserIdByEmail(email);
                if (user != null) {
                    //3. 产生6个随机数
                    String randomNumber = RandomUtil.randomNumber(6);
                    //4. 将随机数和user存入session
                    request.getSession().setAttribute(SysParamEnum.SESSION_RANDOM_NUMBER_NAME.toString(), randomNumber);
                    request.getSession().setAttribute(SysParamEnum.SESSION_USER_NAME.toString(), user);
                    //4.5 获取修改密码页面的全路径
                    String modifyPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath() + "/customerLink/forgot/pwd/modify.html";
                    //5. 发送邮件
                    SendMailUtil.sendEmil(email, randomNumber, modifyPath);
                    //6. 设置返回提示
                    modelAndView.addObject(SysParamEnum.SUCCEED_MSG_NAME.toString(), "已发送验证码至您的邮箱<br/>请根据邮箱提示进行密码修改操作");
                    //7. 插入日志记录
                    sysLogService.insertSelective(SysLogUtil.initUserSysLog(user, request, "发送忘记密码邮件", "/email/pwd/send", "发送改密码邮件至->" + email));
                } else { //email未绑定账号
                    modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "邮箱未绑定账号");
                }// email是否绑定账号 End
            }//email空值判断End
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "操作异常");
        }
        modelAndView.setViewName("/pages/forgot_password");
        //6. 跳转
        return modelAndView;
    }

    @Autowired
    public void setSysLogService(SysLogService sysLogService) {
        this.sysLogService = sysLogService;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
