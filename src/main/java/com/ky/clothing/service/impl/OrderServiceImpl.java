package com.ky.clothing.service.impl;

import com.ky.clothing.dao.CartMapper;
import com.ky.clothing.dao.OrderDetailMapper;
import com.ky.clothing.dao.OrderMapper;
import com.ky.clothing.entity.Order;
import com.ky.clothing.entity.OrderDetail;
import com.ky.clothing.entity.User;
import com.ky.clothing.service.OrderService;
import com.ky.clothing.util.OrderDetailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * 订单表Service层实现类
 */
@Service
public class OrderServiceImpl implements OrderService {

    private OrderMapper orderMapper;
    private CartMapper cartMapper;
    private OrderDetailMapper orderDetailMapper;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int updateByPrimaryKeySelective(Order order) {
        return orderMapper.updateByPrimaryKeySelective(order);
    }

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public Map<String, Object> selectLimit(Integer startIndex, Integer pageSize) {
        Map<String, Object> resMap = new HashMap<>();
        List<Order> orderList = orderMapper.selectLimit(startIndex, pageSize);
        Integer totalRecording = orderMapper.selectCountOrderId();
        Integer pageNum = (totalRecording + pageSize + 1) / pageSize;
        resMap.put("orderList", orderList);
        resMap.put("pageNum", pageNum);
        return resMap;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateIsPayAndOrderStatusByOrderNo(String orderNo) {
        orderMapper.updateIsPayAndOrderStatusByOrderNo(orderNo);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteByOrderId(Integer orderId) {
        //将订单的valid标志位置为0
        orderMapper.deleteByOrderId(orderId);
        //将订单对应的订单的所有内容valid标志位置为0
        orderDetailMapper.deleteByOrderId(orderId);
    }

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public List<Map<String, Object>> selectOrderDetailByOrderId(Integer orderId) {
        return orderDetailMapper.selectOrderDetailByOrderId(orderId);
    }

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public Order selectByPrimaryKey(Integer orderId) {
        Order order = orderMapper.selectByPrimaryKey(orderId);
        if(order == null){
            return new Order();
        } else{
            return order;
        }
    }

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public List<Map<String, Object>> selectBaseInfoByUserId(Integer userId) {
        return orderMapper.selectBaseInfoByUserId(userId);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveOrder(Order order, User user, List<Map<String, Object>> cartList) {
        //1. 保存order
        orderMapper.insertSelective(order);
        //2. 获取订单细节对象list
        List<OrderDetail> orderDetailList = OrderDetailUtil.initOrderDetailByOrder(order, cartList);
        //3. 插入订单细节表
        orderDetailMapper.insertList(orderDetailList);
        //4. 清空用户的购物车，将其购买标志定位true
        cartMapper.updateIsBuyByUserId(user.getUserId());
    }

    @Autowired
    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Autowired
    public void setCartMapper(CartMapper cartMapper) {
        this.cartMapper = cartMapper;
    }

    @Autowired
    public void setOrderDetailMapper(OrderDetailMapper orderDetailMapper) {
        this.orderDetailMapper = orderDetailMapper;
    }
}
