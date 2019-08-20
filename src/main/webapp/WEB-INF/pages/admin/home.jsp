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
            <div class="right_col" role="main" style="text-align: center;">
                <h1>欢迎使用商城后台管理系统</h1>
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
</body>
</html>

