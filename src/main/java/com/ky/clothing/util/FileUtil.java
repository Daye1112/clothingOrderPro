package com.ky.clothing.util;

import java.io.File;
import java.util.Calendar;

/**
 * @author Daye
 * 文件工具类
 */
public class FileUtil {
    /**
     * 图片格式
     */
    private static final String[] FILETYPES = new String[]{
            ".jpg", ".bmp", ".jpeg", ".png", ".gif",
            ".JPG", ".BMP", ".JPEG", ".PNG", ".GIF"};

    /**
     * 校验图片后缀名
     *
     * @param imgName 图片名
     * @return 返回boolean
     */
    public static boolean checkImageSuffix(String imgName) {
        boolean flag = false;
        for (String fileType : FILETYPES) {
            if (imgName.endsWith(fileType)) {
                flag = true;
                break;
            }
        }
        return flag;
    }

    /**
     * 获取文件上传路径的绝对路径
     *
     * @return 返回绝对路径
     */
    public static String getDateFilePath(String rootPath) {
        // 创建年月文件夹
        Calendar date = Calendar.getInstance();
        return rootPath + File.separator + date.get(Calendar.YEAR) + File.separator + (date.get(Calendar.MONTH) + 1);
    }

    /**
     * 创建文件夹
     *
     * @param filePath 待创建文件夹的绝对路径
     * @return 返回是否创建成功
     */
    public static boolean createFile(String filePath) {
        // 创建文件夹
        File newFile = new File(filePath);
        // 判断目标文件所在目录是否存在
        if (!newFile.exists()) {
            // 如果目标文件所在的目录不存在，则创建父目录
            boolean mkdirsSucceed = newFile.mkdirs();
            if (!mkdirsSucceed) {
                return false;
            }
        }
        return true;
    }
}
