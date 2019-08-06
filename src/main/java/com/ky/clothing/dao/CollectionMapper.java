package com.ky.clothing.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ky.clothing.entity.Cart;
import com.ky.clothing.entity.Collectionss;

@Repository
public interface CollectionMapper {
    /**
     * 根据用户id清空收藏单中的所有商品
     * @param userId 用户id
     */
    void deleteByUserId(@Param("userId") Integer userId);

    /**
     * 根据cltId删除收藏单信息
     * @param cltId 收藏单id
     */
    void deleteByCltId(@Param("cltId") Integer cltId);

    /**
     * 根据用户id查询用户的收藏单信息
     * @param userId 用户id
     * @return 返回map
     */
    List<Map<String, Object>> findBaseInfoByUserId(Integer userId);


    /**
     * 将商品加入到用户收藏单中
     * @param clt 收藏单对象
     * @return int
     */
    int insert(Collectionss clt);
    /**
     * 根据userId查询用户的收藏数量
     * @param userId 用户id
     * @return 返回数量
     */
    int findCountUserId(@Param("userId") Integer userId);
    /**
     * 根据商品id、用户id、商品size查询记录
     * @param clt 待查询的cart对象
     * @return 返回Collectionss对象
     */
    Collectionss findrecords(Collectionss clt);
    
}
