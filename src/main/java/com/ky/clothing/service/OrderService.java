package com.ky.clothing.service;

import com.ky.clothing.entity.Order;
import com.ky.clothing.entity.User;

import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * 订单表Service层接口类
 */
public interface OrderService {

    /**
     * 根据订单号更新订单的支付信息
     * @param orderNo 订单号
     */
    void updateIsPayAndOrderStatusByOrderNo(String orderNo);

    /**
     * 根据orderId删除order记录
     * @param orderId 订单id
     */
    void deleteByOrderId(Integer orderId);

    /**
     * 根据orderId查询订单详情表
     *
     * @param orderId 订单id
     * @return 返回listMap
     */
    List<Map<String, Object>> selectOrderDetailByOrderId(Integer orderId);

    /**
     * 根据id查询订单记录
     *
     * @param orderId 订单id
     * @return 查询记录的对象
     */
    Order selectByPrimaryKey(Integer orderId);

    /**
     * 根据userId查询用户的所有订单详情
     *
     * @param userId 用户id
     * @return 返回mapList
     */
    List<Map<String, Object>> selectBaseInfoByUserId(Integer userId);

    /**
     * 保存用户提交的order
     *
     * @param order    订单信息
     * @param user     用户信息
     * @param cartList 用户的购物车商品信息
     */
    void saveOrder(Order order, User user, List<Map<String, Object>> cartList);

}
