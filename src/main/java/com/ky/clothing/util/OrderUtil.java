package com.ky.clothing.util;

import com.ky.clothing.entity.Order;
import com.ky.clothing.entity.User;

import java.util.*;

/**
 * @author Daye
 * 订单工具类
 */
public class OrderUtil {

    public static Set<Integer> extractGoodsId(List<Map<String, Object>> cartList){
        Set<Integer> goodsIdSet = new HashSet<>();
        for (Map<String, Object> cart : cartList) {
            goodsIdSet.add(Integer.parseInt(cart.get("goodsId").toString()));
        }
        return goodsIdSet;
    }

    /**
     * 初始化订单信息
     * @param order 订单
     * @param user 用户
     * @return 返回订单信息
     */
    public static Order initOrder(Order order, User user){
        //设置用户id
        order.setUserId(user.getUserId());
        //设置订单号(随机)
        order.setOrderNo(RandomUtil.randomNumber(16));
        //订单状态初始化
        order.setOrderStatus((short)0);
        //初始化是否支付
        order.setIspay((short)0);
        //初始化是否需要发票
        order.setIsinvoice((short)0);
        //初始化订单是否完结
        order.setIsclosed((short)0);
        //初始化下单时间
        order.setCreateTime(new Date());
        return order;
    }

    /**
     * 判断用户传进来的order是否是有效的
     * @param order 订单
     * @return boolean
     */
    public static boolean isNotValidOrder(Order order){
        return (DoubleUtil.isNotValid(order.getGoodsMoney()) || DoubleUtil.isNotValid(order.getTotalMoney())
                || DoubleUtil.isNotValid(order.getDeliverMoney()) || StringUtil.isEmpty(order.getOrderAddress())
                || StringUtil.isEmpty(order.getUserRealName()) || StringUtil.isEmpty(order.getUserPhone()));
    }


}
