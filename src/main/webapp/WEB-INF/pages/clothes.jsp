<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Categories</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Wish shop project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/bootstrap4/bootstrap.min.css">
    <link href="<%=path%>/static/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/static/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.css" rel="stylesheet"
          type="text/css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/categories.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/categories_responsive.css">
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
                 data-image-src="<%=path%>/static/images/categories.jpg"
                 data-speed="0.8"></div>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="home_container">
                            <div class="home_content">
                                <div class="home_title">服装</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Products -->

        <div class="products">
            <div class="container">
                <div class="row">
                    <div class="col-12">

                        <!-- Sidebar Left -->

                        <div class="sidebar_left clearfix">
                            <!-- Best Sellers -->
                            <div class="sidebar_section">
                                <div class="sidebar_title">最多人购买</div>
                                <div class="sidebar_section_content bestsellers_content">
                                    <ul>
                                        <!-- Best Seller Item -->
                                        <li class="clearfix">
                                            <div class="best_image"><img src="<%=path%>/static/images/best_1.jpg"
                                                                         alt=""></div>
                                            <div class="best_content">
                                                <div class="best_title"><a href="">Blue dress with dots</a>
                                                </div>
                                                <div class="best_price">$45</div>
                                            </div>
                                            <div class="best_buy">+</div>
                                        </li>

                                        <!-- Best Seller Item -->
                                        <li class="clearfix">
                                            <div class="best_image"><img src="<%=path%>/static/images/best_2.jpg"
                                                                         alt=""></div>
                                            <div class="best_content">
                                                <div class="best_title"><a href="">White t-shirt</a></div>
                                                <div class="best_price">$45</div>
                                            </div>
                                            <div class="best_buy">+</div>
                                        </li>

                                        <!-- Best Seller Item -->
                                        <li class="clearfix">
                                            <div class="best_image"><img src="<%=path%>/static/images/best_3.jpg"
                                                                         alt=""></div>
                                            <div class="best_content">
                                                <div class="best_title"><a href="">Blue dress with dots</a>
                                                </div>
                                                <div class="best_price">$45</div>
                                            </div>
                                            <div class="best_buy">+</div>
                                        </li>

                                        <!-- Best Seller Item -->
                                        <li class="clearfix">
                                            <div class="best_image"><img src="<%=path%>/static/images/best_4.jpg"
                                                                         alt=""></div>
                                            <div class="best_content">
                                                <div class="best_title"><a href="">White t-shirt</a></div>
                                                <div class="best_price">$45</div>
                                            </div>
                                            <div class="best_buy">+</div>
                                        </li>

                                    </ul>
                                </div>
                            </div>

                            <!-- Size -->
                            <div class="sidebar_section sidebar_options">
                                <div class="sidebar_section_content">

                                    <!-- Option Item -->
                                    <div class="sidebar_option d-flex flex-row align-items-center justify-content-start">
                                        <div class="option_image"><img src="<%=path%>/static/images/option_1.png"
                                                                       alt=""></div>
                                        <div class="option_content">
                                            <div class="option_title">30天退换</div>
                                            <div class="option_subtitle">无条件退货</div>
                                        </div>
                                    </div>

                                    <!-- Option Item -->
                                    <div class="sidebar_option d-flex flex-row align-items-center justify-content-start">
                                        <div class="option_image"><img src="<%=path%>/static/images/option_2.png"
                                                                       alt=""></div>
                                        <div class="option_content">
                                            <div class="option_title">免费定制</div>
                                            <div class="option_subtitle">定制不加价</div>
                                        </div>
                                    </div>

                                    <!-- Option Item -->
                                    <div class="sidebar_option d-flex flex-row align-items-center justify-content-start">
                                        <div class="option_image"><img src="<%=path%>/static/images/option_3.png"
                                                                       alt=""></div>
                                        <div class="option_content">
                                            <div class="option_title">安全付款</div>
                                            <div class="option_subtitle">无需担心</div>
                                        </div>
                                    </div>

                                    <!-- Option Item -->
                                    <div class="sidebar_option d-flex flex-row align-items-center justify-content-start">
                                        <div class="option_image"><img src="<%=path%>/static/images/option_4.png"
                                                                       alt=""></div>
                                        <div class="option_content">
                                            <div class="option_title">全天候支持</div>
                                            <div class="option_subtitle">随时联系我们</div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>

                        <!-- <div class="current_page">Woman's Fashion</div> -->
                    </div>
                    <div class="col-12">
                        <div class="product_sorting clearfix">
                            <!-- <div class="view">
                                <div class="view_box box_view"><i class="fa fa-th-large" aria-hidden="true"></i></div>
                                <div class="view_box detail_view"><i class="fa fa-bars" aria-hidden="true"></i></div>
                            </div> -->
                            <div class="sorting">
                                <ul class="item_sorting">
                                    <li>
                                        <span class="sorting_text">Show all</span>
                                        <i class="fa fa-caret-down" aria-hidden="true"></i>
                                        <ul>
                                            <li class="product_sorting_btn"
                                                data-isotope-option='{ "sortBy": "original-order" }'>
                                                <span>Show All</span></li>
                                            <li class="product_sorting_btn" data-isotope-option='{ "sortBy": "price" }'>
                                                <span>Price</span></li>
                                            <li class="product_sorting_btn" data-isotope-option='{ "sortBy": "stars" }'>
                                                <span>Stars</span></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <span class="sorting_text">Show</span>
                                        <span class="num_sorting_text">12</span>
                                        <i class="fa fa-caret-down" aria-hidden="true"></i>
                                        <ul>
                                            <li class="num_sorting_btn"><span>3</span></li>
                                            <li class="num_sorting_btn"><span>6</span></li>
                                            <li class="num_sorting_btn"><span>12</span></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row products_container">
                    <div class="col">

                        <!-- Products -->

                        <div class="product_grid">
                            <c:forEach items="${sessionScope.goodsList}" var="goods">
                                <!-- Product -->
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
                                            <a href="<%=path%>/goods/info/${goods.goodsId}.html">
                                                <div class="product_buy product_option">
                                                    <img src="<%=path%>/static/images/shopping-bag-white.svg" alt="">
                                                </div>
                                            </a>
                                            <div class="product_fav product_option">
                                                <img width="60%" src="<%=path%>/static/images/star.svg" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <% request.getSession().removeAttribute("goodsList");%>
                        </div>

                    </div>
                </div>

            </div>

            <div class="row page_num_container">
                <div class="col text-center">
                    <ul class="page_nums">
                        <c:set var="count" value="${sessionScope.goodsCount}"/>
                        <c:set var="pages" value="${count%12==0?count/12:count/12+1}"/>
                        <c:forEach begin="1" end="${pages}" step="1" var="i">
                            <li><a href="<%=path%>/customerLink/clothes/${i}/12.html" style="font-size: large;">${i}</a></li>
                        </c:forEach>
                        <%--<%--%>
                            <%--int count = (int) request.getSession().getAttribute("goodsCount");--%>
                            <%--int pages = (count % 12 == 0 ? count / 12 : count / 12 + 1);--%>
                            <%--for (int i = 1; i <= pages; i++) {--%>
                        <%--%>--%>

                        <%--<li><a href="<%=path%>/customerLink/clothes/<%=i %>/12.html" style="font-size: large;"><%=i %>--%>
                        <%--</a></li>--%>

                        <%--<%--%>
                            <%--}--%>
                        <%--%>--%>
                    </ul>
                </div>
            </div>

        </div>

        <!-- Sidebar Right -->

        <div class="sidebar_right clearfix">

            <!-- Promo 1 -->
            <div class="sidebar_promo_1 sidebar_promo d-flex flex-column align-items-center justify-content-center">
                <div class="sidebar_promo_image"
                     style="background-image: url(<%=path%>/static/images/sidebar_promo_1.jpg)"></div>
                <div class="sidebar_promo_content text-center">
                    <div class="sidebar_promo_title">30%<span>off</span></div>
                    <div class="sidebar_promo_subtitle">On all shoes</div>
                    <div class="sidebar_promo_button"><a href="">check out</a></div>
                </div>
            </div>

            <!-- Promo 2 -->
            <div class="sidebar_promo_2 sidebar_promo">
                <div class="sidebar_promo_image"
                     style="background-image: url(<%=path%>/static/images/sidebar_promo_2.jpg)"></div>
                <div class="sidebar_promo_content text-center">
                    <div class="sidebar_promo_title">30%<span>off</span></div>
                    <div class="sidebar_promo_subtitle">On all shoes</div>
                    <div class="sidebar_promo_button"><a href="">check out</a></div>
                </div>
            </div>
        </div>

    </div>

    <!-- Extra -->


    <!-- Newsletter -->
    <jsp:include page="module/news_letter.jsp"/>

    <!-- Footer -->
    <jsp:include page="module/footer.jsp"/>

    </div>

    <script src="<%=path%>/static/js/jquery-3.2.1.min.js"></script>
    <script src="<%=path%>/static/styles/bootstrap4/popper.js"></script>
    <script src="<%=path%>/static/styles/bootstrap4/bootstrap.min.js"></script>
    <script src="<%=path%>/static/plugins/easing/easing.js"></script>
    <script src="<%=path%>/static/plugins/parallax-js-master/parallax.min.js"></script>
    <script src="<%=path%>/static/plugins/Isotope/isotope.pkgd.min.js"></script>
    <script src="<%=path%>/static/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.js"></script>
    <script src="<%=path%>/static/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
    <script src="<%=path%>/static/js/categories_custom.js"></script>
</body>
</html>