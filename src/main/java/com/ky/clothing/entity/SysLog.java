package com.ky.clothing.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Daye
 * 操作日志实体类
 */
public class SysLog implements Serializable {
    /**
	* ID
	*/
    private Integer logId;

    /**
	* 用户名
	*/
    private String sysUser;

    /**
	* 操作名
	*/
    private String sysOperator;

    /**
	* 操作模块
	*/
    private String sysModule;

    /**
	* IP
	*/
    private String sysIp;

    /**
	* 操作内容
	*/
    private String sysContent;

    private Date sysTime;

    /**
	* 0-无效 1-有效
	*/
    private Boolean sysValid;

    private static final long serialVersionUID = 1L;

    public Integer getLogId() {
        return logId;
    }

    public void setLogId(Integer logId) {
        this.logId = logId;
    }

    public String getSysUser() {
        return sysUser;
    }

    public void setSysUser(String sysUser) {
        this.sysUser = sysUser;
    }

    public String getSysOperator() {
        return sysOperator;
    }

    public void setSysOperator(String sysOperator) {
        this.sysOperator = sysOperator;
    }

    public String getSysModule() {
        return sysModule;
    }

    public void setSysModule(String sysModule) {
        this.sysModule = sysModule;
    }

    public String getSysIp() {
        return sysIp;
    }

    public void setSysIp(String sysIp) {
        this.sysIp = sysIp;
    }

    public String getSysContent() {
        return sysContent;
    }

    public void setSysContent(String sysContent) {
        this.sysContent = sysContent;
    }

    public Date getSysTime() {
        return sysTime;
    }

    public void setSysTime(Date sysTime) {
        this.sysTime = sysTime;
    }

    public Boolean getSysValid() {
        return sysValid;
    }

    public void setSysValid(Boolean sysValid) {
        this.sysValid = sysValid;
    }

    @Override
    public String toString() {
        return "Syslog{" +
                "logId=" + logId +
                ", sysUser='" + sysUser + '\'' +
                ", sysOperator='" + sysOperator + '\'' +
                ", sysModule='" + sysModule + '\'' +
                ", sysIp='" + sysIp + '\'' +
                ", sysContent='" + sysContent + '\'' +
                ", sysTime=" + sysTime +
                ", sysValid=" + sysValid +
                '}';
    }
}