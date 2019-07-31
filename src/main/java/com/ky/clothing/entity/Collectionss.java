package com.ky.clothing.entity;

import java.io.Serializable;

public class Collectionss implements Serializable{

	/**
	* ID
	*/
	private Integer cltId;
	

	/**
	* 用户ID-外键
	*/
    private Integer userId;

    /**
	* 商品ID-外键
	*/
    private Integer goodsId;


    /**
     * 商品size
     */
    private String cltGoodsSize;

    /**
	* 0-无效 1-有效
	*/
    private Boolean cltValid;
    
	private static final long serialVersionUID = 1L;
	

    public Integer getCltId() {
		return cltId;
	}

	public void setCltId(Integer cltId) {
		this.cltId = cltId;
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

	public String getCltGoodsSize() {
		return cltGoodsSize;
	}

	public void setCltGoodsSize(String cltGoodsSize) {
		this.cltGoodsSize = cltGoodsSize;
	}

	public Boolean getCltValid() {
		return cltValid;
	}

	public void setCltValid(Boolean cltValid) {
		this.cltValid = cltValid;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Collection [cltId=" + cltId + ", userId=" + userId + ", goodsId=" + goodsId + ", cltGoodsSize="
				+ cltGoodsSize + ", cltValid=" + cltValid + "]";
	}

}
