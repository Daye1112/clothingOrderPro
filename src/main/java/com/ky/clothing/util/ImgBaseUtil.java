package com.ky.clothing.util;

import sun.misc.BASE64Decoder;

import java.io.FileOutputStream;
import java.io.OutputStream;

/**
 * @author Daye
 * 图片转换工具类
 */
public class ImgBaseUtil {

    /**
     * 将base64编码字符串转换为图片
     *
     * @param imgStr base64编码字符串
     * @param imgFilePath   图片路径-具体到文件
     * @return boolean
     */
    public static boolean GenerateImage(String imgStr, String imgFilePath) {
        //图像数据为空
        BASE64Decoder decoder = new BASE64Decoder();
        try {
            //Base64解码
            byte[] b = decoder.decodeBuffer(imgStr);
            for (int i = 0; i < b.length; ++i) {
                //调整异常数据
                if (b[i] < 0) {
                    b[i] += 256;
                }
            }
            OutputStream out = new FileOutputStream(imgFilePath);
            out.write(b);
            out.flush();
            out.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
