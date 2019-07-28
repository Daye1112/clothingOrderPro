package com.ky.clothing.controller;

import com.ky.clothing.entity.Goods;
import com.ky.clothing.enums.SysParamEnum;
import com.ky.clothing.service.GoodsAssessService;
import com.ky.clothing.service.GoodsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @author Daye
 * 商品处理器
 */
@Controller
@RequestMapping(value = "/goods")
public class GoodsHandler {
    private static final Logger LOGGER = LoggerFactory.getLogger(GoodsHandler.class);

    private GoodsService goodsService;

    private GoodsAssessService goodsAssessService;

    /**
     * 根据商品id查询商品信息存入session中准备使用
     * @param goodsId 商品信息
     * @param request 请求域
     * @return 返回modelAndView
     */
    @RequestMapping(value = "/info/{goodsId}", method = RequestMethod.GET)
    public ModelAndView prepareGoodsForGoodsInfo(@PathVariable("goodsId") Integer goodsId, HttpServletRequest request){
        //创建对象
        ModelAndView modelAndView = new ModelAndView();
        try{
            //查询商品信息
            Goods goods = goodsService.selectByPrimaryKey(goodsId);
            //存入session中
            request.getSession().setAttribute(SysParamEnum.SESSION_GOODS_NAME.toString(), goods);
            //查询商品评论信息
            List<Map<String, Object>> assessList = goodsAssessService.selectBaseInfoByGoodsId(goodsId);
            //存入session中
            request.getSession().setAttribute(SysParamEnum.SESSION_GOODS_ASSESSES_NAME.toString(), assessList);
        }catch (Exception e){
            //异常处理
            LOGGER.error(e.getMessage(), e);
            modelAndView.setViewName("/pages/500");
            return modelAndView;
        }
        //设置跳转目标
        modelAndView.setViewName("/pages/good_info");
        //跳转
        return modelAndView;
    }

    @Autowired
    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    @Autowired
    public void setGoodsAssessService(GoodsAssessService goodsAssessService) {
        this.goodsAssessService = goodsAssessService;
    }
}
