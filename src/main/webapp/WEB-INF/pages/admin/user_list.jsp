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
    <title>用户管理</title>

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
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>用户名</th>
                                        <th>身份证</th>
                                        <th>联系方式</th>
                                        <th>电子邮箱</th>
                                        <th>性别</th>
                                        <th>删除</th>
                                        <th>修改</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${requestScope.userList}" var="user">
                                        <tr>
                                            <td scope="row">${user.userId}</td>
                                            <td>${user.loginAccount}</td>
                                            <td>${user.idCard}</td>
                                            <td>${user.phone}</td>
                                            <td>${user.email}</td>
                                            <td>${user.sex}</td>
                                            <td>
                                                <a name="delUser" style="color: blue;"
                                                   href="<%=path%>/user/del/${user.userId}.do">删除</a>
                                            </td>
                                            <td>
                                                <a name="editUser" style="color: blue;"
                                                   href="<%=path%>/user/info/${user.userId}.do">修改</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="col-sm-7">
                                    <div class="dataTables_paginate paging_simple_numbers">
                                        <ul class="pagination">
                                            <li class="paginate_button previous ${requestScope.pageNow <= 1 ? "disabled" : ""}">
                                                <a href="<c:if test="${requestScope.pageNow > 1}"><%=path%>/lk/admin/user/list/${requestScope.pageNow - 1}/10.html</c:if><c:if test="${requestScope.pageNow <= 1}">#</c:if>">
                                                    Previous
                                                </a>
                                            </li>
                                            <c:forEach begin="1" end="${requestScope.pageNum}" step="1" var="i">
                                                <li class="paginate_button <c:if test="${requestScope.pageNow == i}">active</c:if>">
                                                    <a href="<%=path%>/lk/admin/user/list/${i}/10.html ">${i}</a>
                                                </li>
                                            </c:forEach>
                                            <li class="paginate_button next ${requestScope.pageNow >= requestScope.pageNum ? "disabled" : ""}">
                                                <a href="<c:if test="${requestScope.pageNow < requestScope.pageNum}"><%=path%>/lk/admin/user/list/${requestScope.pageNow + 1}/10.html</c:if><c:if test="${requestScope.pageNow >= requestScope.pageNum}">#</c:if>">
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
                                    更新用户信息
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
                                    <p>请在此处填写用户的个人信息</p>
                                    <span class="section">用户的信息</span>
                                    <form action="<%=path%>/user/update.do" method="post" id="modifyUser">
                                        <input type="hidden" disabled="disabled" name="userId"
                                               class="form-control col-md-7 col-xs-12"/>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                账号 <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input name="loginAccount" class="form-control col-md-7 col-xs-12"/>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                密码<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input name="password" class="form-control col-md-7 col-xs-12"/>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                身份证
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input name="idCard" class="form-control col-md-7 col-xs-12"/>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                手机号码
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input name="phone" class="form-control col-md-7 col-xs-12"/>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                Email
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input name="email" class="form-control col-md-7 col-xs-12"/>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                性别
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                男:<input type="radio" name="sex" id="sexM" value="男"
                                                         checked/>
                                                女:<input type="radio" name="sex" id="sexF" value="女"/>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                管理员
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                是:<input type="radio" name="manage" id="manageYes"
                                                         value="1"/>
                                                否:<input type="radio" name="manage" id="manageNo"
                                                         value="0" checked/>
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
            $("a[name='delUser']").click(function () {
                var href = $(this).attr("href");
                layui.use('layer', function () {
                    var layer = layui.layer;
                    layer.confirm("是否确认删除该用户？", {title: "确认删除"}, function (index) {
                        layer.close(index);
                        $.get(href, function (obj) {
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
            $("a[name='editUser']").click(function () {
                var href = $(this).attr("href");
                $.get(href, function (obj) {
                    if (obj.success) {
                        var data = obj.data;
                        var userId = data.userId;
                        var loginAccount = data.loginAccount;
                        var password = data.password;
                        var idCard = data.idCard;
                        var phone = data.phone;
                        var email = data.email;
                        var sex = data.sex;
                        var manage = data.manage;
                        $("input[name='userId']").val(userId);
                        $("input[name='loginAccount']").val(loginAccount);
                        $("input[name='password']").val(password);
                        $("input[name='idCard']").val(idCard);
                        $("input[name='phone']").val(phone);
                        $("input[name='email']").val(email);
                        if (sex === "男") {
                            $("#sexF").removeProp("checked");
                            $("#sexM").prop("checked", true);
                        } else {
                            $("#sexM").removeProp("checked");
                            $("#sexF").prop("checked", true);
                        }
                        if (manage) {
                            $("#manageNo").removeProp("checked");
                            $("#manageYes").prop("checked", true);
                        } else {
                            $("#manageYes").removeProp("checked");
                            $("#manageNo").prop("checked", true);
                        }
                    } else {
                        layui.use('layer', function () {
                            var layer = layui.layer;
                            layer.msg(obj.message);
                        });
                    }
                });
                $("html,body").animate({scrollTop: $("#modifyUser").offset().top}, 1000);
                return false;
            });
            $("#subBtn").click(function () {
                var url = $("#modifyUser").prop("action");
                var userId = $("input[name='userId']").val();
                var loginAccount = $("input[name='loginAccount']").val();
                var password = $("input[name='password']").val();
                var idCard = $("input[name='idCard']").val();
                var phone = $("input[name='phone']").val();
                var email = $("input[name='email']").val();
                var sex = $("input[name='sex']:checked").val();
                var manage = $("input[name='manage']:checked").val();
                var params = {
                    "userId": userId, "loginAccount": loginAccount,
                    "password": password, "idCard": idCard,
                    "phone": phone, "email": email,
                    "sex": sex, "manage": manage
                };
                $.post(url, params, function (obj) {
                    layui.use('layer', function () {
                        var layer = layui.layer;
                        if (obj.success) {
                            layer.msg("修改成功");
                        } else {
                            layer.msg("修改失败");
                        }
                    });
                    $("input[name='userId']").val("");
                    setTimeout(function () {
                        //刷新当前页面
                        window.location.reload();
                    }, 1000);
                });
                return false;
            });

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

