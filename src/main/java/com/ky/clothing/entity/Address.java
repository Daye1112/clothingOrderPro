package com.ky.clothing.entity;

import java.io.Serializable;

/**
 * @author Daye
 * 地址表实体类
 */
public class Address implements Serializable {
    /**
	* ID
	*/
    private Integer addressId;

    /**
	* 用户ID-外键
	*/
    private Integer userId;

    /**
	* 收货人姓名
	*/
    private String userName;

    /**
	* 收货人手机号码
	*/
    private String userPhone;

    /**
	* 详细地址
	*/
    private String detailAddress;

    /**
	* 默认地址
	*/
    private Boolean isDefault;

    /**
	* 0-无效 1-有效
	*/
    private Boolean addressValid;

    private static final long serialVersionUID = 1L;

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public Boolean getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(Boolean isDefault) {
        this.isDefault = isDefault;
    }

    public Boolean getAddressValid() {
        return addressValid;
    }

    public void setAddressValid(Boolean addressValid) {
        this.addressValid = addressValid;
    }

    @Override
    public String toString() {
        return "Address{" +
                "addressId=" + addressId +
                ", userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userPhone='" + userPhone + '\'' +
                ", detailAddress='" + detailAddress + '\'' +
                ", isDefault=" + isDefault +
                ", addressValid=" + addressValid +
                '}';
    }
}