package com.ky.clothing.dao;

import com.ky.clothing.entity.OrderDetail;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * 订单细节Dao层持久类
 */
@Repository
public interface OrderDetailMapper {

    /**
     * 根据订单id假删除所有对应的订单细节记录
     * @param orderId 订单id
     */
    void deleteByOrderId(@Param("orderId") Integer orderId);

    /**
     * 根据orderId查询订单详情表
     * @param orderId 订单id
     * @return 返回listMap
     */
    List<Map<String, Object>> selectOrderDetailByOrderId(@Param("orderId") Integer orderId);

    /**
     * 插入订单细节对象list
     * @param orderDetailList 订单细节对象list
     */
    void insertList(@Param("orderDetailList") List<OrderDetail> orderDetailList);

    /**
     * 根据id删除记录，并返回影响的行数
     * @param orderDetailId 待删除的订单细节id
     * @return 返回影响行数
     */
    int deleteByPrimaryKey(Integer orderDetailId);

    /**
     * 插入订单细节记录（无null验证）
     * @param record 待插入的记录对象
     * @return 返回刚插入的记录id
     */
    int insert(OrderDetail record);

    /**
     * 插入订单细节记录（有null验证）
     * @param record 待插入的记录对象
     * @return 返回刚插入的记录id
     */
    int insertSelective(OrderDetail record);

    /**
     * 根据id查询记录
     * @param orderDetailId 订单细节类id
     * @return 查询结果对象
     */
    OrderDetail selectByPrimaryKey(Integer orderDetailId);

    /**
     * 根据id更新记录（有null验证）
     * @param record 待更新的对象
     * @return 返回影响行数
     */
    int updateByPrimaryKeySelective(OrderDetail record);

    /**
     * 根据id更新记录（无null验证）
     * @param record 待更新的对象
     * @return 返回影响行数
     */
    int updateByPrimaryKey(OrderDetail record);
}