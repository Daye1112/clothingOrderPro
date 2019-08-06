<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>确认订单</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Wish shop project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/bootstrap4/bootstrap.min.css">
    <link href="<%=path%>/static/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/checkout.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/checkout_responsive.css">
</head>
<body>

    <div class="super_container">

        <!-- Header -->
        <jsp:include page="module/top.jsp"/>

        <!-- Menu -->
        <jsp:include page="module/menu.jsp"/>

        <!-- Home -->
        <div class="home">
            <div class="home_background parallax-window" data-parallax="scroll" data-image-src="<%=path%>/static/images/categories.jpg" data-speed="0.8"></div>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="home_container">
                            <div class="home_content">
                                <div class="home_title">订单确认</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Checkout -->

        <div class="checkout">
            <div class="container">
                <div class="row">

                    <!-- Billing Details -->
                    <div class="col-lg-6">
                        <div class="billing">
                            <div class="checkout_title">收件人信息</div>
                            <div class="checkout_form_container">
                                <form action="<%=path%>/order/submit.do" id="checkout_form" method="post">
                                    <div class="d-flex flex-lg-row flex-column align-items-start justify-content-between">
                                        <input name="userRealName" type="text" class="checkout_input checkout_input_50" placeholder="姓名" required="required">
                                        <input name="userPhone" type="text" class="checkout_input checkout_input_50" placeholder="手机号" required="required">
                                        <input name="goodsMoney" id="goodsMoney" type="hidden"/>
                                        <input name="totalMoney" id="totalMoney" type="hidden"/>
                                        <input name="deliverMoney" id="deliverMoney" type="hidden"/>
                                    </div>
                                    <input name="orderAddress" type="text" class="checkout_input" placeholder="地址">
                                    <textarea name="orderRemark" id="checkout_comment" class="checkout_comment" placeholder="如需定制，请填写具体的定制信息"></textarea>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Cart Details -->
                    <div class="col-lg-6">
                        <div class="cart_details">
                            <div class="checkout_title">订单信息</div>
                            <div class="cart_total">
                                <ul>
                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                        <div class="cart_total_title">商品</div>
                                        <div class="cart_total_price ml-auto">尺寸</div>
                                        <div class="cart_total_price ml-auto">总价</div>
                                    </li>
                                    <c:set var="allTotalPrice" value="0"/>
                                    <c:forEach items="${requestScope.cartList}" var="cart">
                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                        <div class="cart_total_title">${cart.goodsName} × ${cart.cartGoodsNum}</div>
                                        <div class="cart_total_price ml-auto">${cart.cartGoodsSize}</div>
                                        <div class="cart_total_price ml-auto">￥${cart.totalPrice}</div>
                                        <c:set var="allTotalPrice" value="${allTotalPrice + cart.totalPrice}"/>
                                    </li>
                                    </c:forEach>
                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                        <div class="cart_total_title">运费</div>
                                        <div class="cart_total_price ml-auto">￥5.00</div>
                                    </li>
                                    <li class="d-flex flex-row align-items-start justify-content-start total_row">
                                        <div class="cart_total_title">总计</div>
                                        <div class="cart_total_price ml-auto">￥${allTotalPrice + 5}</div>
                                    </li>
                                </ul>
                            </div>
                            <div class="payment_options">
                                <button id="subBtn" class="cart_total_button">提交订单</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Newsletter -->
        <jsp:include page="module/news_letter_2.jsp"/>
        <!-- Footer -->
        <jsp:include page="module/footer.jsp"/>
    </div>

    <script src="<%=path%>/static/js/jquery-3.2.1.min.js"></script>
    <script src="<%=path%>/static/styles/bootstrap4/popper.js"></script>
    <script src="<%=path%>/static/styles/bootstrap4/bootstrap.min.js"></script>
    <script src="<%=path%>/static/plugins/easing/easing.js"></script>
    <script src="<%=path%>/static/plugins/parallax-js-master/parallax.min.js"></script>
    <script src="<%=path%>/static/js/checkout_custom.js"></script>
    <script type="text/javascript" src="<%=path%>/static/plugins/layui/layui.js"></script>
    <script type="text/javascript">
        $(function () {
            layui.use('layer', function () {
                var layer = layui.layer;
                <c:if test="${not empty sessionScope.dealMsg}">
                layer.msg("${sessionScope.dealMsg}");
                </c:if>
            });
            $("#subBtn").click(function () {
                var $totalMoney = ${allTotalPrice};
                var $deliverMoney = 5;
                var $goodsMoney = $totalMoney - $deliverMoney;
                $("#totalMoney").val($totalMoney);
                $("#deliverMoney").val($deliverMoney);
                $("#goodsMoney").val($goodsMoney);
                $("#checkout_form").submit();
            });
        })
    </script>
    <%session.removeAttribute("dealMsg");%>
</body>
</html>