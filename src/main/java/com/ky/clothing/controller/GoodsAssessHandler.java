package com.ky.clothing.controller;

import com.ky.clothing.entity.Goods;
import com.ky.clothing.entity.GoodsAssess;
import com.ky.clothing.entity.User;
import com.ky.clothing.enums.SysParamEnum;
import com.ky.clothing.service.GoodsAssessService;
import com.ky.clothing.service.GoodsService;
import com.ky.clothing.util.IntegerUtil;
import com.ky.clothing.util.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @author Daye
 * 商品评论处理器
 */
@Controller
@RequestMapping(value = "/assess")
public class GoodsAssessHandler {

    private static final Logger LOGGER = LoggerFactory.getLogger(GoodsAssessHandler.class);
    private GoodsAssessService goodsAssessService;
    private GoodsService goodsService;

    /**
     * 用户发表商品评论
     *
     * @param goodsAssess 商品评价信息
     * @param request     请求域
     * @return 返回modelAndView
     */
    @RequestMapping(value = "/publish", method = RequestMethod.POST)
    public ModelAndView publishAssess(GoodsAssess goodsAssess, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        //1. 空值判断
        if (StringUtil.isEmpty(goodsAssess.getGoodsAssessContent())
                || IntegerUtil.isNotValid(goodsAssess.getGoodsAssessScore())
                || IntegerUtil.isNotValid(goodsAssess.getGoodsId())) {
            request.getSession().setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "请填写你的评价");
        } else {
            //获取session中的用户信息
            Integer userId = ((User) request.getSession().getAttribute(SysParamEnum.SESSION_USER_NAME.toString())).getUserId();
            //设置评论的用户信息
            goodsAssess.setUserId(userId);
            //2. 插入记录
            goodsAssessService.insertGoodsAssess(goodsAssess);
            //3. 更新评论总分
            Map<String, Object> sumScoreAndCnt = goodsAssessService.selectSumScoreAndCntByGoodsId(goodsAssess.getGoodsId());
            System.out.println(sumScoreAndCnt);
            //将该用户的分数加入总分计算出新的平均分
            int newScore = (Integer.parseInt(sumScoreAndCnt.get("sumScore").toString()) + goodsAssess.getGoodsAssessScore()) / (Integer.parseInt(sumScoreAndCnt.get("cnt").toString()) + 1);
            Goods goods = new Goods();
            goods.setGoodsId(goodsAssess.getGoodsId());
            goods.setGoodsScore(newScore);
            //更新商品评分
            goodsService.updateGoodsScoreByGoodsId(goods);
            //设置返回信息
            request.getSession().setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "评论成功");
        }
        modelAndView.setViewName("redirect:/goods/info/" + goodsAssess.getGoodsId() + ".html");
        return modelAndView;
    }

    @Autowired
    public void setGoodsAssessService(GoodsAssessService goodsAssessService) {
        this.goodsAssessService = goodsAssessService;
    }

    @Autowired
    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }
}
