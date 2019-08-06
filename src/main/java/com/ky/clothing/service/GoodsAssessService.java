package com.ky.clothing.service;

import com.ky.clothing.entity.GoodsAssess;

import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * 商品评价表Service层接口类
 */
public interface GoodsAssessService {

    /**
     * 根据goodsId查询商品的评价人数和总分数
     * @param goodsId 商品id
     * @return 返回map
     */
    Map<String, Object> selectSumScoreAndCntByGoodsId(Integer goodsId);

    /**
     * 插入商品评论记录
     * @param goodsAssess 待插入的商品评论记录
     */
    void insertGoodsAssess(GoodsAssess goodsAssess);

    /**
     * 查询评分最高的前4条评论
     * @return 返回list集合,map的key={avatarUrl, loginAccount, goodsAssessScore, goodsAssessContent}
     */
    List<Map<String, Object>> selectBaseInfoTopFour();

    /**
     * 根据商品id查询商品的所有评论基本信息
     * @param goodsId 商品id
     * @return list集合,map的key={avatarUrl, loginAccount, goodsAssessScore, goodsAssessContent}
     */
    List<Map<String,Object>> selectBaseInfoByGoodsId(Integer goodsId);
}
