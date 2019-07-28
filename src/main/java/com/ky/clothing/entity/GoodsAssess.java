package com.ky.clothing.entity;

import java.io.Serializable;

/**
 * @author Daye
 * 商品评价表实体类
 */
public class GoodsAssess implements Serializable {
    /**
	* ID
	*/
    private Integer goodsAssessId;

    /**
	* 用户ID-外键
	*/
    private Integer userId;

    /**
	* 商品ID-外键
	*/
    private Integer goodsId;

    /**
	* 总评价分
	*/
    private Integer goodsAssessScore;

    /**
	* 评价内容
	*/
    private String goodsAssessContent;

    /**
	* 0-无权限 1-有权限 用户购买商品后才能有权限进行评价
	*/
    private Boolean canAssess;

    /**
	* 0-无效 1-有效
	*/
    private Boolean goodsAssessValid;

    private static final long serialVersionUID = 1L;

    public Integer getGoodsAssessId() {
        return goodsAssessId;
    }

    public void setGoodsAssessId(Integer goodsAssessId) {
        this.goodsAssessId = goodsAssessId;
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

    public Integer getGoodsAssessScore() {
        return goodsAssessScore;
    }

    public void setGoodsAssessScore(Integer goodsAssessScore) {
        this.goodsAssessScore = goodsAssessScore;
    }

    public String getGoodsAssessContent() {
        return goodsAssessContent;
    }

    public void setGoodsAssessContent(String goodsAssessContent) {
        this.goodsAssessContent = goodsAssessContent;
    }

    public Boolean getCanAssess() {
        return canAssess;
    }

    public void setCanAssess(Boolean canAssess) {
        this.canAssess = canAssess;
    }

    public Boolean getGoodsAssessValid() {
        return goodsAssessValid;
    }

    public void setGoodsAssessValid(Boolean goodsAssessValid) {
        this.goodsAssessValid = goodsAssessValid;
    }

    @Override
    public String toString() {
        return "GoodsAssess{" +
                "goodsAssessId=" + goodsAssessId +
                ", userId=" + userId +
                ", goodsId=" + goodsId +
                ", goodsAssessScore=" + goodsAssessScore +
                ", goodsAssessContent='" + goodsAssessContent + '\'' +
                ", canAssess=" + canAssess +
                ", goodsAssessValid=" + goodsAssessValid +
                '}';
    }
}