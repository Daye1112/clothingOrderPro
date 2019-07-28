<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Wish</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Wish shop project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/bootstrap4/bootstrap.min.css">
    <link href="<%=path%>/static/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/plugins/OwlCarousel2-2.2.1/animate.css">
    <link href="<%=path%>/static/plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/main_styles.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/responsive.css">
</head>
<body>

    <div class="super_container">

        <!-- Header -->
        <jsp:include page="module/top.jsp"/>

        <!-- Menu -->
        <jsp:include page="module/menu.jsp"/>

        <!-- Home -->

        <div class="home">

            <!-- Home Slider -->

            <div class="home_slider_container">
                <div class="owl-carousel owl-theme home_slider">

                    <!-- Home Slider Item -->
                    <div class="owl-item">
                        <div class="home_slider_background"
                             style="background-image:url(<%=path%>/static/images/home_slider_1.jpg)"></div>
                        <div class="home_slider_content">
                            <div class="home_slider_content_inner">
                                <div class="home_slider_subtitle">促销价</div>
                                <div class="home_slider_title">新系列名</div>
                            </div>
                        </div>
                    </div>

                    <!-- Home Slider Item -->
                    <div class="owl-item">
                        <div class="home_slider_background"
                             style="background-image:url(<%=path%>/static/images/home_slider_1.jpg)"></div>
                        <div class="home_slider_content">
                            <div class="home_slider_content_inner">
                                <div class="home_slider_subtitle">促销价</div>
                                <div class="home_slider_title">新系列名</div>
                            </div>
                        </div>
                    </div>

                    <!-- Home Slider Item -->
                    <div class="owl-item">
                        <div class="home_slider_background"
                             style="background-image:url(<%=path%>/static/images/home_slider_1.jpg)"></div>
                        <div class="home_slider_content">
                            <div class="home_slider_content_inner">
                                <div class="home_slider_subtitle">促销价</div>
                                <div class="home_slider_title">新系列名</div>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- Home Slider Nav -->

                <div class="home_slider_next d-flex flex-column align-items-center justify-content-center"><img
                        src="<%=path%>/static/images/arrow_r.png" alt=""></div>

                <!-- Home Slider Dots -->

                <div class="home_slider_dots_container">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="home_slider_dots">
                                    <ul id="home_slider_custom_dots" class="home_slider_custom_dots">
                                        <li class="home_slider_custom_dot active">01.
                                            <div></div>
                                        </li>
                                        <li class="home_slider_custom_dot">02.
                                            <div></div>
                                        </li>
                                        <li class="home_slider_custom_dot">03.
                                            <div></div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Promo -->

        <div class="promo">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="section_title_container text-center">
                            <div class="section_subtitle">only the best</div>
                            <div class="section_title">促销价</div>
                        </div>
                    </div>
                </div>
                <div class="row promo_container">

                    <!-- Promo Item -->
                    <div class="col-lg-4 promo_col">
                        <div class="promo_item">
                            <div class="promo_image">
                                <img src="<%=path%>/static/images/promo_1.jpg" alt="">
                                <div class="promo_content promo_content_1">
                                    <div class="promo_title">-30% off</div>
                                    <div class="promo_subtitle">手提包</div>
                                </div>
                            </div>
                            <div class="promo_link"><a href="#">Shop Now</a></div>
                        </div>
                    </div>

                    <!-- Promo Item -->
                    <div class="col-lg-4 promo_col">
                        <div class="promo_item">
                            <div class="promo_image">
                                <img src="<%=path%>/static/images/promo_2.jpg" alt="">
                                <div class="promo_content promo_content_2">
                                    <div class="promo_title">-30% off</div>
                                    <div class="promo_subtitle">大衣 & 夹克</div>
                                </div>
                            </div>
                            <div class="promo_link"><a href="#">Shop Now</a></div>
                        </div>
                    </div>

                    <!-- Promo Item -->
                    <div class="col-lg-4 promo_col">
                        <div class="promo_item">
                            <div class="promo_image">
                                <img src="<%=path%>/static/images/promo_3.jpg" alt="">
                                <div class="promo_content promo_content_3">
                                    <div class="promo_title">-25% off</div>
                                    <div class="promo_subtitle">凉鞋</div>
                                </div>
                            </div>
                            <div class="promo_link"><a href="#">Shop Now</a></div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- New Arrivals -->

        <div class="arrivals">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="section_title_container text-center">
                            <div class="section_subtitle">only the best</div>
                            <div class="section_title">最新系列名</div>
                        </div>
                    </div>
                </div>
                <div class="row products_container">
                    <c:forEach items="${sessionScope.goodsList}" var="goods">
                        <!-- Product -->
                        <div class="col-lg-4 product_col">
                            <div class="product">
                                <div class="product_image">
                                    <img src="<%=path%>${goods.goodsImageUrl}" alt="">
                                </div>
                                <div class="rating rating_${goods.goodsScore}">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <div class="product_content clearfix">
                                    <div class="product_info">
                                        <div class="product_name"><a href="">${goods.goodsName}</a></div>
                                        <div class="product_price">￥${goods.goodsPrice}</div>
                                    </div>
                                    <div class="product_options">
                                        <a href="<%=path%>/goods/info/${goods.goodsId}.html"><div class="product_buy product_option"><img
                                                src="<%=path%>/static/images/shopping-bag-white.svg" alt=""></div></a>
                                        <div class="product_fav product_option"><img width="60%" src="<%=path%>/static/images/star.svg" alt=""></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <% request.getSession().removeAttribute("goodsList");%>

                </div>
            </div>
        </div>
        <!-- Extra -->

        <div class="extra clearfix">
            <div class="extra_promo extra_promo_1">
                <div class="extra_promo_image" style="background-image:url(<%=path%>/static/images/extra_1.jpg)"></div>
                <div class="extra_1_content d-flex flex-column align-items-center justify-content-center text-center">
                    <div class="extra_1_price">30%<span>off</span></div>
                    <div class="extra_1_title">鞋子</div>
                    <div class="extra_1_text">内容</div>
                    <div class="button extra_1_button"><a href="">查看</a></div>
                </div>
            </div>
            <div class="extra_promo extra_promo_2">
                <div class="extra_promo_image" style="background-image:url(<%=path%>/static/images/extra_2.jpg)"></div>
                <div class="extra_2_content d-flex flex-column align-items-center justify-content-center text-center">
                    <div class="extra_2_title">
                        <div class="extra_2_center">&</div>
                        <div class="extra_2_top">Mix</div>
                        <div class="extra_2_bottom">Match</div>
                    </div>
                    <div class="extra_2_text">内容</div>
                    <div class="button extra_2_button"><a href="">查看</a></div>
                </div>
            </div>
        </div>

        <!-- Gallery -->

        <div class="gallery">
            <div class="gallery_image" style="background-image:url(<%=path%>/static/images/gallery.jpg)"></div>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="gallery_title text-center">
                            <ul>
                                <li><a href="#">#关键字1</a></li>
                                <li><a href="#">#关键字2</a></li>
                                <li><a href="#">#关键字3</a></li>
                            </ul>
                        </div>
                        <div class="gallery_text text-center">文案</div>
                        <%--<div class="button gallery_button"><a href="#">submit</a></div>--%>
                    </div>
                </div>
            </div>
            <div class="gallery_slider_container">

                <!-- Gallery Slider -->
                <div class="owl-carousel owl-theme gallery_slider">

                    <!-- Gallery Item -->
                    <div class="owl-item gallery_item">
                        <a class="colorbox" href="<%=path%>/static/images/gallery_1.jpg">
                            <img src="<%=path%>/static/images/gallery_1.jpg" alt="">
                        </a>
                    </div>

                    <!-- Gallery Item -->
                    <div class="owl-item gallery_item">
                        <a class="colorbox" href="<%=path%>/static/images/gallery_2.jpg">
                            <img src="<%=path%>/static/images/gallery_2.jpg" alt="">
                        </a>
                    </div>

                    <!-- Gallery Item -->
                    <div class="owl-item gallery_item">
                        <a class="colorbox" href="<%=path%>/static/images/gallery_3.jpg">
                            <img src="<%=path%>/static/images/gallery_3.jpg" alt="">
                        </a>
                    </div>

                    <!-- Gallery Item -->
                    <div class="owl-item gallery_item">
                        <a class="colorbox" href="<%=path%>/static/images/gallery_4.jpg">
                            <img src="<%=path%>/static/images/gallery_4.jpg" alt="">
                        </a>
                    </div>

                    <!-- Gallery Item -->
                    <div class="owl-item gallery_item">
                        <a class="colorbox" href="<%=path%>/static/images/gallery_5.jpg">
                            <img src="<%=path%>/static/images/gallery_5.jpg" alt="">
                        </a>
                    </div>

                    <!-- Gallery Item -->
                    <div class="owl-item gallery_item">
                        <a class="colorbox" href="<%=path%>/static/images/gallery_6.jpg">
                            <img src="<%=path%>/static/images/gallery_6.jpg" alt="">
                        </a>
                    </div>

                </div>
            </div>
        </div>

        <!-- Testimonials -->

        <div class="testimonials">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="section_title_container text-center">
                            <div class="section_subtitle">only the best</div>
                            <div class="section_title">用户反馈</div>
                        </div>
                    </div>
                </div>
                <div class="row test_slider_container">
                    <div class="col">

                        <!-- Testimonials Slider -->
                        <div class="owl-carousel owl-theme test_slider text-center">

                            <c:forEach items="${sessionScope.assessList}" var="assess">
                                <!-- Testimonial Item -->
                                <div class="owl-item">
                                    <div class="test_text">${assess.goodsAssessContent}</div>
                                    <div class="test_content">
                                        <div class="test_image"><img src="<%=path%>${assess.avatarUrl}" alt="">
                                        </div>
                                        <div class="test_name">${assess.loginAccount}</div>
                                        <div class="test_title">客户</div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <% request.getSession().removeAttribute("assessList");%>

                    </div>
                </div>
            </div>
        </div>

        <!-- Newsletter -->
        <jsp:include page="module/news_letter.jsp"/>

        <!-- Footer -->
        <jsp:include page="module/footer.jsp"/>

    </div>

    <script src="<%=path%>/static/js/jquery-3.2.1.min.js"></script>
    <script src="<%=path%>/static/styles/bootstrap4/popper.js"></script>
    <script src="<%=path%>/static/styles/bootstrap4/bootstrap.min.js"></script>
    <script src="<%=path%>/static/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
    <script src="<%=path%>/static/plugins/easing/easing.js"></script>
    <script src="<%=path%>/static/plugins/parallax-js-master/parallax.min.js"></script>
    <script src="<%=path%>/static/plugins/colorbox/jquery.colorbox-min.js"></script>
    <script src="<%=path%>/static/js/custom.js"></script>
</body>
</html>