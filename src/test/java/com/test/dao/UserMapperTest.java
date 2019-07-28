package com.test.dao;

import com.ky.clothing.dao.UserMapper;
import com.ky.clothing.entity.User;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UserMapperTest {

    private UserMapper userMapper;

    @Before
    public void init(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext-web.xml");
        userMapper = applicationContext.getBean(UserMapper.class);
    }

    @Test
    public void test02(){
        Integer emailCnt = userMapper.selectCountEmail("784121671@qq.com");
        Integer loginAccountCnt = userMapper.selectCountLoginAccount("daye");
        System.out.println(emailCnt);
        System.out.println(loginAccountCnt);
    }

    @Test
    public void test01(){
        User daye = userMapper.selectUserByLoginAccountAndPassword("daye");
        System.out.println(daye);
    }
}
