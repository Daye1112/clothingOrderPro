package com.ky.clothing.dao;

import com.ky.clothing.entity.Goods;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * 商品表的Dao层持久类
 */
@Repository
public interface GoodsMapper {

    /**
     * 根据id将商品的valid置为0
     * @param goodsId 商品id
     */
    void updateGoodsValidByGoodsId(@Param("goodsId") Integer goodsId);

    /**
     * 查询所有用户的记录数
     * @return 返回userList
     */
    Integer selectTotalRecordingCountGoodsId();

    /**
     * 分页查询所有商品的基本信息
     * @param startIndex 查询的索引位
     * @param pageSize 查询记录数
     * @return 返回userList
     */
    List<Goods> selectAllBaseInfoLimit(@Param("startIndex") Integer startIndex, @Param("pageSize") Integer pageSize);

    /**
     * 根据cartId更新商品的库存
     * @param cartId 购物车id
     */
    void updateGoodsStockByGoodsId(@Param("cartId") Integer cartId);

    /**
     * 模糊查询商品信息
     * @param goodsName 商品name
     * @return 返回商品对象
     */
    Goods selectFuzzyByGoodsName(@Param("goodsName")String goodsName);

    /**
     * 商品库存-1
     * @param goodsId 商品id
     */
    void updateGoodsStockSelfByGoodsId(@Param("goodsId") Integer goodsId);

    /**
     * 根据goodsId更新商品评分
     * @param goods 待更新的对象
     */
    void updateGoodsScoreByGoodsId(Goods goods);

    /**
     * 查询浏览量前4的商品信息
     * @return 返回mapList
     */
    List<Map<String, Object>> selectByVisitNumLimitFour();

    /**
     * 根据商品id对商品的浏览数自增1
     * @param goodsId 商品id
     */
    void updateVisitNumIncByGoodsId(@Param("goodsId") Integer goodsId);

    /**
     * 查询记录总数
     * @return 返回总记录数
     */
	int selectGoodsCount();
	/**
     * 分页查询商品记录
     * @param startIndex 开始查询的索引位
     * @param pageSize 页大小
     * @return 返回goodsList
     */
    List<Goods> selectGoodsLimit(@Param("startIndex") Integer startIndex, @Param("pageSize") Integer pageSize);

    /**
     * 查询评价排名前三的商品信息
     * @return 返回商品list
     */
    List<Goods> selectGoodsTopThree();

    /**
     * 根据id删除商品
     * @param goodsId 商品id
     * @return 影响行数
     */
    int deleteByPrimaryKey(Integer goodsId);

    /**
     * 插入记录（无null验证）
     * @param record 待插入的数据存放对象
     * @return 返回插入的记录id
     */
    int insert(Goods record);

    /**
     * 插入记录（有null验证）
     * @param record 待插入的数据存放对象
     * @return 返回插入的记录id
     */
    int insertSelective(Goods record);

    /**
     * 根据id查询商品记录
     * @param goodsId 商品id
     * @return 查询结果存放对象
     */
    Goods selectByPrimaryKey(Integer goodsId);

    /**
     * 根据id更新记录（有null验证）
     * @param record 待更新记录
     * @return 返回影响行数
     */
    int updateByPrimaryKeySelective(Goods record);

    /**
     * 根据id更新记录（有null验证）
     * @param record 待更新记录
     * @return 返回影响行数
     */
    int updateByPrimaryKey(Goods record);
}