package com.ky.clothing.util;

import java.util.Random;

/**
 * @author Daye
 * 随机工具类
 */
public class RandomUtil {

    /**
     * 随机生成len长度的随机数字符串
     * @param len 随机数字字符串的长度
     * @return 返回随机6位数字组成的字符串
     */
    public static String randomNumber(int len){
        StringBuilder stringBuffer = new StringBuilder();
        for(int i = 0; i < len; i++){
            int random = new Random().nextInt(10);
            stringBuffer.append(random);
        }
        return stringBuffer.toString();
    }
}
