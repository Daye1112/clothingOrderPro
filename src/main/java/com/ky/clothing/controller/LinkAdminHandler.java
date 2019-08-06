package com.ky.clothing.controller;

import com.ky.clothing.entity.User;
import com.ky.clothing.enums.SysParamEnum;
import com.ky.clothing.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author Daye
 * 管理员页面跳转
 */
@RequestMapping(value = "/lk/admin")
@Controller
public class LinkAdminHandler {

    private UserService userService;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String goHome(){
        return "/pages/admin/home";
    }

    /**
     * 跳转到后台登录页面
     * @return 跳转到目标页面
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String goAdminLogin(){
        return "/pages/admin/login";
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
