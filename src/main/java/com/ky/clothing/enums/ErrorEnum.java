package com.ky.clothing.enums;

/**
 * @author Daye
 * 错误操作状态码
 */
public enum ErrorEnum {

    /** 数据格式化错误 */
    PARAMETER_ERROR("参数类型错误！"),
    /** 登录账号/密码错误 */
    LOGIN_ERROR("账号/密码错误"),
    /** 登录失败 */
    LOGIN_FAILURE("登录失败"),
    /** 未登录警告 */
    LOGIN_WARNING("未登录"),
    /** 查询失败 */
    SELECT_ERROR("查询失败"),
    /** 添加失败 */
    SAVE_ERROR("添加失败"),
    /** 更新失败 */
    UPDATE_ERROR("更新失败"),
    /** 异常错误 */
    SYSTEM_ERROR("操作异常"),
    /** 空值判断 */
    EMPTY_ERROR("存在空值"),
    /** 权限不足 */
    INSUFFICIENT_PERMISSION("权限不足");

    private String errorMessage;

    ErrorEnum(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    @Override
    public String toString() {
        return errorMessage;
    }
}
