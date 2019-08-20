<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>我的订单</title>
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
                                <div class="home_title">我的订单</div>
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
                        <div class="cart_title">我的订单列表</div>
                        <p style="color: red;">
                            测试阶段，请使用测试的支付宝账号，不会影响自己的信息<br/>
                            支付账号:<span id="account_id" class="account">sgifly0398@sandbox.com</span>&nbsp;&nbsp;&nbsp;
                            <a data-clipboard-target="#account_id" onclick="copyAccount();return false;" href="#"
                               id="copyAccount" style="width: auto;height: auto;"
                               class="button_update cart_button_2 ml-md-auto">复制</a><br/>
                            支付密码:111111
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="cart_bar d-flex flex-row align-items-center justify-content-start">
                            <div class="cart_bar_title_name">订单号</div>
                            <div class="cart_bar_title_content ml-auto">
                                <div class="cart_bar_title_content_inner d-flex flex-row align-items-center justify-content-end">
                                    <div class="cart_bar_title_price">订单状态</div>
                                    <div class="cart_bar_title_price">订单总价</div>
                                    <div class="cart_bar_title_button" style="width: 125px;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="clt_products">
                            <ul>
                                <c:forEach items="${requestScope.orderList}" var="order">
                                    <li class=" cart_product d-flex flex-md-row flex-column align-items-md-center align-items-start justify-content-start">
                                        <!-- Product Image -->
                                        <div class="cart_product_image">
                                                ${order.orderNo}
                                        </div>
                                        <div class="cart_product_info ml-auto">
                                            <div class="cart_product_info_inner d-flex flex-row align-items-center justify-content-md-end justify-content-start">
                                                <!-- Product Price -->
                                                <div class="cart_product_price">
                                                        ${order.orderStatus == 0 ? "未支付" : order.orderStatus == 1 ? "待发货" : order.orderStatus == 2 ? "已取消" : order.orderStatus == 3 ? "配送中" : order.orderStatus == 4 ? "已收货" : ""}
                                                </div>
                                                <div class="cart_product_price">￥${order.totalMoney}</div>
                                                <!-- Product Cart Trash Button -->
                                                <div class="cart_product_button" style="width: auto;">
                                                    <a href="<%=path%>/order/info/${order.orderId}.do" name="orderInfo"
                                                       class="cart_product_remove">订单详情</a>/
                                                    <a href="<%=path%>/detail/info/${order.orderId}.do"
                                                       name="detailInfo"
                                                       class="cart_product_remove">内容详情</a>/<br/>
                                                    <c:if test="${order.orderStatus == 0}">
                                                        <a href="<%=path%>/order/delete/${order.orderId}.do"
                                                           name="orderDelete" class="cart_product_edit">取消</a>/
                                                        <a href="<%=path%>/order/goAlipay/${order.orderId}.do"
                                                           name="goAlipay" class="cart_product_edit" target="_blank">前往支付</a>
                                                    </c:if>
                                                    <c:if test="${order.orderStatus == 3}">
                                                        <a href="<%=path%>/order/confirm/${order.orderId}.do"
                                                           name="orderConfirm" class="cart_product_edit">确认收货</a>/
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="cart_control_bar d-flex flex-md-row flex-column align-items-start justify-content-start">
                            <a href="<%=path%>/customerLink/clothes/1/12.html" style="padding-top: 1%;"
                               class="button_update cart_button_2 ml-md-auto">继续浏览</a>
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
    <script src="<%=path%>/static/js/cart_custom.js"></script>
    <script type="text/javascript" src="<%=path%>/static/plugins/layui/layui.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/order_list.js"></script>
    <script type="text/javascript" src="<%=path%>/static/plugins/clipboard/clipboard.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("a[name='orderConfirm']").click(function () {
                var url = $(this).prop("href");
                layui.use('layer', function () {
                    var layer = layui.layer;
                    layer.confirm("是否确认收货？", {title: "确认收货"}, function (index) {
                        layer.close(index);
                        $.get(url, function (obj) {
                            if (obj.success) {
                                layer.msg("确认收货成功");
                            } else {
                                layer.msg("确认收货失败");
                            }
                            setTimeout(function () {
                                //刷新当前页面
                                window.location.reload();
                            }, 1000);
                        });
                    });
                });
                return false;
            });
            layui.use('layer', function () {
                var layer = layui.layer;
                <c:if test="${not empty sessionScope.dealMsg}">
                layer.msg("${sessionScope.dealMsg}");
                </c:if>
            });

        });

        /**
         * 复制支付宝账号
         */
        function copyAccount() {
            var $copyAccount = $("#copyAccount");
            var copyBtn = new ClipboardJS('.col .button_update');
            copyBtn.on("success", function (e) {
                $copyAccount.text("已复制");
            });
            copyBtn.on("error", function (e) {
                $copyAccount.text("复制失败");
            });
            return false;
        }
    </script>
    <%session.removeAttribute("dealMsg");%>
</body>
</html>