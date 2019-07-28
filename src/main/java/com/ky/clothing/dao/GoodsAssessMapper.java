package com.ky.clothing.dao;

import com.ky.clothing.entity.GoodsAssess;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * 商品评价Dao层持久类
 */
@Repository
public interface GoodsAssessMapper {

    /**
     * 查询评分最高的前4条评论
     * @return 返回list集合
     */
    List<Map<String, Object>> selectBaseInfoTopFour();

    /**
     * 根据商品id查询商品的所有评论基本信息
     * @param goodsId 商品id
     * @return list集合,map的key={avatarUrl, loginAccount, goodsAssessScore, goodsAssessContent}
     */
    List<Map<String,Object>> selectBaseInfoByGoodsId(@Param("goodsId") Integer goodsId);

    /**
     * 根据id删除记录
     * @param goodsAssessId 商品评价id
     * @return 返回影响行数
     */
    int deleteByPrimaryKey(Integer goodsAssessId);

    /**
     * 插入数据记录（无null值验证）
     * @param record 待插入的数据对象
     * @return 返回插入的记录id
     */
    int insert(GoodsAssess record);

    /**
     * 插入数据记录（有null值验证）
     * @param record 待插入的数据对象
     * @return 返回插入的记录id
     */
    int insertSelective(GoodsAssess record);

    /**
     * 根据id查询记录
     * @param goodsAssessId 商品评价id
     * @return 查询的对象
     */
    GoodsAssess selectByPrimaryKey(Integer goodsAssessId);

    /**
     * 根据id更新记录（有null值验证）
     * @param record 待更新的对象
     * @return 返回影响行数
     */
    int updateByPrimaryKeySelective(GoodsAssess record);

    /**
     * 根据id更新记录（无null值验证）
     * @param record 待更新的对象
     * @return 返回影响行数
     */
    int updateByPrimaryKey(GoodsAssess record);
}