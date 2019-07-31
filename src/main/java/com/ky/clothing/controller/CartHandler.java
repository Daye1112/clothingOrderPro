package com.ky.clothing.controller;

import com.ky.clothing.entity.Cart;
import com.ky.clothing.entity.User;
import com.ky.clothing.enums.SysParamEnum;
import com.ky.clothing.service.CartService;
import com.ky.clothing.util.IntegerUtil;
import com.ky.clothing.util.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
 * 购物车处理器
 */
@RequestMapping(value = "/cart")
@Controller
public class CartHandler {
    private static final Logger LOGGER = LoggerFactory.getLogger(CartHandler.class);

    private CartService cartService;

    @RequestMapping(value = "/update/num", method = RequestMethod.POST)
    public ModelAndView updateCart(Cart cart, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        //1. 判断cartGoodsNum，cartId是否为空
        if(IntegerUtil.isNotValid(cart.getCartId()) || IntegerUtil.isNotValid(cart.getCartGoodsNum())){
            request.getSession().setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "请输入商品数量");
        }else{
            cartService.updateCartGoodsNumByCartId(cart);
            request.getSession().setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "修改成功");
        }
        //2. 更新数据
        modelAndView.setViewName("redirect:/cart/info.html");
        return modelAndView;
    }

    /**
     * 清空购物车
     *
     * @param request 请求域
     * @return 返回modelAndView
     */
    @RequestMapping(value = "/clear", method = RequestMethod.GET)
    public ModelAndView clearCart(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        User user = (User) request.getSession().getAttribute(SysParamEnum.SESSION_USER_NAME.toString());
        cartService.deleteByUserId(user.getUserId());
        request.getSession().setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "已清空购物车");
        modelAndView.setViewName("redirect:/cart/info.html");
        return modelAndView;
    }

    /**
     * 根据购物车id删除购物车
     *
     * @param cartId 购物车id
     * @return 返回modelAndView
     */
    @RequestMapping(value = "/del/{cartId}", method = RequestMethod.GET)
    public ModelAndView delCartByCartId(@PathVariable("cartId") Integer cartId, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        if (IntegerUtil.isNotValid(cartId)) {
            request.getSession().setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "请选择要删除的商品");
        } else {
            cartService.deleteByCartId(cartId);
            request.getSession().setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "已删除该商品");
        }
        modelAndView.setViewName("redirect:/cart/info.html");
        return modelAndView;
    }

    /**
     * 跳转到用户的购物车页面，同时准备好购物车的数据
     *
     * @param request request域
     * @return 返回modelAndView
     */
    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public ModelAndView prepareUserCart(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        //查询用户的购物车信息
        List<Map<String, Object>> cartList = cartService.findBaseInfoByUserId(((User) request.getSession().getAttribute(SysParamEnum.SESSION_USER_NAME.toString())).getUserId());
        //System.out.println(cartList);
        //存入session
        request.getSession().setAttribute(SysParamEnum.SESSION_CART_LIST_NAME.toString(), cartList);
        modelAndView.setViewName("pages/cart");
        return modelAndView;
    }

    /**
     * 添加商品到用户购物车中
     *
     * @param cart    购物车对象
     * @param request 请求域
     * @return modelAndView
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ModelAndView addGoodsToCart(Cart cart, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        //1. 空值判断
        if (IntegerUtil.isNotValid(cart.getGoodsId()) || IntegerUtil.isNotValid(cart.getCartGoodsNum())
                || StringUtil.isEmpty(cart.getCartGoodsSize())) {
            request.getSession().setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "请选择要加入购物车的商品和尺寸");
        } else {
            //2. 从session中取出用户信息
            User user = (User) request.getSession().getAttribute(SysParamEnum.SESSION_USER_NAME.toString());
            //3. 将用户id设置入cart对象中
            cart.setUserId(user.getUserId());
            //4. 判断用户是否加入了同一个size的同一件商品进入购物车
            Cart checkCartIsNew = cartService.checkCartIsNew(cart);
            if (checkCartIsNew == null) {
                //5. 如果无重复商品，插入新的记录
                cartService.addCart(cart);
                @SuppressWarnings("unchecked")
                Map<String, Object> shopInfo = (Map<String, Object>) request.getSession().getAttribute(SysParamEnum.SESSION_SHOP_INFO_NAME.toString());
                shopInfo.put("cartCnt", (int) shopInfo.get("cartCnt") + 1);
            } else {
                //6. 如果有同商品，商品num++
                cartService.updateCartGoodsNumInc(checkCartIsNew);
            } // if 4 end
        }// if 1 end
        modelAndView.setViewName("redirect:/cart/info.html");
        return modelAndView;
    }

    @Autowired
    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }
}
