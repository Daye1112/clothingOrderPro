package com.ky.clothing.entity;

import java.io.Serializable;

/**
 * @author Daye
 * 联系管理员表实体类
 */
public class ContactManager implements Serializable {
    /**
     * ID
     */
    private Integer contactManagerId;

    /**
     * 用户ID-外键
     */
    private Integer userId;

    /**
     * 商品ID-外键
     */
    private Integer goodsId;

    /**
     * 用户消息
     */
    private String userMsg;

    /**
     * 管理员回复
     */
    private String managerMsg;

    /**
     * 0-未回复 1-已回复
     */
    private Boolean isReply;

    /**
     * 回复者
     */
    private String managerName;

    /**
     * 0-无效 1-有效
     */
    private Boolean contactManagerValid;

    private static final long serialVersionUID = 1L;

    public Integer getContactManagerId() {
        return contactManagerId;
    }

    public void setContactManagerId(Integer contactManagerId) {
        this.contactManagerId = contactManagerId;
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

    public String getUserMsg() {
        return userMsg;
    }

    public void setUserMsg(String userMsg) {
        this.userMsg = userMsg;
    }

    public String getManagerMsg() {
        return managerMsg;
    }

    public void setManagerMsg(String managerMsg) {
        this.managerMsg = managerMsg;
    }

    public Boolean getIsReply() {
        return isReply;
    }

    public void setIsReply(Boolean reply) {
        isReply = reply;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public Boolean getContactManagerValid() {
        return contactManagerValid;
    }

    public void setContactManagerValid(Boolean contactManagerValid) {
        this.contactManagerValid = contactManagerValid;
    }

    @Override
    public String toString() {
        return "ContactManager{" +
                "contactManagerId=" + contactManagerId +
                ", userId=" + userId +
                ", goodsId=" + goodsId +
                ", userMsg='" + userMsg + '\'' +
                ", managerMsg='" + managerMsg + '\'' +
                ", isReply=" + isReply +
                ", managerName='" + managerName + '\'' +
                ", contactManagerValid=" + contactManagerValid +
                '}';
    }
}