package com.ky.clothing.service;

import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * 订单细节表Service层接口类
 */
public interface OrderDetailService {
    /**
     * 根据orderId查询订单详情表
     * @param orderId 订单id
     * @return 返回listMap
     */
    List<Map<String, Object>> selectOrderDetailByOrderId(Integer orderId);
}
