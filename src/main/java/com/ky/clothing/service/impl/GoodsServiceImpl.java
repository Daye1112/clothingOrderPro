package com.ky.clothing.service.impl;

import com.ky.clothing.dao.GoodsMapper;
import com.ky.clothing.entity.Goods;
import com.ky.clothing.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * Goods表Service层实现类
 */
@Service
public class GoodsServiceImpl implements GoodsService {

    private GoodsMapper goodsMapper;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateGoodsStockByGoodsId(Integer cartId) {
        goodsMapper.updateGoodsStockByGoodsId(cartId);
    }

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public Goods selectFuzzyByGoodsName(String goodsName) {
        return goodsMapper.selectFuzzyByGoodsName("%" + goodsName + "%");
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateGoodsStockSelfByGoodsId(Integer goodsId) {
        goodsMapper.updateGoodsStockSelfByGoodsId(goodsId);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateGoodsScoreByGoodsId(Goods goods) {
        goodsMapper.updateGoodsScoreByGoodsId(goods);
    }

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public List<Map<String, Object>> selectByVisitNumLimitFour() {
        return goodsMapper.selectByVisitNumLimitFour();
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateVisitNumIncByGoodsId(Integer goodsId) {
        goodsMapper.updateVisitNumIncByGoodsId(goodsId);
    }

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public List<Goods> selectGoodsLimit(Integer pageNow, Integer pageSize) {
        Integer startIndex = (pageNow - 1) * pageSize;
        return goodsMapper.selectGoodsLimit(startIndex, pageSize);
    }

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public Goods selectByPrimaryKey(Integer goodsId) {
        return goodsMapper.selectByPrimaryKey(goodsId);
    }

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public List<Goods> selectGoodsTopThree() {
        return goodsMapper.selectGoodsTopThree();
    }

    @Autowired
    public void setGoodsMapper(GoodsMapper goodsMapper) {
        this.goodsMapper = goodsMapper;
    }

    @Override
    public int selectGoodsCount() {
        return goodsMapper.selectGoodsCount();
    }
}
