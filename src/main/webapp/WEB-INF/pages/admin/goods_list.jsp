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
    <title>商品管理</title>

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
                                <h2>商品信息</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <table class="table table-striped" style="table-layout:fixed;">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>商品编号</th>
                                        <th>商品名</th>
                                        <th>价格</th>
                                        <th>总数</th>
                                        <th>库存</th>
                                        <th>描述</th>
                                        <th>评分</th>
                                        <th>访问数</th>
                                        <th>删除</th>
                                        <th>修改</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${requestScope.goodsList}" var="goods">
                                        <tr>
                                            <td scope="row">${goods.goodsId}</td>
                                            <td>${goods.goodsNo}</td>
                                            <td>${goods.goodsName}</td>
                                            <td>${goods.goodsPrice}</td>
                                            <td>${goods.goodsNum}</td>
                                            <td>${goods.goodsStock}</td>
                                            <td style="word-wrap:break-word;">${goods.goodsDesc}</td>
                                            <td>${goods.goodsScore}</td>
                                            <td>${goods.visitNum}</td>
                                            <td>
                                                <a name="delGoods" style="color: blue;"
                                                   href="<%=path%>/goods/del/${goods.goodsId}.do">删除</a>
                                            </td>
                                            <td>
                                                <a name="editGoods" style="color: blue;"
                                                   href="<%=path%>/goods/j/info/${goods.goodsId}.do">修改</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="col-sm-7">
                                    <div class="dataTables_paginate paging_simple_numbers">
                                        <ul class="pagination">
                                            <li class="paginate_button previous ${requestScope.pageNow <= 1 ? "disabled" : ""}">
                                                <a href="<c:if test="${requestScope.pageNow > 1}"><%=path%>/lk/admin/goods/list/${requestScope.pageNow - 1}/10.html</c:if><c:if test="${requestScope.pageNow <= 1}">#</c:if>">
                                                    Previous
                                                </a>
                                            </li>
                                            <c:forEach begin="1" end="${requestScope.pageNum}" step="1" var="i">
                                                <li class="paginate_button <c:if test="${requestScope.pageNow == i}">active</c:if>">
                                                    <a href="<%=path%>/lk/admin/goods/list/${i}/10.html ">${i}</a>
                                                </li>
                                            </c:forEach>
                                            <li class="paginate_button next ${requestScope.pageNow >= requestScope.pageNum ? "disabled" : ""}">
                                                <a href="<c:if test="${requestScope.pageNow < requestScope.pageNum}"><%=path%>/lk/admin/goods/list/${requestScope.pageNow + 1}/10.html</c:if><c:if test="${requestScope.pageNow >= requestScope.pageNum}">#</c:if>">
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
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>
                                    更新商品信息
                                </h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="form-horizontal form-label-left">
                                    <p>请在此处填写商品信息</p>
                                    <span class="section">商品的信息</span>
                                    <form action="<%=path%>/goods/modify.do" method="post" enctype="multipart/form-data"
                                          id="modifyGoods">
                                        <input type="hidden" hidden="hidden" name="goodsId"
                                               class="form-control col-md-7 col-xs-12"/>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                商品名:<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input name="goodsName" class="form-control col-md-7 col-xs-12"/>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                商品图片:<span class="required">*(建议290*434)</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input accept="image/jpg,image/jpeg,image/png" type="file"
                                                       name="fileName"
                                                       class="form-control col-md-7 col-xs-12" onchange="imgChoose();"/>
                                            </div>
                                            <input name="imgBase" hidden="hidden" type="text" id="base64url"/>
                                            <input name="imgName" hidden="hidden" type="text" id="imgName"/>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                商品价格:<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input name="goodsPrice" class="form-control col-md-7 col-xs-12"/>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                商品数量:<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input name="goodsNum" class="form-control col-md-7 col-xs-12"/>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                商品库存:<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input name="goodsStock" class="form-control col-md-7 col-xs-12"/>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                商品描述:
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input name="goodsDesc" class="form-control col-md-7 col-xs-12"/>
                                            </div>
                                        </div>
                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-md-offset-3">
                                                <input type="submit" id="subBtn" class="btn btn-primary" value="提交"/>
                                                <input type="reset" class="btn btn-primary" value="重置"/>
                                            </div>
                                        </div>
                                        <div style="text-align: center;">
                                            <img width="290px" height="434.15px" alt="预览" id="seeImg" src="">
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
        $("#menu_toggle").click(function () {
            var css = $("body").attr("class");
            if(css === "nav-md"){
                $("body").attr("class", "nav-sm");
                console.log($("body").attr("class") + "->" + "nav-md");
            } else{
                $("body").attr("class", "nav-md");
            }
        });
    </script>
    <script type="text/javascript">
        function imgChoose() {
            var imgName = $("input[name='fileName']")[0].files[0].name;
            var imgBase = null;
            var fileReader = new FileReader();
            var file = $("input[name='fileName']")[0].files[0];
            var imgUrlBase64;
            if (file) {
                imgUrlBase64 = fileReader.readAsDataURL(file);
                fileReader.onload = function (ev) {
                    imgBase = fileReader.result;
                    $("#base64url").val(imgBase);
                    $("#imgName").val(imgName);
                    $("#seeImg").css('display', '').prop("src", imgBase);
                };
            }
        }

        $(function () {
            layui.use('layer', function () {
                var layer = layui.layer;
                <c:if test="${not empty sessionScope.dealMsg}">
                layer.msg("${sessionScope.dealMsg}");
                </c:if>
            });
            $("#seeImg").css('display', 'none');
            $("a[name='delGoods']").click(function () {
                var url = $(this).attr("href");
                layui.use('layer', function () {
                    var layer = layui.layer;
                    layer.confirm("是否确认删除该商品？", {title: "确认删除"}, function (index) {
                        layer.close(index);
                        $.get(url, function (obj) {

                            if (obj.success) {
                                layer.msg("删除成功");
                            } else {
                                layer.msg("删除失败");
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
            $("a[name='editGoods']").click(function () {
                var href = $(this).attr("href");
                $.get(href, function (obj) {
                    if (obj.success) {
                        var data = obj.data;
                        var goodsId = data.goodsId;
                        var goodsName = data.goodsName;
                        var goodsPrice = data.goodsPrice;
                        var goodsNum = data.goodsNum;
                        var goodsStock = data.goodsStock;
                        var goodsDesc = data.goodsDesc;
                        var goodsImageUrl = data.goodsImageUrl;
                        $("input[name='goodsId']").val(goodsId);
                        $("input[name='goodsName']").val(goodsName);
                        $("input[name='goodsPrice']").val(goodsPrice);
                        $("input[name='goodsNum']").val(goodsNum);
                        $("input[name='goodsStock']").val(goodsStock);
                        $("input[name='goodsDesc']").val(goodsDesc);
                        $("#seeImg").css('display', '').prop("src", "<%=path%>" + goodsImageUrl);
                    } else {
                        layui.use('layer', function () {
                            var layer = layui.layer;
                            layer.msg(obj.message);
                        });
                        $("#seeImg").css('display', 'display');
                    }
                });
                $("html,body").animate({scrollTop: $("#modifyGoods").offset().top}, 1000);
                return false;
            });
        })
    </script>
    <% session.removeAttribute("dealMsg");%>
</body>
</html>

