package com.ky.clothing.service.impl;

import com.ky.clothing.dao.GoodsAssessMapper;
import com.ky.clothing.entity.GoodsAssess;
import com.ky.clothing.service.GoodsAssessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * 商品评论表Service层实现类
 */
@Service
public class GoodsAssessServiceImpl implements GoodsAssessService {

    private GoodsAssessMapper goodsAssessMapper;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void insertGoodsAssess(GoodsAssess goodsAssess) {
        goodsAssessMapper.insertSelective(goodsAssess);
    }

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public List<Map<String, Object>> selectBaseInfoTopFour() {
        return goodsAssessMapper.selectBaseInfoTopFour();
    }

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public List<Map<String, Object>> selectBaseInfoByGoodsId(Integer goodsId) {
        return goodsAssessMapper.selectBaseInfoByGoodsId(goodsId);
    }

    @Autowired
    public void setGoodsAssessMapper(GoodsAssessMapper goodsAssessMapper) {
        this.goodsAssessMapper = goodsAssessMapper;
    }
}
