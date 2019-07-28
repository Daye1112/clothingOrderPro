package com.ky.clothing.service.impl;

import com.ky.clothing.dao.SysLogMapper;
import com.ky.clothing.entity.SysLog;
import com.ky.clothing.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Daye
 * 操作日志Service层实现类
 */
@Service
public class SysLogServiceImpl implements SysLogService {

    private SysLogMapper sysLogMapper;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int insertSelective(SysLog sysLog) {
        //插入日志对象
        return sysLogMapper.insertSelective(sysLog);
    }

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public SysLog selectByPrimaryKey(Integer logId) {
        return sysLogMapper.selectByPrimaryKey(logId);
    }

    @Autowired
    public void setSysLogMapper(SysLogMapper sysLogMapper) {
        this.sysLogMapper = sysLogMapper;
    }
}
