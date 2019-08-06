package com.ky.clothing.util;

import com.ky.clothing.entity.Order;
import com.ky.clothing.entity.OrderDetail;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * 订单细节表工具类
 */
public class OrderDetailUtil {

    /**
     * 根据order信息和购物车商品信息初始化订单细节对象
     * @param order 订单对象
     * @param cartList 购物车商品对象list
     * @return 返回订单细节表list
     */
    public static List<OrderDetail> initOrderDetailByOrder(Order order, List<Map<String, Object>> cartList){
        //创建对象list用于返回
        List<OrderDetail> orderDetailList = new ArrayList<>();
        //遍历购物车商品list
        for (Map<String, Object> map : cartList) {
            //创建临时订单细节对象
            OrderDetail orderDetail = new OrderDetail();
            //设置商品id
            orderDetail.setGoodsId((int)map.get("goodsId"));
            //设置订单id
            orderDetail.setOrderId(order.getOrderId());
            //设置商品数量
            orderDetail.setOrderGoodsNum((int)map.get("cartGoodsNum"));
            //设置商品尺寸
            orderDetail.setOrderGoodsSize(map.get("cartGoodsSize").toString());
            //存入list
            orderDetailList.add(orderDetail);
        }
        return orderDetailList;
    }

}
