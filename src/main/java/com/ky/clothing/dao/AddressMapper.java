package com.ky.clothing.dao;

import com.ky.clothing.entity.Address;
import org.springframework.stereotype.Repository;

/**
 * @author Daye
 * 地址表Dao层持久类
 */
@Repository
public interface AddressMapper {
    /**
     * 根据id删除记录
     * @param addressId 地址id
     * @return 影响的行数
     */
    int deleteByPrimaryKey(Integer addressId);

    /**
     * 插入地址记录（无null检测）
     * @param record 待插入存放对象插件
     * @return 返回插入记录的
     */
    int insert(Address record);

    /**
     * 插入数据记录（有null检测）
     * @param record 待插入的数据存放对象
     * @return 插入的记录id
     */
    int insertSelective(Address record);

    /**
     * 根据id查询记录
     * @param addressId 待查询的地址id
     * @return 返回查询数据存放对象
     */
    Address selectByPrimaryKey(Integer addressId);

    /**
     * 根据id更新记录（有null检测）
     * @param record 待更新的数据存放对象
     * @return 影响的行数
     */
    int updateByPrimaryKeySelective(Address record);

    /**
     * 根据id更新记录（无null检测）
     * @param record 待更新的数据存放对象
     * @return 影响的行数
     */
    int updateByPrimaryKey(Address record);
}