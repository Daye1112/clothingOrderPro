package com.ky.clothing.service;

import com.ky.clothing.entity.Cart;

import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * 购物车service层接口类
 */
public interface CartService {

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
     * 根据商品id、用户id、商品size判断购物车中是否有重复商品
     * @param cart 待查询的cart对象
     * @return 返回cart对象
     */
    Cart checkCartIsNew(Cart cart);

    /**
     * 将商品加入到用户购物车中
     * @param cart 购物车对象
     */
    void addCart(Cart cart);
}
