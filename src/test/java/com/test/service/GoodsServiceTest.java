package com.test.service;

import com.ky.clothing.entity.Goods;
import com.ky.clothing.service.GoodsService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class GoodsServiceTest {

    private GoodsService goodsService;

    @Before
    public void init(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext-web.xml");
        goodsService = applicationContext.getBean(GoodsService.class);
    }

    @Test
    public void test01(){
        List<Goods> goodsList = goodsService.selectGoodsTopThree();
        System.out.println(goodsList);
    }
}
