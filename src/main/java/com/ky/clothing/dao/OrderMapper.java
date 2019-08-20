package com.ky.clothing.dao;

import com.ky.clothing.entity.Order;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * 订单Dao层持久类
 */
@Repository
public interface OrderMapper {

    /**
     * 查询记录总数
     * @return 返回int
     */
    Integer selectCountOrderId();

    /**
     * 分页查询订单信息
     * @param startIndex 查询索引起始位置
     * @param pageSize 页大小
     * @return 返回OrderList
     */
    List<Order> selectLimit(@Param("startIndex") Integer startIndex, @Param("pageSize") Integer pageSize);

    /**
     * 根据订单号更新订单的支付信息
     * @param orderNo 订单号
     */
    void updateIsPayAndOrderStatusByOrderNo(@Param("orderNo") String orderNo);

    /**
     * 根据orderId删除order记录
     * @param orderId 订单id
     */
    void deleteByOrderId(@Param("orderId") Integer orderId);

    /**
     * 根据userId查询用户的所有订单详情
     * @param userId 用户id
     * @return 返回mapList
     */
    List<Map<String, Object>> selectBaseInfoByUserId(@Param("userId") Integer userId);

    /**
     * 根据订单id删除订单记录
     *
     * @param orderId 订单id
     * @return 删除的条数
     */
    int deleteByPrimaryKey(Integer orderId);

    /**
     * 插入记录（未null验证）
     *
     * @param record 待插入的对象
     * @return 返回插入的记录id
     */
    int insert(Order record);

    /**
     * 插入记录（有null验证）
     *
     * @param record 待插入的对象
     * @return 返回插入的记录id
     */
    int insertSelective(Order record);

    /**
     * 根据id查询订单记录
     *
     * @param orderId 订单id
     * @return 查询记录的对象
     */
    Order selectByPrimaryKey(Integer orderId);

    /**
     * 根据orderId更新记录（有null验证）
     *
     * @param record 待更新的数据
     * @return 影响的行数
     */
    int updateByPrimaryKeySelective(Order record);

    /**
     * 根据orderId更新记录（无null验证）
     *
     * @param record 待更新的数据
     * @return 影响的行数
     */
    int updateByPrimaryKey(Order record);
}