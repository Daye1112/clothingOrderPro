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
	* 运费
	*/
    private Double deliverMoney;

    /**
	* 订单总金额
	*/
    private Double totalMoney;

    /**
	* 0-未支付 1-待发货 2-用户取消 3-配送中 4-用户确认收货
	*/
    private Short orderStatus;

    /**
	* 0-未支付 1-已支付
	*/
    private Short isPay;

    /**
	* 0-不需要发票 1-需要发票
	*/
    private Short isInvoice;

    /**
	* 0-订单未完结 1-订单已完结
	*/
    private Short isClosed;

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

    public Double getDeliverMoney() {
        return deliverMoney;
    }

    public void setDeliverMoney(Double deliverMoney) {
        this.deliverMoney = deliverMoney;
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

    public Short getIsPay() {
        return isPay;
    }

    public void setIsPay(Short isPay) {
        this.isPay = isPay;
    }

    public Short getIsInvoice() {
        return isInvoice;
    }

    public void setIsInvoice(Short isInvoice) {
        this.isInvoice = isInvoice;
    }

    public Short getIsClosed() {
        return isClosed;
    }

    public void setIsClosed(Short isClosed) {
        this.isClosed = isClosed;
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
                ", deliverMoney=" + deliverMoney +
                ", totalMoney=" + totalMoney +
                ", orderStatus=" + orderStatus +
                ", isPay=" + isPay +
                ", isInvoice=" + isInvoice +
                ", isClosed=" + isClosed +
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