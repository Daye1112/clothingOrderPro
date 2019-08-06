package com.ky.clothing.service.impl;

import com.ky.clothing.dao.CartMapper;
import com.ky.clothing.dao.GoodsMapper;
import com.ky.clothing.entity.Cart;
import com.ky.clothing.service.CartService;
import com.ky.clothing.util.CartUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * cart表service层实现类
 */
@Service
public class CartServiceImpl implements CartService {

    private CartMapper cartMapper;
    private GoodsMapper goodsMapper;

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public List<Map<String, Object>> findByUserIdForCheckOrder(Integer userId) {
        return cartMapper.findByUserIdForCheckOrder(userId);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateCartGoodsNumByCartId(Cart cart) {
        cartMapper.updateCartGoodsNumByCartId(cart);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteByUserId(Integer userId) {
        //查询该用户购物车的所有商品
        List<Map<String, Object>> cartList = cartMapper.selectGoodsIdAndCartGoodsNumByUserId(userId);
        for (Map<String, Object> cart : cartList) {
            goodsMapper.updateGoodsStockByGoodsId(Integer.parseInt(cart.get("cartId").toString()));
        }
        cartMapper.deleteByUserId(userId);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteByCartId(Integer cartId) {
        //根据cartId，将购物车的商品数加入到商品库存中
        goodsMapper.updateGoodsStockByGoodsId(cartId);
        cartMapper.deleteByCartId(cartId);
    }

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public List<Map<String, Object>> findBaseInfoByUserId(Integer userId) {
        List<Map<String, Object>> cartList = cartMapper.findBaseInfoByUserId(userId);
        return CartUtil.calculationTotalPrice(cartList);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateCartGoodsNumInc(Cart cart) {
        cartMapper.updateCartGoodsNumInc(cart);
    }

    @Transactional(rollbackFor = Exception.class, readOnly = true)
    @Override
    public Cart checkCartIsNew(Cart cart) {
        return cartMapper.findByGoodsIdAndUserInAndCartGoodsSize(cart);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void addCart(Cart cart) {
        cartMapper.insertSelective(cart);
    }

    @Autowired
    public void setCartMapper(CartMapper cartMapper) {
        this.cartMapper = cartMapper;
    }

    @Autowired
    public void setGoodsMapper(GoodsMapper goodsMapper) {
        this.goodsMapper = goodsMapper;
    }
}
