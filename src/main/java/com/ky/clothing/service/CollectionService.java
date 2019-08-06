package com.ky.clothing.service;

import java.util.List;
import java.util.Map;

import com.ky.clothing.entity.Collectionss;

/**
 * @author cyan-bw
 */
public interface CollectionService {

    /**
     * 根据用户id清空收藏单
     * @param userId 用户id
     */
    void deleteByUserId(Integer userId);

    /**
     * 根据cltId删除收藏单信息
     * @param cltId 收藏单id
     */
    void deleteByCltId(Integer cltId);

    /**
     * 根据用户id查询用户的收藏单信息
     * @param userId 用户id
     * @return 返回map
     */
    List<Map<String, Object>> findBaseInfoByUserId(Integer userId);


    /**
     * 根据商品信息判断收藏单中是否有重复商品
     * @param clt 
     * @return 返回Collections对象
     */
    Collectionss checkCltIsNew(Collectionss clt);
    /**
     * 将商品加入到用户收藏单中
     * @param clt 收藏单对象
     */
    void addCollectionss(Collectionss clt);
}
