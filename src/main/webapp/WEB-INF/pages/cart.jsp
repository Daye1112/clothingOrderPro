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
                                            <img src="<%=path%>${cart.goodsImageUrl}" alt="图片加载中" width="120px" height="120px">
                                        </div>
                                        <!-- Product Name -->
                                        <div class="cart_product_name"><a target="_blank" href="<%=path%>/goods/info/${cart.goodsId}.html">${cart.goodsName}</a></div>
                                        <div class="cart_product_info ml-auto">
                                            <div class="cart_product_info_inner d-flex flex-row align-items-center justify-content-md-end justify-content-start">
                                                <!-- Product Price -->
                                                <div class="cart_product_price">${cart.cartGoodsSize}</div>
                                                <div class="cart_product_price">￥${cart.goodsPrice}</div>
                                                <!-- Product Quantity -->
                                                <div class="cart_product_price">${cart.cartGoodsNum}</div>
                                                <%--<div class="product_quantity_container">--%>
                                                    <%--<div class="product_quantity clearfix">--%>
                                                        <%--<input id="quantity_input" type="text" pattern="[0-9]*"--%>
                                                               <%--value="${cart.cartGoodsNum}">--%>
                                                        <%--<div class="quantity_buttons">--%>
                                                            <%--<div id="quantity_inc_button"--%>
                                                                 <%--class="quantity_inc quantity_control"><i--%>
                                                                    <%--class="fa fa-caret-up" aria-hidden="true"></i></div>--%>
                                                            <%--<div id="quantity_dec_button"--%>
                                                                 <%--class="quantity_dec quantity_control"><i--%>
                                                                    <%--class="fa fa-caret-down" aria-hidden="true"></i>--%>
                                                            <%--</div>--%>
                                                        <%--</div>--%>
                                                    <%--</div>--%>
                                                <%--</div>--%>
                                                <!-- Products Total Price -->
                                                <div class="cart_product_total">￥${cart.totalPrice}</div>
                                                <c:set value="${allGoodsPrice + cart.totalPrice}" var="allGoodsPrice"/>
                                                <!-- Product Cart Trash Button -->
                                                <div class="cart_product_button">
                                                    <a href="<%=path%>/cart/del/${cart.cartId}.do" class="cart_product_remove">
                                                        <img src="<%=path%>/static/images/trash.png" alt="">
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
                            <!-- <button class="button_update cart_button">update cart</button> -->
                            <a href="<%=path%>/customerLink/clothes/1/12.html" style="padding-top: 1%;" class="button_update cart_button_2 ml-md-auto">继续购物</a>
                        </div>
                    </div>
                </div>
                <div class="row cart_extra">
                    <!-- Cart Coupon -->
                    <!-- <div class="col-lg-6">
                        <div class="cart_coupon">
                            <div class="cart_title">coupon code</div>
                            <form action="#" class="cart_coupon_form d-flex flex-row align-items-start justify-content-start" id="cart_coupon_form">
                                <input type="text" class="cart_coupon_input" placeholder="Coupon code" required="required">
                                <button class="button_clear cart_button_2">apply coupon</button>
                            </form>
                        </div>
                    </div> -->
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
        })
    </script>
    <%session.removeAttribute("dealMsg");%>
</body>
</html>