package com.ky.clothing.entity;

import java.io.Serializable;

/**
 * @author Daye
 * 商品表实体类
 */
public class Goods implements Serializable {
    /**
	* ID
	*/
    private Integer goodsId;

    /**
	* 商品编号
	*/
    private String goodsNo;

    /**
	* 商品名称
	*/
    private String goodsName;

    /**
	* 商品图片url
	*/
    private String goodsImageUrl;

    /**
	* 商品价格
	*/
    private Double goodsPrice;

    /**
	* 商品数量
	*/
    private Integer goodsNum;

    /**
	* 商品库存
	*/
    private Integer goodsStock;

    /**
	* 商品描述
	*/
    private String goodsDesc;

    /**
	* 商品评价
	*/
    private Integer goodsScore;

    /**
	* 访问数
	*/
    private Integer visitNum;

    /**
	* 0-无效 1-有效
	*/
    private Boolean goodsValid;

    private static final long serialVersionUID = 1L;

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsNo() {
        return goodsNo;
    }

    public void setGoodsNo(String goodsNo) {
        this.goodsNo = goodsNo;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsImageUrl() {
        return goodsImageUrl;
    }

    public void setGoodsImageUrl(String goodsImageUrl) {
        this.goodsImageUrl = goodsImageUrl;
    }

    public Double getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(Double goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public Integer getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(Integer goodsNum) {
        this.goodsNum = goodsNum;
    }

    public Integer getGoodsStock() {
        return goodsStock;
    }

    public void setGoodsStock(Integer goodsStock) {
        this.goodsStock = goodsStock;
    }

    public String getGoodsDesc() {
        return goodsDesc;
    }

    public void setGoodsDesc(String goodsDesc) {
        this.goodsDesc = goodsDesc;
    }

    public Integer getGoodsScore() {
        return goodsScore;
    }

    public void setGoodsScore(Integer goodsScore) {
        this.goodsScore = goodsScore;
    }

    public Integer getVisitNum() {
        return visitNum;
    }

    public void setVisitNum(Integer visitNum) {
        this.visitNum = visitNum;
    }

    public Boolean getGoodsValid() {
        return goodsValid;
    }

    public void setGoodsValid(Boolean goodsValid) {
        this.goodsValid = goodsValid;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "goodsId=" + goodsId +
                ", goodsNo='" + goodsNo + '\'' +
                ", goodsName='" + goodsName + '\'' +
                ", goodsImageUrl='" + goodsImageUrl + '\'' +
                ", goodsPrice=" + goodsPrice +
                ", goodsNum=" + goodsNum +
                ", goodsStock=" + goodsStock +
                ", goodsDesc='" + goodsDesc + '\'' +
                ", goodsScore=" + goodsScore +
                ", visitNum=" + visitNum +
                ", goodsValid=" + goodsValid +
                '}';
    }
}