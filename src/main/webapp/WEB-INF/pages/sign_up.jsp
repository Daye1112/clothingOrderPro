<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>免费注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FreeHTML5.co" />
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />

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
                <form action="<%=path%>/user/signUp.do" method="post" class="fh5co-form animate-box" data-animate-effect="fadeInLeft">
                    <h2>注册</h2>
                    <c:if test="${not empty requestScope.succeedMsg or not empty requestScope.errorMsg}">
                    <div class="form-group">
                        <div class="alert alert-success" role="alert">${requestScope.succeedMsg}${requestScope.errorMsg}</div>
                    </div>
                    </c:if>
                    <div class="form-group">
                        <label for="name" class="sr-only">账号</label>
                        <input name="loginAccount" type="text" class="form-control" id="name" placeholder="账号" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="email" class="sr-only">Email</label>
                        <input name="email" type="email" class="form-control" id="email" placeholder="Email" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="password" class="sr-only">密码</label>
                        <input name="password" type="password" class="form-control" id="password" placeholder="密码确认" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="re-password" class="sr-only">确认密码</label>
                        <input type="password" class="form-control" id="re-password" placeholder="确认密码" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <p>已有账号？<a href="<%=path%>/userLink/login.html">登录</a></p>
                    </div>
                    <div class="form-group">
                        <input type="submit" id="subBtn" value="注册" class="btn btn-primary">
                        <p id="resMsg" style="color:red;"></p>
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
            var $password = $("#password").val();
            var $rePassword = $("#re-password").val();
            if($password !== $rePassword){
                $("#resMsg").text("两次密码不一致");
                return false;
            } else{
                var $email = $("#email").val();
                var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
                if(!reg.test($email))
                {
                    $("#resMsg").text("邮箱格式错误！");
                    return false;
                }
                $("form").submit();
            }
        });
    </script>

</body>
</html>