package com.ky.clothing.controller;

import com.ky.clothing.entity.User;
import com.ky.clothing.enums.SysParamEnum;
import com.ky.clothing.service.CartService;
import com.ky.clothing.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @author Daye
 */
@Controller
@RequestMapping("/userLink")
public class LinkUserHandler {

    private CartService cartService;
    private OrderService orderService;

    /**
     * 跳转到用户订单列表
     */
    @RequestMapping(value = "/order/list", method = RequestMethod.GET)
    public String toOrderList(HttpServletRequest request){
        //1. 获取session中的用户信息
        User user = (User) request.getSession().getAttribute(SysParamEnum.SESSION_USER_NAME.toString());
        //2. 获取订单基本信息list
        List<Map<String, Object>> orderList = orderService.selectBaseInfoByUserId(user.getUserId());
        //存入request中
        request.setAttribute(SysParamEnum.REQUEST_ORDER_LIST_NAME.toString(), orderList);
        return "/pages/order_list";
    }

    /**
     * 跳转到订单确认页面
     */
    @RequestMapping(value = "/check/order", method = RequestMethod.GET)
    public String toCheckOrder(HttpServletRequest request){
        //1. 获取session中的用户信息
        User user = (User) request.getSession().getAttribute(SysParamEnum.SESSION_USER_NAME.toString());
        //2. 获取用户的购物车信息
        List<Map<String, Object>> cartGoodsList = cartService.findByUserIdForCheckOrder(user.getUserId());
        //存入request中
        request.setAttribute(SysParamEnum.SESSION_CART_LIST_NAME.toString(), cartGoodsList);
        return "/pages/check_order";
    }

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

    @Autowired
    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }
}
