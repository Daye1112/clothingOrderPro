package com.ky.clothing.service;

import com.ky.clothing.entity.SysLog;

/**
 * @author Daye
 * 操作日志Service层接口类
 */
public interface SysLogService {

    /**
     * 插入日志记录（有null值判断）
     * @param record 待保存的对象
     * @return 插入的记录id
     */
    int insertSelective(SysLog record);

    /**
     * 根据id查询记录
     * @param logId 查询id
     * @return 日志对象
     */
    SysLog selectByPrimaryKey(Integer logId);
}
