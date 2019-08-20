<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>订单管理</title>

    <!-- Bootstrap -->
    <link href="<%=path%>/static/adminContent/vendors/bootstrap/dist/css/bootstrap.min.css"
          rel="stylesheet"/>
    <!-- Font Awesome -->
    <link href="<%=path%>/static/adminContent/vendors/font-awesome/css/font-awesome.min.css"
          rel="stylesheet"/>
    <!-- NProgress -->
    <link href="<%=path%>/static/adminContent/vendors/nprogress/nprogress.css" rel="stylesheet"/>
    <!-- bootstrap-progressbar -->
    <link href="<%=path%>/static/adminContent/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
          rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="<%=path%>/static/adminContent/vendors/bootstrap-daterangepicker/daterangepicker.css"
          rel="stylesheet"/>

    <!-- Custom Theme Style -->
    <link href="<%=path%>/static/adminContent/vendors/build/css/custom.min.css" rel="stylesheet"/>
    <link href="<%=path%>/static/adminContent/vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="<%=path%>/static/adminContent/build/css/custom.min.css" rel="stylesheet">
</head>
<body class="nav-md">
    <div class="container body">
        <div class="main_container">
            <jsp:include page="module/home_module.jsp"/>
            <!-- /top navigation -->

            <!-- page content -->
            <div class="right_col" role="main">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>用户信息</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>订单ID</th>
                                        <th>用户ID</th>
                                        <th>用户名</th>
                                        <th>订单号</th>
                                        <th>总价</th>
                                        <th>状态</th>
                                        <th>详情/更新</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${requestScope.orderList}" var="order">
                                        <tr>
                                            <td scope="row">${order.orderId}</td>
                                            <td>${order.userId}</td>
                                            <td>${order.userRealName}</td>
                                            <td>${order.orderNo}</td>
                                            <td>${order.totalMoney}</td>
                                            <td>${order.orderStatus == "0" ? "未支付" : order.orderStatus == "1" ? "待发货": order.orderStatus == "2" ? "用户取消" : order.orderStatus == "3" ? "配送中" : order.orderStatus == "4" ? "用户确认收货": ""}</td>
                                            <td>
                                                <a name="seeDetail" style="color: blue;"
                                                   href="/${order.orderId}">详情/更新</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="col-sm-7">
                                    <div class="dataTables_paginate paging_simple_numbers">
                                        <ul class="pagination">
                                            <li class="paginate_button previous ${requestScope.pageNow <= 1 ? "disabled" : ""}">
                                                <a href="<c:if test="${requestScope.pageNow > 1}"><%=path%>/lk/admin/order/list/${requestScope.pageNow - 1}/10.html</c:if><c:if test="${requestScope.pageNow <= 1}">#</c:if>">
                                                    Previous
                                                </a>
                                            </li>
                                            <c:forEach begin="1" end="${requestScope.pageNum}" step="1" var="i">
                                                <li class="paginate_button <c:if test="${requestScope.pageNow == i}">active</c:if>">
                                                    <a href="<%=path%>/lk/admin/order/list/${i}/10.html ">${i}</a>
                                                </li>
                                            </c:forEach>
                                            <li class="paginate_button next ${requestScope.pageNow >= requestScope.pageNum ? "disabled" : ""}">
                                                <a href="<c:if test="${requestScope.pageNow < requestScope.pageNum}"><%=path%>/lk/admin/order/list/${requestScope.pageNow + 1}/10.html</c:if><c:if test="${requestScope.pageNow >= requestScope.pageNum}">#</c:if>">
                                                    Next
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="row" id="detail">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>
                                    订单详情
                                </h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content" style="text-align: center">
                                <p class="lead">购买商品</p>
                                <div class="table-responsive">
                                    <table class="table">
                                        <tbody id="goodsDetail">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="x_content" style="text-align: center">
                                <p class="lead">订单详情</p>
                                <div class="table-responsive">
                                    <table class="table">
                                        <tbody id="orderDetail">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>
                                    更新订单状态
                                </h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="form-horizontal form-label-left">
                                    <p>请在此处填写当前订单状态</p>
                                    <span class="section">订单<span id="orderNo"></span>的信息</span>
                                    <form action="<%=path%>/order/update.do" method="post" id="modifyOrder">
                                        <input type="hidden" disabled="disabled" name="orderId"
                                               class="form-control col-md-7 col-xs-12"/>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                订单状态: <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="radio" name="orderStatus" id="status_0"
                                                       value="0" checked/>未支付&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="radio" name="orderStatus" id="status_1"
                                                       value="1"/>待发货&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="radio" name="orderStatus" id="status_2"
                                                       value="2"/>用户取消&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="radio" name="orderStatus" id="status_3"
                                                       value="3"/>配送中&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="radio" name="orderStatus" id="status_4"
                                                       value="4"/>确认收款
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                收货地址:<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input name="orderAddress" class="form-control col-md-7 col-xs-12"/>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                收件人:
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input name="userRealName" class="form-control col-md-7 col-xs-12"/>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                手机号码:
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input name="userPhone" class="form-control col-md-7 col-xs-12"/>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                快递号:
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input name="expressNo" class="form-control col-md-7 col-xs-12"/>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                快递公司:
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input name="expressName" class="form-control col-md-7 col-xs-12"/>
                                            </div>
                                        </div>
                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-md-offset-3">
                                                <input type="submit" id="subBtn" class="btn btn-primary" value="提交"/>
                                                <input type="reset" class="btn btn-primary" value="重置"/>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /page content -->
        </div>
    </div>
    <!-- jQuery -->
    <script src="<%=path%>/static/adminContent/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="<%=path%>/static/adminContent/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="<%=path%>/static/adminContent/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="<%=path%>/static/adminContent/vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="<%=path%>/static/adminContent/vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- jQuery Sparklines -->
    <script src="<%=path%>/static/adminContent/vendors/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
    <!-- morris.js -->
    <script src="<%=path%>/static/adminContent/vendors/raphael/raphael.min.js"></script>
    <script src="<%=path%>/static/adminContent/vendors/morris.js/morris.min.js"></script>
    <!-- gauge.js -->
    <script src="<%=path%>/static/adminContent/vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="<%=path%>/static/adminContent/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- Skycons -->
    <script src="<%=path%>/static/adminContent/vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="<%=path%>/static/adminContent/vendors/Flot/jquery.flot.js"></script>
    <script src="<%=path%>/static/adminContent/vendors/Flot/jquery.flot.pie.js"></script>
    <script src="<%=path%>/static/adminContent/vendors/Flot/jquery.flot.time.js"></script>
    <script src="<%=path%>/static/adminContent/vendors/Flot/jquery.flot.stack.js"></script>
    <!-- <script src="<%=path%>/static/adminContent/vendors/Flot/jquery.flot.resize.js"></script>  -->
    <!-- Flot plugins -->
    <script src="<%=path%>/static/adminContent/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="<%=path%>/static/adminContent/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="<%=path%>/static/adminContent/vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="<%=path%>/static/adminContent/vendors/DateJS/build/date.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="<%=path%>/static/adminContent/vendors/moment/min/moment.min.js"></script>
    <script src="<%=path%>/static/adminContent/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- iCheck -->
    <script src="<%=path%>/static/adminContent/vendors/iCheck/icheck.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="<%=path%>/static/adminContent/build/js/custom.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="<%=path%>/static/adminContent/vendors/build/js/custom.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/plugins/layui/layui.js"></script>
    <script type="text/javascript">
        $(function () {
            $("a[name='seeDetail']").click(function () {
                var href = $(this).prop("href");
                href = href.substring(href.length - 1, href.length);
                var goodsDetailUrl = "<%=path%>" + "/detail/info/" + href + ".do";
                var orderDetailUrl = "<%=path%>" + "/order/info/" + href + ".do";
                $.get(goodsDetailUrl, function (obj) {
                    if (obj.success) {
                        var $goodsDetail = $("#goodsDetail");
                        $goodsDetail.empty();
                        var data = obj.data;
                        for (var i = 0; i < data.length; i++) {
                            var goodsHtml = '<tr>\n' +
                                ' <th>' + data[i].goodsName + '(' + data[i].goodsSize + ')×' + data[i].goodsNum + '</th>\n' +
                                '<td>￥' + data[i].totalPrice + '</td>\n' +
                                ' </tr>';
                            $goodsDetail.append(goodsHtml);
                        }
                    } else {
                        layui.use('layer', function () {
                            var layer = layui.layer;
                            layer.msg(obj.message);
                        });
                    }
                });
                $.get(orderDetailUrl, function (obj) {
                    if (obj.success) {
                        var $orderDetail = $("#orderDetail");
                        $orderDetail.empty();
                        var data = obj.data;
                        var isInvoice = data.isinvoice === 1;
                        var orderStatus = data.orderStatus === 3 || data.orderStatus === 4;
                        var orderDetailHtml = '<tr>\n' +
                            ' <th>订单号</th>\n' +
                            '<td>' + data.orderNo + '</td>\n' +
                            ' </tr>' +
                            '<tr>\n' +
                            ' <th>商品总额</th>\n' +
                            '<td>' + data.goodsMoney + '</td>\n' +
                            ' </tr>' +
                            ' <th>订单总金额</th>\n' +
                            '<td>' + data.totalMoney + '</td>\n' +
                            ' </tr>' +
                            '<tr>\n' +
                            ' <th>订单状态</th>\n' +
                            '<td>' + (data.orderStatus === 0 ? "未支付" : data.orderStatus === 1 ? "待发货" : data.orderStatus === 2 ? "已取消" : data.orderStatus === 3 ? "配送中" : data.orderStatus === 4 ? "已收货" : "") + '</td>\n' +
                            ' </tr>' +
                            '<tr>\n' +
                            ' <th>运费</th>\n' +
                            '<td>' + data.deliverMoney + '</td>\n' +
                            ' </tr>' +
                            '<tr>\n' +
                            ' <th>是否需要发票</th>\n' +
                            '<td>' + (data.isinvoice === 1 ? "是" : "否") + '</td>\n' +
                            ' </tr>' +
                            '<tr>\n' +
                            ' <th>收货地址</th>\n' +
                            '<td>' + data.orderAddress + '</td>\n' +
                            ' </tr>' +
                            '<tr>\n' +
                            ' <th>收件人</th>\n' +
                            '<td>' + data.userRealName + '</td>\n' +
                            ' </tr>' +
                            '<tr>\n' +
                            ' <th>订单备注</th>\n' +
                            '<td>' + data.orderRemark + '</td>\n' +
                            ' </tr>' +
                            '<tr>\n' +
                            ' <th>下单时间</th>\n' +
                            '<td>' + data.createTime + '</td>\n' +
                            ' </tr>' +
                            (orderStatus ?
                                    '<tr>\n' +
                                    ' <th>收货时间</th>\n' +
                                    '<td>' + data.receiveTime + '</td>\n' +
                                    ' </tr>' +
                                    '<tr>\n' +
                                    ' <th>快递号</th>\n' +
                                    '<td>' + data.expressNo + '</td>\n' +
                                    ' </tr>' +
                                    '<tr>\n' +
                                    ' <th>发货时间</th>\n' +
                                    '<td>' + data.deliveryTime + '</td>\n' +
                                    ' </tr>' +
                                    '<tr>\n' +
                                    ' <th>快递公司</th>\n' +
                                    '<td>' + data.expressName + '</td>\n' +
                                    ' </tr>' : ''
                            ) +
                            (isInvoice ?
                                    '<tr>\n' +
                                    ' <th>发票抬头</th>\n' +
                                    '<td>' + data.invoiceClient + '</td>\n' +
                                    ' </tr>' +
                                    '<tr>\n' +
                                    ' <th>发票税号</th>\n' +
                                    '<td>' + data.taxNum + '</td>\n' +
                                    ' </tr>' : ''
                            );
                        $orderDetail.append(orderDetailHtml);
                        //填入form表单
                        $("input[name='orderId']").val(data.orderId);
                        $("input[name='orderStatus']").removeProp("checked");
                        $("input[name='orderStatus'][value='" + data.orderStatus + "']").prop("checked", true);
                        $("input[name='orderAddress']").val(data.orderAddress);
                        $("input[name='userRealName']").val(data.userRealName);
                        $("input[name='userPhone']").val(data.userPhone);
                        $("input[name='expressNo']").val(data.expressNo);
                        $("input[name='expressName']").val(data.expressName);
                    } else {
                        layui.use('layer', function () {
                            var layer = layui.layer;
                            layer.msg(obj.message);
                        });
                    }
                });
                $("html,body").animate({scrollTop: $("#detail").offset().top}, 1000);
                return false;
            });
            $("#subBtn").click(function () {
                var url = $("#modifyOrder").prop("action");
                var orderId = $("input[name='orderId']").val();
                var orderStatus = $("input[name='orderStatus']:checked").val();
                var orderAddress = $("input[name='orderAddress']").val();
                var userRealName = $("input[name='userRealName']").val();
                var userPhone = $("input[name='userPhone']").val();
                var expressNo = $("input[name='expressNo']").val();
                var expressName = $("input[name='expressName']").val();
                var param = {
                    "orderId": orderId, "orderStatus": orderStatus,
                    "orderAddress": orderAddress, "userRealName": userRealName,
                    "userPhone": userPhone, "expressNo": expressNo,
                    "expressName": expressName
                };
                $.post(url, param, function (obj) {
                    if (obj.success) {
                        layui.use('layer', function () {
                            var layer = layui.layer;
                            layer.msg("订单更新成功");
                        });
                    } else {
                        layui.use('layer', function () {
                            var layer = layui.layer;
                            layer.msg(obj.message);
                        });
                    }
                    $("input[name='orderId']").val("");
                    setTimeout(function () {
                        //刷新当前页面
                        window.location.reload();
                    }, 1000);
                });
                return false;
            });
            // $("a[name='editUser']").click(function () {
            //     var href = $(this).attr("href");
            //     $.get(href, function (obj) {
            //         if (obj.success) {
            //             var data = obj.data;
            //             var userId = data.userId;
            //             var loginAccount = data.loginAccount;
            //             var password = data.password;
            //             var idCard = data.idCard;
            //             var phone = data.phone;
            //             var email = data.email;
            //             var sex = data.sex;
            //             var manage = data.manage;
            //             $("input[name='userId']").val(userId);
            //             $("input[name='loginAccount']").val(loginAccount);
            //             $("input[name='password']").val(password);
            //             $("input[name='idCard']").val(idCard);
            //             $("input[name='phone']").val(phone);
            //             $("input[name='email']").val(email);
            //             if (sex === "男") {
            //                 $("#sexF").removeProp("checked");
            //                 $("#sexM").prop("checked", true);
            //             } else {
            //                 $("#sexM").removeProp("checked");
            //                 $("#sexF").prop("checked", true);
            //             }
            //             if (manage) {
            //                 $("#manageNo").removeProp("checked");
            //                 $("#manageYes").prop("checked", true);
            //             } else {
            //                 $("#manageYes").removeProp("checked");
            //                 $("#manageNo").prop("checked", true);
            //             }
            //         } else {
            //             layui.use('layer', function () {
            //                 var layer = layui.layer;
            //                 layer.msg(obj.message);
            //             });
            //         }
            //     });
            //     $("html,body").animate({scrollTop: $("#modifyUser").offset().top}, 1000);
            //     return false;
            // });
            // $("#subBtn").click(function () {
            //     var url = $("#modifyUser").prop("action");
            //     var userId = $("input[name='userId']").val();
            //     var loginAccount = $("input[name='loginAccount']").val();
            //     var password = $("input[name='password']").val();
            //     var idCard = $("input[name='idCard']").val();
            //     var phone = $("input[name='phone']").val();
            //     var email = $("input[name='email']").val();
            //     var sex = $("input[name='sex']:checked").val();
            //     var manage = $("input[name='manage']:checked").val();
            //     var params = {
            //         "userId": userId, "loginAccount": loginAccount,
            //         "password": password, "idCard": idCard,
            //         "phone": phone, "email": email,
            //         "sex": sex, "manage": manage
            //     };
            //     $.post(url, params, function (obj) {
            //         layui.use('layer', function () {
            //             var layer = layui.layer;
            //             if (obj.success) {
            //                 layer.msg("修改成功");
            //             } else {
            //                 layer.msg("修改失败");
            //             }
            //         });
            //         setTimeout(function () {
            //             //刷新当前页面
            //             window.location.reload();
            //         }, 1000);
            //     });
            //     return false;
            // });

        })
    </script>
    <script type="text/javascript">
        $("#menu_toggle").click(function () {
            var css = $("body").attr("class");
            if (css === "nav-md") {
                $("body").attr("class", "nav-sm");
                console.log($("body").attr("class") + "->" + "nav-md");
            } else {
                $("body").attr("class", "nav-md");
            }
        });
    </script>
</body>
</html>

