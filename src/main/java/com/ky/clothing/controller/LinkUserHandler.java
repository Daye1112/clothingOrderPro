package com.ky.clothing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Daye
 */
@Controller
@RequestMapping("/userLink")
public class LinkUserHandler {

    /**
     * 跳转到登录页面
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String toUserLogin(){
        return "/pages/login";
    }

    /**
     * 跳转到个人信息页面
     */
    @RequestMapping(value = "/self/info", method = RequestMethod.GET)
    public String toUserInfo(){
        return "/pages/user_info";
    }
}
