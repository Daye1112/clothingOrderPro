package com.ky.clothing.entity;

import java.io.Serializable;

/**
 * @author Daye
 * 用户表实体类
 */
public class User implements Serializable {
    /**
	* ID
	*/
    private Integer userId;

    /**
	* 登录账号
	*/
    private String loginAccount;

    /**
	* 密码
	*/
    private String password;

    /**
	* 身份证
	*/
    private String idCard;

    /**
	* 联系电话
	*/
    private String phone;

    /**
	* 电子邮箱
	*/
    private String email;

    /**
	* 性别
	*/
    private String sex;

    /**
     * 用户头像url
     */
    private String avatarUrl;

    /**
	* 0-用户 1-管理员
	*/
    private Boolean manage;

    /**
	* 0-无效 1-有效
	*/
    private Boolean userValid;

    private static final long serialVersionUID = 1L;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getLoginAccount() {
        return loginAccount;
    }

    public void setLoginAccount(String loginAccount) {
        this.loginAccount = loginAccount;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public Boolean getManage() {
        return manage;
    }

    public void setManage(Boolean manage) {
        this.manage = manage;
    }

    public Boolean getUserValid() {
        return userValid;
    }

    public void setUserValid(Boolean userValid) {
        this.userValid = userValid;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", loginAccount='" + loginAccount + '\'' +
                ", password='" + password + '\'' +
                ", idCard='" + idCard + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", sex='" + sex + '\'' +
                ", avatarUrl='" + avatarUrl + '\'' +
                ", manage=" + manage +
                ", userValid=" + userValid +
                '}';
    }
}