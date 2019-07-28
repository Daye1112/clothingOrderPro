package com.ky.clothing.entity;

import java.io.Serializable;

/**
 * @author Daye
 * 购物车表实体类
 */
public class Cart implements Serializable {
    /**
	* ID
	*/
    private Integer cartId;

    /**
	* 用户ID-外键
	*/
    private Integer userId;

    /**
	* 商品ID-外键
	*/
    private Integer goodsId;

    /**
	* 0-未购买 1-已购买
	*/
    private Short isBuy;

    /**
	* 购物车商品数量
	*/
    private Integer cartGoodsNum;

    /**
     * 商品size
     */
    private String cartGoodsSize;

    /**
	* 0-无效 1-有效
	*/
    private Boolean cartValid;

    private static final long serialVersionUID = 1L;

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Short getIsBuy() {
        return isBuy;
    }

    public void setIsBuy(Short isBuy) {
        this.isBuy = isBuy;
    }

    public Integer getCartGoodsNum() {
        return cartGoodsNum;
    }

    public void setCartGoodsNum(Integer cartGoodsNum) {
        this.cartGoodsNum = cartGoodsNum;
    }

    public String getCartGoodsSize() {
        return cartGoodsSize;
    }

    public void setCartGoodsSize(String cartGoodsSize) {
        this.cartGoodsSize = cartGoodsSize;
    }

    public Boolean getCartValid() {
        return cartValid;
    }

    public void setCartValid(Boolean cartValid) {
        this.cartValid = cartValid;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "cartId=" + cartId +
                ", userId=" + userId +
                ", goodsId=" + goodsId +
                ", isBuy=" + isBuy +
                ", cartGoodsNum='" + cartGoodsNum + '\'' +
                ", cartGoodsSize='" + cartGoodsSize + '\'' +
                ", cartValid=" + cartValid +
                '}';
    }
}