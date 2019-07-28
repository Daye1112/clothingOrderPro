package com.ky.clothing.controller;

import com.ky.clothing.entity.User;
import com.ky.clothing.enums.SysParamEnum;
import com.ky.clothing.service.SysLogService;
import com.ky.clothing.service.UserService;
import com.ky.clothing.util.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Calendar;

/**
 * @author Daye
 * 用户操作处理器
 */
@Controller
@RequestMapping("/user")
public class UserHandler {
    private static final Logger LOGGER = LoggerFactory.getLogger(UserHandler.class);

    private SysLogService sysLogService;
    private UserService userService;

    /**
     * 用户修改头像
     * @param imgBase 转码后的base64编码
     * @param imgName 文件名
     * @param request 请求域
     * @return json响应
     */
    @RequestMapping(value = "/file/avatar", method = RequestMethod.POST)
    public ModelAndView modifyAvatar(String imgBase, String imgName, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        try {
            //1. 判断空值
            if (StringUtil.isEmpty(imgBase) || StringUtil.isEmpty(imgName) || !FileUtil.checkImageSuffix(imgName)) {
                modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "请选择图片");
            } else {
                //2. 获取当前时间yyyyMMddHHmmssSS
                String nowDate = DateUtil.getNowTimeContinuous();
                //3. 确定uploads文件夹位置
                String rootPath = request.getSession().getServletContext().getRealPath("static/uploads/");
                //4. 获取当年当月的文件夹路径
                String dateFilePath = FileUtil.getDateFilePath(rootPath);
                //5. 判断文件夹是否存在，若不存在则创建
                boolean createFileFlag = FileUtil.createFile(dateFilePath);
                //6. 判断创建文件名是否成功
                if(!createFileFlag){
                    modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "文件创建失败,请联系管理员");
                } else{
                    //6. 获取user
                    User user = (User) request.getSession().getAttribute(SysParamEnum.SESSION_USER_NAME.toString());
                    //7. 创建新文件名
                    String newFileName = user.getLoginAccount() + "_" + nowDate + imgName.substring(imgName.lastIndexOf("."));
                    //8. 图片转码并存入文件夹中
                    boolean saveImgFlag = ImgBaseUtil.GenerateImage(imgBase.split(",")[1], dateFilePath + "/" + newFileName);
                    //9. 判断文件是否保存成功
                    if(!saveImgFlag){
                        modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "图片保存失败，请联系管理员");
                    } else{
                        //10. 获取文件的相对路径
                        Calendar date = Calendar.getInstance();
                        String newImgPath = "/static/uploads/" + date.get(Calendar.YEAR) + "/" + (date.get(Calendar.MONTH)+1) + "/" + newFileName;
                        //11. 将文件的相对路径存入user对象中
                        user.setAvatarUrl(newImgPath);
                        //12. 调用service层，进行保存
                        userService.updateAvatarUrlByUserId(user);
                        //14. 记录操作到日志表中
                        sysLogService.insertSelective(SysLogUtil.initUserSysLog(user, request, "更新头像", "/user/file/avatar", "修改头像成功"));
                        //15. 返回提示
                        modelAndView.addObject(SysParamEnum.SUCCEED_MSG_NAME.toString(), "头像修改成功！");
                    }//9. 判断文件是否保存成功 End
                }//6. 判断创建文件名是否成功 End
            }//1. 判断空值 End
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            //异常反馈
            modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "图片上传失败");
        }
        //设置跳转页面
        modelAndView.setViewName("/pages/user_info");
        //进行跳转
        return modelAndView;
    }

    /**
     * 用户账号注册
     *
     * @param user    用户对象
     * @param request 请求域
     * @return 返回modelAndView
     */
    @RequestMapping(value = "/signUp", method = RequestMethod.POST)
    public ModelAndView userSignUp(User user, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        try {
            //1. 空值验证
            if (StringUtil.isEmpty(user.getLoginAccount()) || StringUtil.isEmpty(user.getEmail()) || StringUtil.isEmpty(user.getPassword())) {
                modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "请填写全信息");
            } else {  //无空值
                //2. 邮箱、账号查重
                boolean checkLoginAccountRepeat = userService.checkLoginAccountRepeat(user.getLoginAccount());
                boolean checkEmailRepeat = userService.checkEmailRepeat(user.getEmail());
                if (checkEmailRepeat || checkLoginAccountRepeat) {
                    //2.1 根据不同的重复来进行提示
                    if (checkEmailRepeat && checkLoginAccountRepeat) {
                        //都重复
                        modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "您的账号和邮箱都已存在");
                    } else if (checkEmailRepeat) {
                        //邮箱重复
                        modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "邮箱已被其他账号绑定，请核对<br/>如有疑问请联系客服");
                    } else if (checkLoginAccountRepeat) {
                        //账号重复
                        modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "账号已存在，请修改");
                    }//if 根据不同的重复来进行提示 End
                } else { //不存在重复
                    //3. 插入数据
                    userService.signUp(user);
                    //4. 设置返回值
                    modelAndView.addObject(SysParamEnum.SUCCEED_MSG_NAME.toString(), "注册成功！<a href='" + request.getContextPath() + "/userLink/login'>前往登录</a>");
                    //5. 记录日志
                    sysLogService.insertSelective(SysLogUtil.initUserSysLog(user, request, "注册账号", "/user/signUp", "注册成功"));
                }//if 邮箱、账号查重 End
            }//if 空值验证 End
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            //异常反馈
            modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "注册失败，操作异常");
        }
        modelAndView.setViewName("pages/sign_up");
        return modelAndView;
    }

    /**
     * 用户修改自身密码
     *
     * @param oldPassword      旧密码
     * @param newPassword      新密码
     * @param newPasswordCheck 新密码确认
     * @param request          request域
     * @return modelAndView
     */
    @RequestMapping(value = "/update/pwd", method = RequestMethod.POST)
    public ModelAndView userUpdatePassword(String oldPassword, String newPassword, String newPasswordCheck, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        try {
            User user = (User) request.getSession().getAttribute(SysParamEnum.SESSION_USER_NAME.toString());
            //判断是否存在空值
            if (StringUtil.isEmpty(oldPassword) || StringUtil.isEmpty(newPassword) || StringUtil.isEmpty(newPasswordCheck)) {
                modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "请输入必要信息");
            } else {    //没有空值
                //判断两个密码是否一致
                if (!newPassword.equals(newPasswordCheck)) {
                    modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "两次密码输入不一致");
                } else { //密码一致
                    //判断输入的原密码与当前密码是否一致
                    if (!oldPassword.equals(user.getPassword())) {
                        modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "原密码错误");
                    } else { //与当前密码一致
                        //提交到service进行修改
                        int changeCnt = userService.updatePasswordByUserId(user.getUserId(), newPassword);
                        //更新session中的user密码
                        user.setPassword(newPassword);
                        //添加提示反馈
                        modelAndView.addObject(SysParamEnum.SUCCEED_MSG_NAME.toString(), "密码修改成功");
                        //在日志中记录用户操作
                        sysLogService.insertSelective(SysLogUtil.initUserSysLog(user, request, "修改个人密码", "/user/update/pwd", "修改个人密码成功：" + oldPassword + "->" + newPassword));
                    }//判断输入的原密码与当前密码是否一致End
                }////判断两个密码是否一致End
            }//空值判断End
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            //异常反馈
            modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "更新失败，操作异常");
        }
        //设置跳转页面
        modelAndView.setViewName("/pages/user_info");
        //进行跳转
        return modelAndView;
    }

    /**
     * 用户修改自身基本信息
     * IdCard、Phone、Email、Sex
     *
     * @param user    新提交的用户对象
     * @param request request域
     * @return 返回modelAndView
     */
    @RequestMapping(value = "/update/self", method = RequestMethod.POST)
    public ModelAndView userUpdateInfo(User user, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        //获取session中的登录用户信息
        User master = (User) request.getSession().getAttribute(SysParamEnum.SESSION_USER_NAME.toString());
        try {
            //进行提交信息和原有信息的校对
            boolean flag = UserUtil.mergeUser(master, user);
            //如果存在修改值，则进行update提交
            if (flag) {
                userService.updateByPrimaryKeySelective(master);
                //设置更新成功提示
                modelAndView.addObject(SysParamEnum.SUCCEED_MSG_NAME.toString(), "个人信息更新成功");
                sysLogService.insertSelective(SysLogUtil.initUserSysLog(master, request, "修改个人信息", "/user/update/self", "修改个人信息成功，更新的信息为:" + master));
            } else {
                //设置无信息更改提示
                modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "无信息修改");
            }
        } catch (Exception e) {
            //异常提示
            LOGGER.error(e.getMessage(), e);
            //回退数据库当前的数据
            master = userService.selectByPrimaryKey(master.getUserId());
            //重新存入session中
            request.getSession().setAttribute(SysParamEnum.SESSION_USER_NAME.toString(), master);
            //异常反馈
            modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "更新失败，操作异常");
        }
        //设置跳转页面
        modelAndView.setViewName("/pages/user_info");
        //进行跳转
        return modelAndView;
    }

    /**
     * 用户登录
     *
     * @param user    登录的用户信息
     * @param request request域
     * @return 返回到
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView userLogin(User user, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        //获取用户
        Subject subject = SecurityUtils.getSubject();
        //设置用户的账号密码
        UsernamePasswordToken token = new UsernamePasswordToken(user.getLoginAccount(), user.getPassword());
        try {
            //进行登录验证
            subject.login(token);
        } catch (DisabledAccountException dax) {
            //账号无效
            modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "用户名已经被禁用！");
        } catch (UnknownAccountException uae) {
            //账号错误
            modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "账号不存在！");
        } catch (IncorrectCredentialsException ice) {
            //密码错误
            modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "密码错误！");
        } catch (Exception e) {
            //其他异常
            LOGGER.error("", e);
            modelAndView.addObject(SysParamEnum.ERROR_MSG_NAME.toString(), "未知异常信息！");
        }
        //判断用户是否登录成功
        if (subject.isAuthenticated()) {
            //记录用户登录
            sysLogService.insertSelective(SysLogUtil.initUserSysLog((User) request.getSession().getAttribute(SysParamEnum.SESSION_USER_NAME.toString()), request, "登录", "user/login", "用户登录系统"));
            //成功则跳转到主页
            modelAndView.setViewName("redirect:/customerLink/home.html");
        } else {
            //失败跳转回登录页面
            modelAndView.setViewName("/pages/login");
        }
        return modelAndView;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setSysLogService(SysLogService sysLogService) {
        this.sysLogService = sysLogService;
    }
}
