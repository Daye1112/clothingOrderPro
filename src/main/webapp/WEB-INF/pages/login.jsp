<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<!DOCTYPE html>
<%--<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->--%>
<%--<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8"> <![endif]-->--%>
<%--<!--[if IE 8]> <html class="no-js lt-ie9"> <![endif]-->--%>
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FreeHTML5.co"/>
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive"/>
    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content=""/>
    <meta name="twitter:image" content=""/>
    <meta name="twitter:url" content=""/>
    <meta name="twitter:c ard" content=""/>
    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <!-- <link rel="shortcut icon" href="favicon.ico"> -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="<%=path%>/static/css/login/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/static/css/login/animate.css">
    <link rel="stylesheet" href="<%=path%>/static/css/login/style.css">
    <!-- Modernizr JS -->
    <script src="<%=path%>/static/js/login/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <%--[if lt IE 9]>--%>
    <%--<script src="<%=path%>/static/js/respond.min.js"></script>--%>
    <%--[endif]--%>
</head>
<body class="style-2">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <!-- Start Sign In Form -->
                <form action="<%=path%>/user/login.do" method="post" class="fh5co-form animate-box"
                      data-animate-effect="fadeInLeft">
                    <h2>登录</h2>
                    <div class="form-group">
                        <label for="username" class="sr-only">账号</label>
                        <input name="loginAccount" type="text" class="form-control" id="username" placeholder="账号"
                               autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="password" class="sr-only">密码</label>
                        <input name="password" type="password" class="form-control" id="password" placeholder="密码"
                               autocomplete="off">
                    </div>
                    <div class="form-group">
                        <p>
                            没有账号？ <a href="<%=path%>/customerLink/signUp.html">免费注册</a>
                            | <a href="<%=path%>/customerLink/forgot/pwd.html">忘记密码?</a>
                            | <a href="<%=path%>/customerLink/home.html">继续逛逛</a>
                        </p>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="登录" class="btn btn-primary">
                        <p style="color: red;">${requestScope.errorMsg}</p>
                    </div>
                </form>
                <!-- END Sign In Form -->
            </div>
        </div>
    </div>
    <footer style="text-align: center;margin-top: 20%;">
        <div class="copyright">
            <p>Copyright &copy; 2019.基于“互联网+”的广场舞服饰设计与研究</p>
            <p> All rights reserved.More 浙江理工大学科技与艺术学院—科技创新计划</p>
        </div>
    </footer>
    <!-- jQuery -->
    <script src="<%=path%>/static/js/login/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="<%=path%>/static/js/login/bootstrap.min.js"></script>
    <!-- Placeholder -->
    <script src="<%=path%>/static/js/login/jquery.placeholder.min.js"></script>
    <!-- Waypoints -->
    <script src="<%=path%>/static/js/login/jquery.waypoints.min.js"></script>
    <!-- Main JS -->
    <script src="<%=path%>/static/js/login/main.js"></script>

</body>
</html>


