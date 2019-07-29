package com.ky.clothing.dao;

import com.ky.clothing.entity.Goods;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Daye
 * 商品表的Dao层持久类
 */
@Repository
public interface GoodsMapper {

    /**
     * 查询记录总数
     * @return
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