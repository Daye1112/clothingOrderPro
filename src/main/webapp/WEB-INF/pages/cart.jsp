<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Cart</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Wish shop project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/bootstrap4/bootstrap.min.css">
    <link href="<%=path%>/static/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/cart.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/cart_responsive.css">
</head>
<body>

    <div class="super_container">

        <!-- Header -->
        <jsp:include page="module/top.jsp"/>

        <!-- Menu -->
        <jsp:include page="module/menu.jsp"/>

        <!-- Home -->
        <div class="home">
            <div class="home_background parallax-window" data-parallax="scroll"
                 data-image-src="<%=path%>/static/images/cart.jpg"
                 data-speed="0.8"></div>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="home_container">
                            <div class="home_content">
                                <div class="home_title">购物车</div>
                                <div class="breadcrumbs">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Cart -->

        <div class="cart_container">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="cart_title">我的购物车</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="cart_bar d-flex flex-row align-items-center justify-content-start">
                            <div class="cart_bar_title_name">商品</div>
                            <div class="cart_bar_title_content ml-auto">
                                <div class="cart_bar_title_content_inner d-flex flex-row align-items-center justify-content-end">
                                    <div class="cart_bar_title_price">尺寸</div>
                                    <div class="cart_bar_title_price">单价</div>
                                    <div class="cart_bar_title_quantity">数量</div>
                                    <div class="cart_bar_title_total">总价</div>
                                    <div class="cart_bar_title_button"></div>
                                    <div class="cart_bar_title_button"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="cart_products">
                            <ul>
                                <c:set var="allGoodsPrice" value="0"/>
                                <c:forEach items="${sessionScope.cartList}" var="cart">
                                    <li class=" cart_product d-flex flex-md-row flex-column align-items-md-center align-items-start justify-content-start">
                                        <!-- Product Image -->
                                        <div class="cart_product_image">
                                            <img src="<%=path%>${cart.goodsImageUrl}" alt="图片加载中" width="120px"
                                                 height="120px">
                                        </div>
                                        <!-- Product Name -->
                                        <div class="cart_product_name"><a target="_blank"
                                                                          href="<%=path%>/goods/info/${cart.goodsId}.html">${cart.goodsName}</a>
                                        </div>
                                        <div class="cart_product_info ml-auto">
                                            <div class="cart_product_info_inner d-flex flex-row align-items-center justify-content-md-end justify-content-start">
                                                <!-- Product Price -->
                                                <div class="cart_product_price">${cart.cartGoodsSize}</div>
                                                <div class="cart_product_price">￥${cart.goodsPrice}</div>
                                                <!-- Product Quantity -->
                                                <div class="cart_product_price">${cart.cartGoodsNum}</div>
                                                <!-- Products Total Price -->
                                                <div class="cart_product_total">￥${cart.totalPrice}</div>
                                                <c:set value="${allGoodsPrice + cart.totalPrice}" var="allGoodsPrice"/>
                                                <!-- Product Cart Trash Button -->
                                                <div class="cart_product_button">
                                                    <a href="<%=path%>/cart/del/${cart.cartId}.do"
                                                       class="cart_product_remove">
                                                        <img src="<%=path%>/static/images/trash.png" alt="">
                                                    </a>
                                                </div>
                                                <div class="cart_product_button">
                                                    <a href="#" name="${cart.cartId}" class="cart_product_edit">
                                                        <img width="28px" height="28px"
                                                             src="<%=path%>/static/images/edit.png" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                                <% session.removeAttribute("cartList");%>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="cart_control_bar d-flex flex-md-row flex-column align-items-start justify-content-start">
                            <a href="<%=path%>/cart/clear.do" style="padding-top: 1%;" class="button_clear cart_button">清空购物车</a>
                            <a href="<%=path%>/customerLink/clothes/1/12.html" style="padding-top: 1%;"
                               class="button_update cart_button_2 ml-md-auto">继续购物</a>
                        </div>
                    </div>
                </div>
                <div class="row cart_extra">
                    <!-- Cart Total -->
                    <div class="col-lg-5 offset-lg-1">
                        <div class="cart_total">
                            <div class="cart_title">购物车总价</div>
                            <ul>
                                <li class="d-flex flex-row align-items-center justify-content-start">
                                    <div class="cart_total_title">商品总价</div>
                                    <div class="cart_total_price ml-auto">￥${allGoodsPrice}</div>
                                </li>
                                <li class="d-flex flex-row align-items-center justify-content-start">
                                    <div class="cart_total_title">运费</div>
                                    <div class="cart_total_price ml-auto">￥5.00</div>
                                </li>
                                <li class="d-flex flex-row align-items-center justify-content-start">
                                    <div class="cart_total_title">合计</div>
                                    <div class="cart_total_price ml-auto">￥${allGoodsPrice + 5}</div>
                                </li>
                            </ul>
                            <button class="cart_total_button">确认订单</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Newsletter -->

        <div class="newsletter">
            <div class="newsletter_content">
                <div class="newsletter_image parallax-window" data-parallax="scroll"
                     data-image-src="<%=path%>/static/images/newsletter.jpg"
                     data-speed="0.8"></div>
                <div class="container">
                    <div class="row options">

                        <!-- Options Item -->
                        <div class="col-lg-3">
                            <div class="options_item d-flex flex-row align-items-center justify-content-start">
                                <div class="option_image"><img src="<%=path%>/static/images/option_1.png" alt=""></div>
                                <div class="option_content">
                                    <div class="option_title">30天退换</div>
                                    <div class="option_subtitle">无条件退货</div>
                                </div>
                            </div>
                        </div>

                        <!-- Options Item -->
                        <div class="col-lg-3">
                            <div class="options_item d-flex flex-row align-items-center justify-content-start">
                                <div class="option_image"><img src="<%=path%>/static/images/option_2.png" alt=""></div>
                                <div class="option_content">
                                    <div class="option_title">免费定制</div>
                                    <div class="option_subtitle">定制不加价</div>
                                </div>
                            </div>
                        </div>

                        <!-- Options Item -->
                        <div class="col-lg-3">
                            <div class="options_item d-flex flex-row align-items-center justify-content-start">
                                <div class="option_image"><img src="<%=path%>/static/images/option_3.png" alt=""></div>
                                <div class="option_content">
                                    <div class="option_title">安全付款</div>
                                    <div class="option_subtitle">无需担心</div>
                                </div>
                            </div>
                        </div>

                        <!-- Options Item -->
                        <div class="col-lg-3">
                            <div class="options_item d-flex flex-row align-items-center justify-content-start">
                                <div class="option_image"><img src="<%=path%>/static/images/option_4.png" alt=""></div>
                                <div class="option_content">
                                    <div class="option_title">全天候支持</div>
                                    <div class="option_subtitle">随时联系我们</div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row newsletter_row">
                        <div class="col">
                            <div class="section_title_container text-center">
                                <div class="section_subtitle">only the best</div>
                                <div class="section_title">拓展模块</div>
                            </div>
                        </div>
                    </div>
                    <div class="row newsletter_container">
                        <div class="col-lg-10 offset-lg-1">
                            <div class="newsletter_form_container">
                                <form action="#">
                                    <input type="email" class="newsletter_input" required="required"
                                           placeholder="E-mail here">
                                    <button type="submit" class="newsletter_button">提交</button>
                                </form>
                            </div>
                            <div class="newsletter_text">文案
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="module/footer.jsp"/>
    </div>

    <script src="<%=path%>/static/js/jquery-3.2.1.min.js"></script>
    <script src="<%=path%>/static/styles/bootstrap4/popper.js"></script>
    <script src="<%=path%>/static/styles/bootstrap4/bootstrap.min.js"></script>
    <script src="<%=path%>/static/plugins/easing/easing.js"></script>
    <script src="<%=path%>/static/plugins/parallax-js-master/parallax.min.js"></script>
    <script src="<%=path%>/static/js/cart_custom.js"></script>
    <script type="text/javascript" src="<%=path%>/static/plugins/layui/layui.js"></script>
    <script type="text/javascript">
        $(function () {
            layui.use('layer', function () {
                var layer = layui.layer;
                <c:if test="${not empty sessionScope.dealMsg}">
                layer.msg("${sessionScope.dealMsg}");
                </c:if>
            });
            $(".cart_product_edit").click(function () {
                var $cartId = $(this).attr("name");
                layui.use('layer', function () {
                    var layer = layui.layer;
                    layer.open({
                        title: "修改密码",
                        type: 1,
                        skin: '', //样式类名
                        closeBtn: 1, //不显示关闭按钮
                        anim: 2,
                        shadeClose: true, //开启遮罩关闭
                        content: '<div style="width: 360px;text-align: center;">' +
                            '<form action="<%=path%>/cart/update/num.do" method="post" style="text-align: center;"><br/>' +
                            '购买数量：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="cartGoodsNum"/><br/><br/>' +
                            '<input type="hidden" name="cartId" value="' + $cartId + '"/>' +
                            '<input style="margin-top: 5px;width:50%;" class="cart_total_button" type="submit" value="提交"/><br/><br/>' +
                            '</form>' +
                            '</div>'
                    });
                    return false;
                });
            });
        })
    </script>
    <%session.removeAttribute("dealMsg");%>
</body>
</html>