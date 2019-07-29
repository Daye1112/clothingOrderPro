package com.ky.clothing.service.impl;

import com.ky.clothing.dao.CartMapper;
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
}
