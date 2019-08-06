<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>添加学生信息</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/Content/vendors/bootstrap/dist/css/bootstrap.min.css"
          rel="stylesheet"/>
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/Content/vendors/font-awesome/css/font-awesome.min.css"
          rel="stylesheet"/>
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/Content/vendors/nprogress/nprogress.css" rel="stylesheet"/>
    <!-- bootstrap-progressbar -->
    <link href="${pageContext.request.contextPath}/Content/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
          rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="${pageContext.request.contextPath}/Content/vendors/bootstrap-daterangepicker/daterangepicker.css"
          rel="stylesheet"/>

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/Content/vendors/build/css/custom.min.css" rel="stylesheet"/>
</head>
<body class="nav-md">
    <s:form action="student_add" method="POST" theme="simple">
        <div class="container body">
            <div class="main_container">
                <%@ include file="home_module.jsp" %>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="clearfix"></div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>
                                        添加学生信息
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

                                        <p>
                                            请在此处填写学生的个人信息
                                        </p>
                                        <span class="section">学生的信息</span>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                姓名 <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <s:textfield name="student.studentName" class="form-control col-md-7 col-xs-12"/>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                入学时间
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <s:textfield name="student.entryTime" class="form-control col-md-7 col-xs-12"/>
                                                <small>(格式：yyyy-MM-dd)</small>
                                                <%--<p style="color: red;"><s:property value="error.student.entryTime"/></p>--%>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                所属系部<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <s:select name="dept.deptId" list="#request.deptList" listKey="deptId" listValue="deptName"/>
                                            </div>
                                        </div>
                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-md-offset-3">
                                                <s:submit class="btn btn-primary" value="提交"/>
                                                <s:reset class="btn btn-success" value="重置"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /page content -->

                <!-- footer content -->
                <!-- /footer content -->
            </div>
        </div>
    </s:form>
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/Content/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/Content/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/Content/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${pageContext.request.contextPath}/Content/vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="${pageContext.request.contextPath}/Content/vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- jQuery Sparklines -->
    <script src="${pageContext.request.contextPath}/Content/vendors/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
    <!-- morris.js -->
    <script src="${pageContext.request.contextPath}/Content/vendors/raphael/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/Content/vendors/morris.js/morris.min.js"></script>
    <!-- gauge.js -->
    <script src="${pageContext.request.contextPath}/Content/vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="${pageContext.request.contextPath}/Content/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- Skycons -->
    <script src="${pageContext.request.contextPath}/Content/vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="${pageContext.request.contextPath}/Content/vendors/Flot/jquery.flot.js"></script>
    <script src="${pageContext.request.contextPath}/Content/vendors/Flot/jquery.flot.pie.js"></script>
    <script src="${pageContext.request.contextPath}/Content/vendors/Flot/jquery.flot.time.js"></script>
    <script src="${pageContext.request.contextPath}/Content/vendors/Flot/jquery.flot.stack.js"></script>
    <!-- <script src="${pageContext.request.contextPath}/Content/vendors/Flot/jquery.flot.resize.js"></script>  -->
    <!-- Flot plugins -->
    <script src="${pageContext.request.contextPath}/Content/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="${pageContext.request.contextPath}/Content/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="${pageContext.request.contextPath}/Content/vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="${pageContext.request.contextPath}/Content/vendors/DateJS/build/date.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="${pageContext.request.contextPath}/Content/vendors/moment/min/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/Content/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/Content/vendors/build/js/custom.min.js"></script>
</body>
</html>

