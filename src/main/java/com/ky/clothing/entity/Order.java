package com.ky.clothing.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Daye
 * 订单表实体类
 */
public class Order implements Serializable {
    /**
     * ID
     */
    private Integer orderId;

    /**
     * 用户ID-外键
     */
    private Integer userId;

    /**
     * 订单号
     */
    private String orderNo;

    /**
     * 商品总额
     */
    private Double goodsMoney;

    /**
     * 订单总金额
     */
    private Double totalMoney;

    /**
     * 0-未支付 1-待发货 2-用户取消 3-配送中 4-用户确认收货
     */
    private Short orderStatus;

    /**
     * 运费
     */
    private Double deliverMoney;

    /**
     * 0-未支付 1-已支付
     */
    private Short ispay;

    /**
     * 0-不需要发票 1-需要发票
     */
    private Short isinvoice;

    /**
     * 0-订单未完结 1-订单已完结
     */
    private Short isclosed;

    /**
     * 收货地址
     */
    private String orderAddress;

    /**
     * 用户真实姓名
     */
    private String userRealName;

    /**
     * 收件人手机号码
     */
    private String userPhone;

    /**
     * 发票抬头
     */
    private String invoiceClient;

    /**
     * 发票税号
     */
    private String taxNum;

    /**
     * 订单备注
     */
    private String orderRemark;

    /**
     * 收货时间
     */
    private Date receiveTime;

    /**
     * 发货时间
     */
    private Date deliveryTime;

    /**
     * 下单时间
     */
    private Date createTime;

    /**
     * 快递号
     */
    private String expressNo;

    /**
     * 快递公司
     */
    private String expressName;

    /**
     * 0-无效 1-有效
     */
    private Boolean orderValid;

    private static final long serialVersionUID = 1L;

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public Double getGoodsMoney() {
        return goodsMoney;
    }

    public void setGoodsMoney(Double goodsMoney) {
        this.goodsMoney = goodsMoney;
    }

    public Double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(Double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public Short getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Short orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Double getDeliverMoney() {
        return deliverMoney;
    }

    public void setDeliverMoney(Double deliverMoney) {
        this.deliverMoney = deliverMoney;
    }

    public Short getIspay() {
        return ispay;
    }

    public void setIspay(Short ispay) {
        this.ispay = ispay;
    }

    public Short getIsinvoice() {
        return isinvoice;
    }

    public void setIsinvoice(Short isinvoice) {
        this.isinvoice = isinvoice;
    }

    public Short getIsclosed() {
        return isclosed;
    }

    public void setIsclosed(Short isclosed) {
        this.isclosed = isclosed;
    }

    public String getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress;
    }

    public String getUserRealName() {
        return userRealName;
    }

    public void setUserRealName(String userRealName) {
        this.userRealName = userRealName;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getInvoiceClient() {
        return invoiceClient;
    }

    public void setInvoiceClient(String invoiceClient) {
        this.invoiceClient = invoiceClient;
    }

    public String getTaxNum() {
        return taxNum;
    }

    public void setTaxNum(String taxNum) {
        this.taxNum = taxNum;
    }

    public String getOrderRemark() {
        return orderRemark;
    }

    public void setOrderRemark(String orderRemark) {
        this.orderRemark = orderRemark;
    }

    public Date getReceiveTime() {
        return receiveTime;
    }

    public void setReceiveTime(Date receiveTime) {
        this.receiveTime = receiveTime;
    }

    public Date getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(Date deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getExpressNo() {
        return expressNo;
    }

    public void setExpressNo(String expressNo) {
        this.expressNo = expressNo;
    }

    public String getExpressName() {
        return expressName;
    }

    public void setExpressName(String expressName) {
        this.expressName = expressName;
    }

    public Boolean getOrderValid() {
        return orderValid;
    }

    public void setOrderValid(Boolean orderValid) {
        this.orderValid = orderValid;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", userId=" + userId +
                ", orderNo='" + orderNo + '\'' +
                ", goodsMoney=" + goodsMoney +
                ", totalMoney=" + totalMoney +
                ", orderStatus=" + orderStatus +
                ", deliverMoney=" + deliverMoney +
                ", ispay=" + ispay +
                ", isinvoice=" + isinvoice +
                ", isclosed=" + isclosed +
                ", orderAddress='" + orderAddress + '\'' +
                ", userRealName='" + userRealName + '\'' +
                ", userPhone='" + userPhone + '\'' +
                ", invoiceClient='" + invoiceClient + '\'' +
                ", taxNum='" + taxNum + '\'' +
                ", orderRemark='" + orderRemark + '\'' +
                ", receiveTime=" + receiveTime +
                ", deliveryTime=" + deliveryTime +
                ", createTime=" + createTime +
                ", expressNo='" + expressNo + '\'' +
                ", expressName='" + expressName + '\'' +
                ", orderValid=" + orderValid +
                '}';
    }
}