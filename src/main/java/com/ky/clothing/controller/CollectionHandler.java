package com.ky.clothing.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ky.clothing.entity.Collectionss;
import com.ky.clothing.entity.User;
import com.ky.clothing.enums.SysParamEnum;
import com.ky.clothing.service.CartService;
import com.ky.clothing.service.CollectionService;
import com.ky.clothing.util.IntegerUtil;
import com.ky.clothing.util.StringUtil;

@RequestMapping(value = "/clt")
@Controller
public class CollectionHandler {
	
	private CollectionService collectionservice;
	/**
     * 清空收藏单
     *
     * @param request 
     * @return 返回modelAndView
     */
    @RequestMapping(value = "/clear", method = RequestMethod.GET)
    public ModelAndView clearClt(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        User user = (User) request.getSession().getAttribute(SysParamEnum.SESSION_USER_NAME.toString());
        collectionservice.deleteByUserId(user.getUserId());
        @SuppressWarnings("unchecked")
    	Map<String, Object> starInfo = (Map<String, Object>) request.getSession().getAttribute(SysParamEnum.SESSION_STAR_INFO_NAME.toString());
        starInfo.put("cltCnt", 0);
        request.getSession().setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "已清空收藏单");
        modelAndView.setViewName("redirect:/clt/info.html");
        return modelAndView;
    }

    /**
     * 根据收藏单id删除收藏
     *
     * @param cartId 
     * @return 返回modelAndView
     */
    @RequestMapping(value = "/del/{cltId}", method = RequestMethod.GET)
    public ModelAndView delCartByCltId(@PathVariable("cltId") Integer cltId, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        if (IntegerUtil.isNotValid(cltId)) {
            request.getSession().setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "请选择要删除的商品");
        } else {
        	collectionservice.deleteByCltId(cltId);
        	@SuppressWarnings("unchecked")
        	Map<String, Object> starInfo = (Map<String, Object>) request.getSession().getAttribute(SysParamEnum.SESSION_STAR_INFO_NAME.toString());
            starInfo.put("cltCnt", (int) starInfo.get("cltCnt") -1);
            request.getSession().setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "已从收藏中删除该商品");
        }
        modelAndView.setViewName("redirect:/clt/info.html");
        return modelAndView;
    }

    /**
     * 跳转到用户的收藏单页面，显示数据
     *
     * @param request 
     * @return 返回modelAndView
     */
    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public ModelAndView prepareUserClt(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        List<Map<String, Object>> cltList = collectionservice.findBaseInfoByUserId(((User) request.getSession().getAttribute(SysParamEnum.SESSION_USER_NAME.toString())).getUserId());
        //System.out.println(cltList);
        request.getSession().setAttribute(SysParamEnum.SESSION_CLT_LIST_NAME.toString(), cltList);
        modelAndView.setViewName("pages/collection");
        return modelAndView;
    }

    /**
     * 添加商品到用户收藏单中
     *
     * @param clt    
     * @param request 
     * @return modelAndView
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addGoodsToClt(Integer goodsId,String cltGoodsSize, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        Collectionss clt=new Collectionss();
        clt.setGoodsId(goodsId);
        clt.setCltGoodsSize(cltGoodsSize);
        //System.out.println("测试输出初始clt"+clt);
        if (IntegerUtil.isNotValid(clt.getGoodsId()) || StringUtil.isEmpty(clt.getCltGoodsSize())) {
            request.getSession().setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "请选择要加入收藏单的商品的尺寸");
            //System.out.println("测试-不合法");
        } else {
            User user = (User) request.getSession().getAttribute(SysParamEnum.SESSION_USER_NAME.toString());
            clt.setUserId(user.getUserId());
            Collectionss checkCltIsNew = collectionservice.checkCltIsNew(clt);
            if (checkCltIsNew == null) {
            	clt.setCltValid(true);
            	//System.out.println("测试：该商品不存在收藏中");
            	collectionservice.addCollectionss(clt);
                @SuppressWarnings("unchecked")
                Map<String, Object> starInfo = (Map<String, Object>) request.getSession().getAttribute(SysParamEnum.SESSION_STAR_INFO_NAME.toString());
                starInfo.put("cltCnt", (int) starInfo.get("cltCnt") + 1);
            } else {
            	//System.out.println("测试：该商品已存在收藏中");
            	request.getSession().setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "该商品已存在收藏中");
            } 
        }
        modelAndView.setViewName("redirect:/clt/info.html");
        return modelAndView;
    }
    
    @Autowired
    public void setCltService(CollectionService collectionservice) {
        this.collectionservice = collectionservice;
    }
}
