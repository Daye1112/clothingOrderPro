package com.ky.clothing.service.impl;

import com.ky.clothing.dao.GoodsMapper;
import com.ky.clothing.entity.Goods;
import com.ky.clothing.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Daye
 * Goods表Service层实现类
 */
@Service
public class GoodsServiceImpl implements GoodsService {

    private GoodsMapper goodsMapper;

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public List<Goods> selectGoodsLimit(Integer pageNow, Integer pageSize) {
        //TODO 计算startIndex，开始查询的索引位startIndex = (pageNow - 1) * pageSize
        //TODO 调用goodsMapper，获取数据并返回
    	Integer startIndex=(pageNow - 1) * pageSize;
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
