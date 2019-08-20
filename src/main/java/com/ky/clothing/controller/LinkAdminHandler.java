package com.ky.clothing.controller;

import com.ky.clothing.entity.Order;
import com.ky.clothing.entity.User;
import com.ky.clothing.enums.SysParamEnum;
import com.ky.clothing.service.GoodsService;
import com.ky.clothing.service.OrderService;
import com.ky.clothing.service.UserService;
import com.ky.clothing.util.IntegerUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * 管理员页面跳转
 */
@RequestMapping(value = "/lk/admin")
@Controller
public class LinkAdminHandler {

    private UserService userService;
    private GoodsService goodsService;
    private OrderService orderService;

    @RequestMapping(value = "/order/list/{pageNow}/{pageSize}", method = RequestMethod.GET)
    public ModelAndView goOrderList(@PathVariable("pageNow") Integer pageNow,
                                    @PathVariable("pageSize") Integer pageSize){
        ModelAndView modelAndView = new ModelAndView("pages/admin/order_list");
        //空值校验
        if(IntegerUtil.isNotValid(pageNow) || IntegerUtil.isNotValid(pageSize)){
            modelAndView.addObject(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "存在空值");
        } else {
            //获取查询的索引位
            int startIndex = (pageNow - 1) * pageSize;
            //获取查询结果
            Map<String, Object> resMap = orderService.selectLimit(startIndex, pageSize);
            @SuppressWarnings("unchecked")
            List<Order> orderList = (List<Order>) resMap.get("orderList");
            Integer pageNum = Integer.parseInt(resMap.get("pageNum").toString());
            //存入request
            modelAndView.addObject(SysParamEnum.REQUEST_ORDER_LIST_NAME.toString(), orderList);
            modelAndView.addObject(SysParamEnum.SESSION_PAGE_NUM.toString(), pageNum);
            modelAndView.addObject(SysParamEnum.SESSION_PAGE_NOW.toString(), pageNow);
        }
        return modelAndView;
    }

    @RequestMapping(value = "/goods/list/{pageNow}/{pageSize}", method = RequestMethod.GET)
    public ModelAndView goGoodsList(@PathVariable("pageNow") Integer pageNow,
                                    @PathVariable("pageSize") Integer pageSize){
        ModelAndView modelAndView = new ModelAndView("pages/admin/goods_list");
        //空值校验
        if(IntegerUtil.isNotValid(pageNow) || IntegerUtil.isNotValid(pageSize)){
            modelAndView.addObject(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "存在空值");
        } else{
            //获取查询的索引位
            int startIndex = (pageNow - 1) * pageSize;
            //获取查询结果
            Map<String, Object> map = goodsService.selectAllBaseInfoLimit(startIndex, pageSize);
            @SuppressWarnings("unchecked")
            List<User> goodsList = (List<User>) map.get("goodsList");
            int totalPage = (int)map.get("totalPage");
            //存入request
            modelAndView.addObject(SysParamEnum.REQUEST_GOODS_LIST.toString(), goodsList);
            modelAndView.addObject(SysParamEnum.SESSION_PAGE_NUM.toString(), totalPage);
            modelAndView.addObject(SysParamEnum.SESSION_PAGE_NOW.toString(), pageNow);
        }
        return modelAndView;
    }

    /**
     * 跳转到用户管理页面
     * @param pageNow 当前页
     * @param pageSize 页大小
     * @param request 请求域
     * @return 返回目标页
     */
    @RequestMapping(value = "/user/list/{pageNow}/{pageSize}", method = RequestMethod.GET)
    public String goUserList(@PathVariable("pageNow") Integer pageNow,
                             @PathVariable("pageSize") Integer pageSize,
                             HttpServletRequest request){
        //空值校验
        if(IntegerUtil.isNotValid(pageNow) || IntegerUtil.isNotValid(pageSize)){
            request.setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "存在空值");
        } else{
            //获取查询的索引位
            int startIndex = (pageNow - 1) * pageSize;
            //获取查询结果
            Map<String, Object> map = userService.selectAllUserBaseInfoLimit(startIndex, pageSize);
            @SuppressWarnings("unchecked")
            List<User> userList = (List<User>) map.get("userList");
            int totalPage = (int)map.get("totalPage");
            //存入request
            request.setAttribute(SysParamEnum.SESSION_USER_LIST.toString(), userList);
            request.setAttribute(SysParamEnum.SESSION_PAGE_NUM.toString(), totalPage);
            request.setAttribute(SysParamEnum.SESSION_PAGE_NOW.toString(), pageNow);
        }
        return "/pages/admin/user_list";
    }

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
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }
}
