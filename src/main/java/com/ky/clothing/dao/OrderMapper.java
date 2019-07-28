package com.ky.clothing.dao;

import com.ky.clothing.entity.Order;
import org.springframework.stereotype.Repository;

/**
 * @author Daye
 * 订单Dao层持久类
 */
@Repository
public interface OrderMapper {

    /**
     * 根据订单id删除订单记录
     * @param orderId 订单id
     * @return 删除的条数
     */
    int deleteByPrimaryKey(Integer orderId);

    /**
     * 插入记录（未null验证）
     * @param record 待插入的对象
     * @return 返回插入的记录id
     */
    int insert(Order record);

    /**
     * 插入记录（有null验证）
     * @param record 待插入的对象
     * @return 返回插入的记录id
     */
    int insertSelective(Order record);

    /**
     * 根据id查询订单记录
     * @param orderId 订单id
     * @return 查询记录的对象
     */
    Order selectByPrimaryKey(Integer orderId);

    /**
     * 根据orderId更新记录（有null验证）
     * @param record 待更新的数据
     * @return 影响的行数
     */
    int updateByPrimaryKeySelective(Order record);

    /**
     * 根据orderId更新记录（无null验证）
     * @param record 待更新的数据
     * @return 影响的行数
     */
    int updateByPrimaryKey(Order record);
}