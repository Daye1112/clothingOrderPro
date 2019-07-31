<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Product</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Wish shop project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/bootstrap4/bootstrap.min.css">
    <link href="<%=path%>/static/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/product.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/product_responsive.css">
</head>
<body>

    <div class="super_container">

        <!-- Header -->
        <jsp:include page="module/top.jsp"/>

        <!-- Menu -->
        <jsp:include page="module/menu.jsp"/>

        <!-- Home -->
        <!-- <div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/product.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_container">
						<div class="home_content">
							<div class="home_title">Woman</div>
							<div class="breadcrumbs">
								<ul>
									<li><a href="index.html">Home</a></li>
									<li>Woman</li>
									<li>Swimsuits</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> -->

        <!-- Product -->

        <div class="product">
            <div class="container">
                <div class="row product_row">

                    <!-- Product Image -->
                    <div class="col-lg-7">
                        <div class="product_image">
                            <div class="product_image_large"><img src="<%=path%>${sessionScope.goods.goodsImageUrl}"
                                                                  alt=""></div>
                            <div class="product_image_thumbnails d-flex flex-row align-items-start justify-content-start">
                                <!-- <div class="product_image_thumbnail" style="background-image:url(images/product_image_1.jpg)" data-image="images/product_image_1.jpg"></div>
                                <div class="product_image_thumbnail" style="background-image:url(images/product_image_2.jpg)" data-image="images/product_image_2.jpg"></div>
                                <div class="product_image_thumbnail" style="background-image:url(images/product_image_4.jpg)" data-image="images/product_image_4.jpg"></div> -->
                            </div>
                        </div>
                    </div>

                    <!-- Product Content -->
                    <div class="col-lg-5">
                        <div class="product_content">
                            <div class="product_name">${sessionScope.goods.goodsName}</div>
                            <div class="product_price">￥${sessionScope.goods.goodsPrice}</div>
                            <div class="rating rating_${sessionScope.goods.goodsScore}" data-rating="4">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <!-- In Stock -->
                            <div class="in_stock_container">
                                <div class="in_stock in_stock_${sessionScope.goods.goodsStock > 0}"></div>
                                <span>库存</span>
                            </div>
                            <div class="product_text">
                                <p>${sessionScope.goods.goodsDesc}</p>
                            </div>
                            <form action="<%=path%>/cart/add.do" method="post" id="cartForm">
                                <!-- Product Quantity -->
                                <div class="product_quantity_container">
                                    <span>数量</span>
                                    <div class="product_quantity clearfix">
                                        <input name="cartGoodsNum" id="quantity_input" type="text" pattern="[0-9]*"
                                               value="1">
                                        <div class="quantity_buttons">
                                            <div id="quantity_inc_button" class="quantity_inc quantity_control"><i
                                                    class="fa fa-caret-up" aria-hidden="true"></i></div>
                                            <div id="quantity_dec_button" class="quantity_dec quantity_control"><i
                                                    class="fa fa-caret-down" aria-hidden="true"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Product Size -->
                                <div class="product_size_container">
                                    <span>Size</span>
                                    <div class="product_size">
                                        <ul class="d-flex flex-row align-items-start justify-content-start">
                                            <li>
                                                <input type="radio" id="radio_1" name="cartGoodsSize"
                                                       class="regular_radio radio_1" value="XS">
                                                <label for="radio_1">XS</label>
                                            </li>
                                            <li>
                                                <input type="radio" id="radio_2" name="cartGoodsSize"
                                                       class="regular_radio radio_2" value="S" checked>
                                                <label for="radio_2">S</label>
                                            </li>
                                            <li>
                                                <input type="radio" id="radio_3" name="cartGoodsSize"
                                                       class="regular_radio radio_3" value="M">
                                                <label for="radio_3">M</label>
                                            </li>
                                            <li>
                                                <input type="radio" id="radio_4" name="cartGoodsSize"
                                                       class="regular_radio radio_4" value="L">
                                                <label for="radio_4">L</label>
                                            </li>
                                            <li>
                                                <input type="radio" id="radio_5" name="cartGoodsSize"
                                                       class="regular_radio radio_5" value="XL">
                                                <label for="radio_5">XL</label>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="button cart_button"><a id="cartBtn" href="#">添加购物车</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a id="cltBtn" href="#">添加收藏</a>
                                    </div>
                                </div>
                                
                                </div>
                                
                                <input type="hidden" name="goodsId" value="${sessionScope.goods.goodsId}"/>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Reviews -->

                <div class="row">
                    <div class="col">
                        <div class="reviews">
                            <div class="reviews_title">评价</div>
                            <div class="reviews_container">
                                <ul>
                                    <c:forEach items="${sessionScope.goodsAssessList}" var="assess">
                                        <!-- Review -->
                                        <li class=" review clearfix">
                                            <div class="review_image"><img src="<%=path%>${assess.avatarUrl}" alt="">
                                            </div>
                                            <div class="review_content">
                                                <div class="review_name"><a href="#">${assess.loginAccount}</a></div>
                                                    <%--<div class="review_date">Nov 29, 2017</div>--%>
                                                <div class="rating rating_${assess.goodsAssessScore} review_rating"
                                                     data-rating="4">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="review_text">
                                                    <p>${assess.goodsAssessContent}</p>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <%request.getSession().removeAttribute("goodsAssessList");%>
                <!-- Leave a Review -->

                <div class="row">
                    <div class="col">
                        <div class="review_form_container">
                            <div class="review_form_title">评价商品</div>
                            <div class="review_form_content">
                                <form method="post" action="<%=path%>/assess/publish.do" id="review_form"
                                      class="review_form">
                                    <div class="d-flex flex-md-row flex-column align-items-start justify-content-between">
                                        <div id="fafa" class="rating rating_4 review_rating" data-rating="4">
                                            <i id="fa1" class="fa fa-star"></i>
                                            <i id="fa2" class="fa fa-star"></i>
                                            <i id="fa3" class="fa fa-star"></i>
                                            <i id="fa4" class="fa fa-star"></i>
                                            <i id="fa5" class="fa fa-star"></i>
                                        </div>
                                    </div>
                                    <input id="assessScore" type="hidden" name="goodsAssessScore">
                                    <input type="hidden" name="goodsId" value="${sessionScope.goods.goodsId}">
                                    <textarea class="review_form_text" name="goodsAssessContent"
                                              placeholder="商品描述"></textarea>
                                    <button id="assessBtn" type="submit" class="review_form_button">评价</button>
                                    ${sessionScope.dealMsg}
                                </form>
                            </div>
                        </div>
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
    <script src="<%=path%>/static/plugins/easing/easing.js"></script>
    <script src="<%=path%>/static/plugins/parallax-js-master/parallax.min.js"></script>
    <script src="<%=path%>/static/js/product_custom.js"></script>
    <script type="text/javascript" src="<%=path%>/static/plugins/layui/layui.js"></script>
    <script type="text/javascript">
    	var value="";
        $(function () {
            var $fafa = $("#fafa");
            $("#fa1").click(function () {
                $fafa.attr("class", "rating rating_1 review_rating");
                $fafa.attr("data-rating", "1");
            });
            $("#fa2").click(function () {
                $fafa.attr("class", "rating rating_2 review_rating");
                $fafa.attr("data-rating", "2");
            });
            $("#fa3").click(function () {
                $fafa.attr("class", "rating rating_3 review_rating");
                $fafa.attr("data-rating", "3");
            });
            $("#fa4").click(function () {
                $fafa.attr("class", "rating rating_4 review_rating");
                $fafa.attr("data-rating", "4");
            });
            $("#fa5").click(function () {
                $fafa.attr("class", "rating rating_5 review_rating");
                $fafa.attr("data-rating", "5");
            });
            $("#assessBtn").click(function () {
                var $dataRating = $fafa.attr("data-rating");
                $("#assessScore").val($dataRating);
                $("#review_form").submit();
                return false;
            });
        });
        layui.use('layer', function () {
            var layer = layui.layer;
            <c:if test="${not empty sessionScope.dealMsg}">
            layer.msg("${sessionScope.dealMsg}");
            </c:if>
        });
        $("#cartBtn").click(function () {
            $("#cartForm").submit();
            return false;
        });
        
        $("#cltBtn").click(function () {
        	
            window.location.href="<%=path%>/clt/add.do?goodsId="+"${goods.goodsId }"+"&cltGoodsSize="+value;
        });
        
        $('input[name="cartGoodsSize"]').click(function(){
        	value= $('input[name="cartGoodsSize"]:checked').val();  
        })
        
    </script>
    <%request.getSession().removeAttribute("dealMsg");%>
    <%request.getSession().removeAttribute("goods");%>
</body>
</html>