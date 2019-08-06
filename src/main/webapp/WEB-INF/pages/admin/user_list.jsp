<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>主页</title>

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
</head>
<body class="nav-md">
    <div class="container body">
        <div class="main_container">
            <jsp:include page="module/home_module.jsp"/>
            <!-- /top navigation -->

            <!-- page content -->
            <div class="right_col" role="main">
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
                                        <td>${user.userId}</td>
                                        <td>${user.loginAccount}</td>
                                        <td>${user.idCard}</td>
                                        <td>${user.phone}</td>
                                        <td>${user.email}</td>
                                        <td>${user.sex}</td>
                                        <td>
                                            <a style="color: blue;" href="">点击删除</a>
                                        </td>
                                        <td>
                                            <a style="color: blue;" href="">点击修改</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="col-sm-7">
                                <div class="dataTables_paginate paging_simple_numbers">
                                    <%
                                        Integer pageNum = (Integer) request.getAttribute("pageNum");
                                        Integer pageNow = (Integer) request.getAttribute("pageNow");
                                    %>
                                    <ul class="pagination">
                                        <li class="paginate_button previous <s:if test="#request.pageNow == 1">disabled</s:if>">
                                            <a href="<s:if test="#request.pageNow == 1">#</s:if><s:else>student_list?pageNow=<%=pageNow - 1%></s:else>">
                                                Previous
                                            </a>
                                        </li>
                                        <c:forEach begin="1" end="<%=pageNum%>" step="1" var="i">
                                            <li class="paginate_button <c:if test="${requestScope.pageNow == i}">active</c:if>">
                                                <a href="student_list?pageNow=${i}">${i}</a></li>
                                            <%--<li class="paginate_button"><a href="student_list?pageNow=${i}">${i}</a></li>--%>
                                        </c:forEach>
                                        <li class="paginate_button next <s:if test="#request.pageNow == #request.pageNum">disabled</s:if>">
                                            <a href=" <s:if test="#request.pageNow == #request.pageNum">#</s:if><s:else>student_list?pageNow=<%=pageNow + 1%></s:else>">Next</a>
                                        </li>
                                    </ul>
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

    <!-- Custom Theme Scripts -->
    <script src="<%=path%>/static/adminContent/vendors/build/js/custom.min.js"></script>
</body>
</html>

