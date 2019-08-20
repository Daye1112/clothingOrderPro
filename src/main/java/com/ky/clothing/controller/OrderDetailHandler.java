package com.ky.clothing.controller;

import com.ky.clothing.entity.JsonResult;
import com.ky.clothing.enums.ErrorEnum;
import com.ky.clothing.service.OrderDetailService;
import com.ky.clothing.util.IntegerUtil;
import com.ky.clothing.util.JsonResultUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * 订单细节表处理器
 */
@RequestMapping(value = "/detail")
@Controller
public class OrderDetailHandler {

    private final static Logger LOGGER = LoggerFactory.getLogger(OrderDetailHandler.class);

    private OrderDetailService orderDetailService;



    @RequestMapping(value = "/info/{orderId}", method = RequestMethod.GET)
    @ResponseBody
    public JsonResult findOrderDetailByOrderId(@PathVariable("orderId") Integer orderId){
        JsonResult jsonResult;
        //1. 判断orderId是否有效
        if(IntegerUtil.isNotValid(orderId)){
            //设置空值返回信息
            jsonResult = JsonResultUtil.setErrorOf(ErrorEnum.EMPTY_ERROR);
        } else{
            //2. 查询细节list
            List<Map<String, Object>> orderDetailList = orderDetailService.selectOrderDetailByOrderId(orderId);
            //3. 存入json对象中
            jsonResult = JsonResultUtil.setSuccessOf(orderDetailList);
        }
        return jsonResult;
    }

    @Autowired
    public void setOrderDetailService(OrderDetailService orderDetailService) {
        this.orderDetailService = orderDetailService;
    }
}
