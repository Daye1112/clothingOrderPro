package com.ky.clothing.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Daye
 * 日期时间工具类
 */
public class DateUtil {

    public static String getNowTimeContinuous(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
        return sdf.format(new Date());
    }
}
