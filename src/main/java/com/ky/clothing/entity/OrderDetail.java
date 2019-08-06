package com.ky.clothing.entity;

import java.io.Serializable;

/**
 * @author Daye
 * 订单细节表实体类
 */
public class OrderDetail implements Serializable {
    /**
	* ID
	*/
    private Integer orderDetailId;

    /**
	* 商品ID
	*/
    private Integer goodsId;

    /**
	* 订单ID
	*/
    private Integer orderId;

    /**
	* 商品数量
	*/
    private Integer orderGoodsNum;

    /**
     * 商品尺寸
     */
    private String orderGoodsSize;

    /**
	* 0-无效 1-有效
	*/
    private Boolean orderDetailValid;

    private static final long serialVersionUID = 1L;

    public Integer getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(Integer orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getOrderGoodsNum() {
        return orderGoodsNum;
    }

    public void setOrderGoodsNum(Integer orderGoodsNum) {
        this.orderGoodsNum = orderGoodsNum;
    }

    public String getOrderGoodsSize() {
        return orderGoodsSize;
    }

    public void setOrderGoodsSize(String orderGoodsSize) {
        this.orderGoodsSize = orderGoodsSize;
    }

    public Boolean getOrderDetailValid() {
        return orderDetailValid;
    }

    public void setOrderDetailValid(Boolean orderDetailValid) {
        this.orderDetailValid = orderDetailValid;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "orderDetailId=" + orderDetailId +
                ", goodsId=" + goodsId +
                ", orderId=" + orderId +
                ", orderGoodsNum=" + orderGoodsNum +
                ", orderGoodsSize='" + orderGoodsSize + '\'' +
                ", orderDetailValid=" + orderDetailValid +
                '}';
    }
}