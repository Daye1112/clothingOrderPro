package com.ky.clothing.util;


import com.ky.clothing.entity.JsonResult;
import com.ky.clothing.enums.ErrorEnum;

/**
 * @author Daye
 * 封装jsonResult对象的工具类
 */
public class JsonResultUtil {

    /**
     * 操作成功，将object存入待返回的对象中
     * @param object 需要返回前端的data
     * @return 返回封装信息类
     */
    public static JsonResult setSuccessOf(Object object) {
        //将操作成功信息封装到结果对象中返回
        JsonResult resultWrapper = new JsonResult();
        resultWrapper.setCode(1);
        resultWrapper.setSuccess(true);
        resultWrapper.setMessage("操作成功！");
        resultWrapper.setData(object);
        return resultWrapper;
    }

    /**
     * 操作失败，将错误提示存入json对象中
     * @param errorEnum 错误信息
     * @return 返回封装信息类
     */
    public static JsonResult setErrorOf(ErrorEnum errorEnum) {
        //将操作失败信息封装到结果对象中返回
        JsonResult resultWrapper = new JsonResult();
        resultWrapper.setCode(0);
        resultWrapper.setSuccess(false);
        resultWrapper.setMessage(errorEnum.toString());
        resultWrapper.setData(null);
        return resultWrapper;
    }

    /**
     * 操作失败，并失败提示加入错误信息中
     * @param errorEnum 错误信息
     * @param errorMessage 额外的错误提示
     * @return 返回封装信息类
     */
    public static JsonResult setErrorOf(ErrorEnum errorEnum, String errorMessage) {
        //将操作失败信息和额外提示信息封装到结果对象中返回
        JsonResult resultWrapper = new JsonResult();
        resultWrapper.setCode(0);
        resultWrapper.setSuccess(false);
        resultWrapper.setMessage(errorEnum.toString() + " " + errorMessage);
        resultWrapper.setData(null);
        return resultWrapper;
    }
}
