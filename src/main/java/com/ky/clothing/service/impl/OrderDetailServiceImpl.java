package com.ky.clothing.service.impl;

import com.ky.clothing.dao.OrderDetailMapper;
import com.ky.clothing.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * 订单详情表Service层实现类
 */
@Service
public class OrderDetailServiceImpl implements OrderDetailService {
    private OrderDetailMapper orderDetailMapper;

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public List<Map<String, Object>> selectOrderDetailByOrderId(Integer orderId) {
        return orderDetailMapper.selectOrderDetailByOrderId(orderId);
    }

    @Autowired
    public void setOrderDetailMapper(OrderDetailMapper orderDetailMapper) {
        this.orderDetailMapper = orderDetailMapper;
    }
}
