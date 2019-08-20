package com.ky.clothing.controller;

import com.ky.clothing.entity.Goods;
import com.ky.clothing.entity.JsonResult;
import com.ky.clothing.entity.User;
import com.ky.clothing.enums.ErrorEnum;
import com.ky.clothing.enums.SysParamEnum;
import com.ky.clothing.service.GoodsAssessService;
import com.ky.clothing.service.GoodsService;
import com.ky.clothing.util.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Calendar;
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

    @RequestMapping(value = "/j/info/{goodsId}", method = RequestMethod.GET)
    @ResponseBody
    public JsonResult getGoodsToJson(@PathVariable("goodsId") Integer goodsId) {
        JsonResult jsonResult = null;
        if (IntegerUtil.isNotValid(goodsId)) {
            jsonResult = JsonResultUtil.setErrorOf(ErrorEnum.EMPTY_ERROR);
        } else {
            Goods goods = goodsService.selectByPrimaryKey(goodsId);
            jsonResult = JsonResultUtil.setSuccessOf(goods);
        }
        return jsonResult;
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public ModelAndView addGoods(String imgBase, String imgName, Goods goods, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("redirect:/lk/admin/goods/list/1/10.html");
        if (StringUtil.isEmpty(goods.getGoodsName()) || IntegerUtil.isNotValid(goods.getGoodsNum())
                || IntegerUtil.isNotValid(goods.getGoodsStock()) || DoubleUtil.isNotValid(goods.getGoodsPrice())) {

            request.getSession().setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "请填写完整的商品信息");
        } else {
            //1. 判断是否上传图片
            if (StringUtil.isNotEmpty(imgBase) && StringUtil.isNotEmpty(imgName)) {
                //2. 获取当前时间yyyyMMddHHmmssSS
                String nowDate = DateUtil.getNowTimeContinuous();
                //3. 确定uploads文件夹位置
                String rootPath = request.getSession().getServletContext().getRealPath("static/uploads/goods");
                //4. 获取当年当月的文件夹路径
                String dateFilePath = FileUtil.getDateFilePath(rootPath);
                //5. 判断文件夹是否存在，若不存在则创建
                boolean createFileFlag = FileUtil.createFile(dateFilePath);
                //6. 判断创建文件名是否成功
                if (!createFileFlag) {
                    request.getSession().setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "文件创建失败,请联系管理员");
                } else {
                    //7. 创建新文件名
                    String newFileName = "goods_" + nowDate + imgName.substring(imgName.lastIndexOf("."));
                    //8. 图片转码并存入文件夹中
                    boolean saveImgFlag = ImgBaseUtil.GenerateImage(imgBase.split(",")[1], dateFilePath + "/" + newFileName);
                    //9. 判断文件是否保存成功
                    if (!saveImgFlag) {
                        request.getSession().setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "图片保存失败，请联系管理员");
                    } else {
                        //10. 获取文件的相对路径
                        Calendar date = Calendar.getInstance();
                        String newImgPath = "/static/uploads/goods/" + date.get(Calendar.YEAR) + "/" + (date.get(Calendar.MONTH) + 1) + "/" + newFileName;
                        //11. 将文件的相对路径存入user对象中
                        goods.setGoodsImageUrl(newImgPath);
                    }
                }
            }
            //添加/修改
            if (IntegerUtil.isNotValid(goods.getGoodsId())) {
                if (StringUtil.isNotEmpty(goods.getGoodsImageUrl())) {
                    //添加
                    //初始化基本信息
                    goods.setGoodsNo(RandomUtil.randomNumber(9));
                    goods.setGoodsScore(0);
                    goods.setVisitNum(0);
                    //插入
                    goodsService.insertSelective(goods);
                } else{
                    request.getSession().setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "请上传商品照片");
                }
            } else {
                //修改
                goodsService.updateByPrimaryKeySelective(goods);
            }
        }
        return modelAndView;
    }

    /**
     * 根据goodsId删除商品记录
     *
     * @param goodsId 商品id
     * @return 返回json格式数据
     */
    @RequestMapping(value = "/del/{goodsId}", method = RequestMethod.GET)
    @ResponseBody
    public JsonResult deleteGoodsByGoodsId(@PathVariable("goodsId") Integer goodsId) {
        JsonResult jsonResult;
        if (IntegerUtil.isNotValid(goodsId)) {
            jsonResult = JsonResultUtil.setErrorOf(ErrorEnum.EMPTY_ERROR);
        } else {
            goodsService.updateGoodsValidByGoodsId(goodsId);
            jsonResult = JsonResultUtil.setSuccessOf(null);
        }
        return jsonResult;
    }

    /**
     * 模糊查询商品信息
     *
     * @param goodsName 商品名
     * @param request   请求域
     * @return 跳转目标页
     */
    @RequestMapping(value = "/fq/goods", method = RequestMethod.POST)
    public String toClothesFuzzyQuery(String goodsName, HttpServletRequest request) {
        //判断参数是否为空
        if (StringUtil.isEmpty(goodsName)) {
            request.getSession().setAttribute(SysParamEnum.SESSION_REQUEST_MESSAGE_NAME.toString(), "请输入待搜索的商品名");
        } else {
            Goods goods = goodsService.selectFuzzyByGoodsName(goodsName);
            if (goods == null) {
                return "redirect:/customerLink/home.html";
            }
            request.getSession().setAttribute(SysParamEnum.SESSION_GOODS_NAME.toString(), goods);
        }
        return "redirect:/goods/jump.html";
    }

    /**
     * 跳转到商品信息页
     *
     * @return 跳转到目标页面
     */
    @RequestMapping(value = "/jump", method = RequestMethod.GET)
    public String toGoodsPages() {
        return "/pages/good_info";
    }

    /**
     * 根据商品id查询商品信息存入session中准备使用
     *
     * @param goodsId 商品信息
     * @param request 请求域
     * @return 返回modelAndView
     */
    @RequestMapping(value = "/info/{goodsId}", method = RequestMethod.GET)
    public ModelAndView prepareGoodsForGoodsInfo(@PathVariable("goodsId") Integer goodsId, HttpServletRequest request) {
        //创建对象
        ModelAndView modelAndView = new ModelAndView();
        //查询商品信息
        Goods goods = goodsService.selectByPrimaryKey(goodsId);
        //存入session中
        request.getSession().setAttribute(SysParamEnum.SESSION_GOODS_NAME.toString(), goods);
        //查询商品评论信息
        List<Map<String, Object>> assessList = goodsAssessService.selectBaseInfoByGoodsId(goodsId);
        //商品浏览数+1
        goodsService.updateVisitNumIncByGoodsId(goodsId);
        //存入session中
        request.getSession().setAttribute(SysParamEnum.SESSION_GOODS_ASSESSES_NAME.toString(), assessList);
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
