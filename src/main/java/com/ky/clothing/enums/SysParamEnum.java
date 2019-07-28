package com.ky.clothing.enums;

/**
 * @author Daye
 * 系统参数枚举
 */
public enum SysParamEnum {
    /** 存入Session中的日志name */
    SESSION_SYS_LOG_NAME("sysLog"),
    /** 错误信息统一key名 */
    ERROR_MSG_NAME("errorMsg"),
    /** 成功信息统一key名 */
    SUCCEED_MSG_NAME("succeedMsg"),
    /** 存放在session中的随机数的key名 */
    SESSION_RANDOM_NUMBER_NAME("randomNumber"),
    /** 存放在session中的email的key名 */
    SESSION_EMAIL_NAME("emailName"),
    /** 存入session中的用户key名 */
    SESSION_USER_NAME("user"),
    /** 存入session中的goodsList的名 */
    SESSION_GOODS_LIST_NAME("goodsList"),
    /** 存入session中的商品名 */
    SESSION_GOODS_NAME("goods"),
    /** 存入Session中的商品评论信息名 */
    SESSION_GOODS_ASSESSES_NAME("goodsAssessList"),
    /** 存入session中的评论list */
    SESSION_ASSESSES_NAME("assessList"),
    /** 存入session中的处理返回信息 */
    SESSION_REQUEST_MESSAGE_NAME("dealMsg"),
    /** 存入session中的用户购物车信息 */
    SESSION_CART_LIST_NAME("cartList"),
    /** 存入Session中的用户的购物信息 */
    SESSION_SHOP_INFO_NAME("shopInfo");

    private String paramName;

    SysParamEnum(String paramName) {
        this.paramName = paramName;
    }

    @Override
    public String toString() {
        return paramName;
    }
}
