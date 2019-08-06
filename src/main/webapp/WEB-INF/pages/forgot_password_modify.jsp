<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<!DOCTYPE html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>忘记密码-修改密码</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FreeHTML5.co"/>
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive"/>


    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="<%=path%>/static/css/login/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/static/css/login/animate.css">
    <link rel="stylesheet" href="<%=path%>/static/css/login/style.css">

    <!-- Modernizr JS -->
    <script src="<%=path%>/static/js/login/modernizr-2.6.2.min.js"></script>

</head>
<body class="style-2">

    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <!-- Start Sign In Form -->
                <form action="<%=path%>/email/modify/pwd.do" method="post" class="fh5co-form animate-box" data-animate-effect="fadeInLeft">
                    <h2>忘记密码-修改</h2>
                    <c:if test="${not empty requestScope.succeedMsg or not empty requestScope.errorMsg}">
                        <div class="form-group">
                            <div class="alert alert-success" role="alert">${requestScope.errorMsg}${requestScope.succeedMsg}</div>
                        </div>
                    </c:if>
                    <div class="form-group">
                        <label for="name" class="sr-only">验证码</label>
                        <input name="checkCode" type="text" class="form-control" id="name" placeholder="验证码"
                               autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="password" class="sr-only">密码</label>
                        <input name="newPassword" type="password" class="form-control" id="password" placeholder="密码"
                               autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="re-password" class="sr-only">确认密码</label>
                        <input name="newPasswordCheck" type="password" class="form-control" id="re-password"
                               placeholder="确认密码" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <p>已有账号？<a href="<%=path%>/userLink/login.html">登录</a></p>
                    </div>
                    <div class="form-group">
                        <input id="subBtn" type="submit" value="修改" class="btn btn-primary">
                    </div>
                </form>
                <!-- END Sign In Form -->
            </div>
        </div>
    </div>

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
    <script type="text/javascript">
        $("#subBtn").click(function () {
            $("form").submit();
            $(this).attr("disabled", "disabled");
        });
    </script>

</body>
</html>

