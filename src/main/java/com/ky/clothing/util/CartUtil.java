package com.ky.clothing.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * cart工具类
 */
public class CartUtil {

    /**
     * 计算购物车每种商品的价格
     * @param cartList 购物车商品list
     * @return 返回处理好的mapList
     */
    public static List<Map<String, Object>> calculationTotalPrice(List<Map<String, Object>> cartList){
        if(null == cartList){
            return null;
        }
        List<Map<String, Object>> newCartList = new ArrayList<>();
        for (Map<String, Object> map : cartList) {
            int number = (int)map.get("cartGoodsNum");
            double price = (double)map.get("goodsPrice");
            double totalPrice = number * price;
            Map<String, Object> tmpMap = new HashMap<>(map);
            tmpMap.put("totalPrice", totalPrice);
            newCartList.add(tmpMap);
        }
        return newCartList;
    }

}
