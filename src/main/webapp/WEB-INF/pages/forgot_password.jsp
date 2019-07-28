<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<!DOCTYPE html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>忘记密码</title>
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
                <form action="<%=path%>/email/pwd/send.do" method="post" class="fh5co-form animate-box" data-animate-effect="fadeInLeft">
                    <h2>忘记密码</h2>
                    <c:if test="${not empty requestScope.succeedMsg or not empty requestScope.errorMsg}">
                        <div class="form-group">
                            <div class="alert alert-success" role="alert">${requestScope.succeedMsg}${requestScope.errorMsg}</div>
                        </div>
                    </c:if>
                    <div class="form-group">
                        <label for="email" class="sr-only">邮箱</label>
                        <input name="email" type="email" class="form-control" id="email" placeholder="邮箱" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <p><a href="<%=path%>/userLink/login.html">登录</a> or <a href="<%=path%>/customerLink/signUp.html">免费注册</a></p>
                    </div>
                    <div class="form-group">
                        <input id="sendBtn" type="submit" value="发送邮件" ${requestScope.succeedMsg != null ? "disabled='disabled'" : ""} class="btn btn-primary">
                        <br/><br/><p style="color:red;" id="errMsg"></p>
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
    <script type="text/javascript">
        $("#sendBtn").click(function () {
            var $email = $("#email").val();
            //验证邮箱
            var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
            if(!reg.test($email))
            {
                $("#errMsg").text("邮箱格式错误！");
                return false;
            }
            $("form").submit();
            $(this).attr("disabled", "disabled");
            $("#errMsg").text("邮件发送中...");
        });
    </script>
</body>
</html>