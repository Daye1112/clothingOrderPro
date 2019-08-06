package com.ky.clothing.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.ky.clothing.entity.JsonResult;
import com.ky.clothing.entity.Order;
import com.ky.clothing.entity.User;
import com.ky.clothing.enums.ErrorEnum;
import com.ky.clothing.enums.SysParamEnum;
import com.ky.clothing.service.CartService;
import com.ky.clothing.service.OrderService;
import com.ky.clothing.util.AlipayConfig;
import com.ky.clothing.util.IntegerUtil;
import com.ky.clothing.util.JsonResultUtil;
import com.ky.clothing.util.OrderUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * 订单处理类
 */
@RequestMapping(value = "/order")
@Controller
public class OrderHandler {

    private static final Logger LOGGER = LoggerFactory.getLogger(OrderHandler.class);
    private OrderService orderService;
    private CartService cartService;

    @RequestMapping(value = "/pay/over", method = RequestMethod.GET)
    public ModelAndView payOverDeal(HttpServletRequest request) throws UnsupportedEncodingException, AlipayApiException {
        ModelAndView modelAndView = new ModelAndView();
        //获取支付宝GET过来反馈信息
        Map<String, String> params = new HashMap<>(16);
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = iter.next();
            String[] values = requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        //调用SDK验证签名
        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type);
        //判断是否验证成功
        if(signVerified){
            //商户订单号
            String orderNo = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
            //更新订单的支付情况
            orderService.updateIsPayAndOrderStatusByOrderNo(orderNo);
        } else{
            request.getSession().setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "验证失败");
        }
        modelAndView.setViewName("redirect:/userLink/order/list.html");
        return modelAndView;
    }

    @RequestMapping(value = "/goAlipay/{orderId}", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String goAlipay(@PathVariable("orderId") Integer orderId, HttpServletRequest request) throws AlipayApiException {
        Order order = orderService.selectByPrimaryKey(orderId);
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();

        String requestURL = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        alipayRequest.setReturnUrl(requestURL + AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(requestURL + AlipayConfig.notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填
        String outTradeNo = order.getOrderNo();
        //付款金额，必填
        String totalAmount = order.getTotalMoney().toString();
        //订单名称，必填
        String subject = "服装订单";
        //商品描述，可空
        String body = "商品总价:" + order.getGoodsMoney() + ";运费:" + order.getDeliverMoney();

        alipayRequest.setBizContent("{\"out_trade_no\":\"" + outTradeNo + "\","
                + "\"total_amount\":\"" + totalAmount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"body\":\"" + body + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        //请求
        return alipayClient.pageExecute(alipayRequest).getBody();
    }

    /**
     * 根据id删除订单
     *
     * @param orderId 订单id
     * @param request 请求域
     * @return 返回json
     */
    @RequestMapping(value = "/delete/{orderId}", method = RequestMethod.GET)
    @ResponseBody
    public JsonResult deleteOrder(@PathVariable("orderId") Integer orderId, HttpServletRequest request) {
        JsonResult jsonResult;
        //判断是否存在空值
        if (IntegerUtil.isNotValid(orderId)) {
            //返回异常信息
            jsonResult = JsonResultUtil.setErrorOf(ErrorEnum.EMPTY_ERROR);
        } else {
            //删除order
            orderService.deleteByOrderId(orderId);
            //将order对象存入json对象中
            jsonResult = JsonResultUtil.setSuccessOf(null);
        }
        return jsonResult;
    }

    /**
     * 获取订单的详细信息
     *
     * @param orderId 订单id
     * @return 返回json数据
     */
    @RequestMapping(value = "/info/{orderId}", method = RequestMethod.GET)
    @ResponseBody
    public JsonResult findOrderInfo(@PathVariable("orderId") Integer orderId) {
        JsonResult jsonResult;
        //判断是否存在空值
        if (IntegerUtil.isNotValid(orderId)) {
            //返回异常信息
            jsonResult = JsonResultUtil.setErrorOf(ErrorEnum.EMPTY_ERROR);
        } else {
            //获取order对象
            Order order = orderService.selectByPrimaryKey(orderId);
            //将order对象存入json对象中
            jsonResult = JsonResultUtil.setSuccessOf(order);
        }
        return jsonResult;
    }

    /**
     * 提交订单
     *
     * @param order 订单
     * @return 返回modelAndView
     */
    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    public ModelAndView submitOrder(Order order, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        LOGGER.debug(order.toString());
        //判断order是否信息完整
        if (OrderUtil.isNotValidOrder(order)) {
            request.getSession().setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "收件人信息不全或未购买商品");
        } else {
            //1. 获取session中的用户信息
            User user = (User) request.getSession().getAttribute(SysParamEnum.SESSION_USER_NAME.toString());
            //2. 查询用户的所有cart信息
            List<Map<String, Object>> cartList = cartService.findBaseInfoByUserId(user.getUserId());
            //3. 保存初始化后的订单
            orderService.saveOrder(OrderUtil.initOrder(order, user), user, cartList);
            //4. 清空session中购物车的商品数量
            @SuppressWarnings("unchecked")
            Map<String, Object> shopInfo = (Map<String, Object>) request.getSession().getAttribute(SysParamEnum.SESSION_SHOP_INFO_NAME.toString());
            shopInfo.put("cartCnt", 0);
        }
        modelAndView.setViewName("redirect:/cart/info.html");
        return modelAndView;
    }

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    @Autowired
    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }
}
