package com.ky.clothing.service;

import com.ky.clothing.entity.Goods;

import java.util.List;

/**
 * @author Daye
 * 商品表Service层接口类
 */
public interface GoodsService {

    /**
     * 分页查询商品记录
     * @param pageNow 当前页(>0)
     * @param pageSize 页大小
     * @return 返回goodsList
     */
    List<Goods> selectGoodsLimit(Integer pageNow, Integer pageSize);

    /**
     * 根据id查询商品记录
     * @param goodsId 商品id
     * @return 查询结果存放对象
     */
    Goods selectByPrimaryKey(Integer goodsId);

    /**
     * 查询评价排名前三的商品信息
     * @return 返回商品list
     */
    List<Goods> selectGoodsTopThree();
}
