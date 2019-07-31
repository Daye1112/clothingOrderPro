<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Collection</title>
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
                                <div class="home_title">收藏单</div>
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
                        <div class="cart_title">我的收藏单</div>
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
                                    <div class="cart_bar_title_button"></div>
                                    <div class="cart_bar_title_button"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="clt_products">
                            <ul>
                                <%-- <c:set var="allGoodsPrice" value="0"/> --%>
                                <c:forEach items="${sessionScope.cltList}" var="clt">
                                    <li class=" cart_product d-flex flex-md-row flex-column align-items-md-center align-items-start justify-content-start">
                                        <!-- Product Image -->
                                        <div class="cart_product_image">
                                            <img src="<%=path%>${clt.goodsImageUrl}" alt="图片加载中" width="120px"
                                                 height="120px">
                                        </div>
                                        <!-- Product Name -->
                                        <div class="cart_product_name"><a target="_blank"
                                                                          href="<%=path%>/goods/info/${clt.goodsId}.html">${clt.goodsName}</a>
                                        </div>
                                        <div class="cart_product_info ml-auto">
                                            <div class="cart_product_info_inner d-flex flex-row align-items-center justify-content-md-end justify-content-start">
                                                <!-- Product Price -->
                                                <div class="cart_product_price">${clt.cltGoodsSize}</div>
                                                <div class="cart_product_price">￥${clt.goodsPrice}</div>

                                                <!-- Product Cart Trash Button -->
                                                <div class="cart_product_button">
                                                    <a href="<%=path%>/clt/del/${clt.cltId}.do"
                                                       class="clt_product_remove">
                                                        <img src="<%=path%>/static/images/trash.png" alt="">
                                                    </a>
                                                </div>
                                               <!-- 可新增功能 -->                                             
                                                <div class="clt_product_button">

                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                                <% session.removeAttribute("cltList");%>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="cart_control_bar d-flex flex-md-row flex-column align-items-start justify-content-start">
                            <a href="<%=path%>/clt/clear.do" style="padding-top: 1%;" class="button_clear cart_button">清空收藏单</a>
                            <a href="<%=path%>/customerLink/clothes/1/12.html" style="padding-top: 1%;"
                               class="button_update cart_button_2 ml-md-auto">继续浏览</a>
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