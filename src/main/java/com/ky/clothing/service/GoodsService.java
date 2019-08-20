package com.ky.clothing.service;

import com.ky.clothing.entity.Goods;

import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * 商品表Service层接口类
 */
public interface GoodsService {

    /**
     * 根据id更新记录（有null验证）
     * @param goods 待更新记录
     * @return 返回影响行数
     */
    int updateByPrimaryKeySelective(Goods goods);

    /**
     * 插入记录（有null验证）
     * @param goods 待插入的数据存放对象
     * @return 返回插入的记录id
     */
    int insertSelective(Goods goods);

    /**
     * 根据id将商品的valid置为0
     * @param goodsId 商品id
     */
    void updateGoodsValidByGoodsId(Integer goodsId);

    /**
     * 分页查询所有用户的基本信息
     *
     * @param startIndex 查询的索引位
     * @param pageSize   查询记录数
     * @return 返回userList
     */
    Map<String, Object> selectAllBaseInfoLimit(Integer startIndex, Integer pageSize);

    /**
     * 根据cartId更新商品的库存
     *
     * @param cartId 购物车id
     */
    void updateGoodsStockByGoodsId(Integer cartId);

    /**
     * 模糊查询商品信息
     *
     * @param goodsName 商品name
     * @return 返回商品对象
     */
    Goods selectFuzzyByGoodsName(String goodsName);

    /**
     * 商品库存-1
     *
     * @param goodsId 商品id
     */
    void updateGoodsStockSelfByGoodsId(Integer goodsId);

    /**
     * 根据goodsId更新商品评分
     *
     * @param goods 待更新的对象
     */
    void updateGoodsScoreByGoodsId(Goods goods);

    /**
     * 查询浏览量前4的商品信息
     *
     * @return 返回mapList
     */
    List<Map<String, Object>> selectByVisitNumLimitFour();

    /**
     * 根据商品id对商品的浏览数自增1
     *
     * @param goodsId 商品id
     */
    void updateVisitNumIncByGoodsId(Integer goodsId);

    /**
     * 分页查询商品记录
     *
     * @param pageNow  当前页(>0)
     * @param pageSize 页大小
     * @return 返回goodsList
     */
    List<Goods> selectGoodsLimit(Integer pageNow, Integer pageSize);

    /**
     * 根据id查询商品记录
     *
     * @param goodsId 商品id
     * @return 查询结果存放对象
     */
    Goods selectByPrimaryKey(Integer goodsId);

    /**
     * 查询评价排名前三的商品信息
     *
     * @return 返回商品list
     */
    List<Goods> selectGoodsTopThree();

    /**
     * 查询商品总数
     *
     * @return 返回商品总数
     */
    int selectGoodsCount();
}
