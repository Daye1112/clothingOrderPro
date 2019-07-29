package com.ky.clothing.dao;

import com.ky.clothing.entity.Cart;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * 购物车Dao层持久类
 */
@Repository
public interface CartMapper {

    /**
     * 根据cartId修改cartGoodsNum的值
     * @param cart 待修改的cart对象
     */
    void updateCartGoodsNumByCartId(Cart cart);

    /**
     * 根据用户id清空用户购物车中的所有商品
     * @param userId 用户id
     */
    void deleteByUserId(@Param("userId") Integer userId);

    /**
     * 根据cartId删除购物车信息
     * @param cartId 购物车id
     */
    void deleteByCartId(@Param("cartId") Integer cartId);

    /**
     * 根据userId查询用户的购物车数量
     * @param userId 用户id
     * @return 返回数量
     */
    int findCountUserId(@Param("userId") Integer userId);

    /**
     * 根据用户id查询用户的购物车信息
     * @param userId 用户id
     * @return 返回map
     */
    List<Map<String, Object>> findBaseInfoByUserId(Integer userId);

    /**
     * 将cart的商品num自增
     * @param cart 待更新的cart对象
     */
    void updateCartGoodsNumInc(Cart cart);

    /**
     * 根据商品id、用户id、商品size查询记录
     * @param cart 待查询的cart对象
     * @return 返回cart对象
     */
    Cart findByGoodsIdAndUserInAndCartGoodsSize(Cart cart);

    /**
     * 根据id删除记录
     * @param cartId 购物车id
     * @return 影响的行数
     */
    int deleteByPrimaryKey(Integer cartId);

    /**
     * 插入数据记录（无null验证）
     * @param record 待插入的数据存放对象
     * @return 插入的记录id
     */
    int insert(Cart record);

    /**
     * 插入数据记录（有null验证）
     * @param record 待插入的数据存放对象
     * @return 插入的记录id
     */
    int insertSelective(Cart record);

    /**
     * 根据id查询购物车记录
     * @param cartId 购物车id
     * @return 返回查询数据的存放对象
     */
    Cart selectByPrimaryKey(Integer cartId);

    /**
     * 根据id更新数据（有null验证）
     * @param record 待更新的数据存放对象
     * @return 返回影响的行数
     */
    int updateByPrimaryKeySelective(Cart record);

    /**
     * 根据id更新数据（无null验证）
     * @param record 待更新的数据存放对象
     * @return 返回影响的行数
     */
    int updateByPrimaryKey(Cart record);
}