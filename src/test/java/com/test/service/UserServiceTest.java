package com.test.service;

import com.ky.clothing.dao.UserMapper;
import com.ky.clothing.service.UserService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UserServiceTest {

    private UserService userService;

    @Before
    public void init(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext-web.xml");
        userService = applicationContext.getBean(UserService.class);
    }

    @Test
    public void test01(){
        boolean emailBool = userService.checkEmailRepeat("784121671@qq.com");
        boolean loginAccountBool = userService.checkLoginAccountRepeat("dye");
        System.out.println(emailBool);
        System.out.println(loginAccountBool);
    }
}
