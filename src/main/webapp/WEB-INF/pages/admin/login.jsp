<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台登陆</title>
    <link rel='stylesheet' href='<%=path%>/static/adminContent/css/login_css/goole_font.css'
          type='text/css'/>
    <link rel="stylesheet" href="<%=path%>/static/adminContent/css/login_css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=path%>/static/adminContent/css/login_css/animate.css"/>
    <link rel="stylesheet" href="<%=path%>/static/adminContent/css/login_css/style.css"/>

    <script src="<%=path%>/static/adminContent/js/login_js/modernizr-2.6.2.min.js"></script>

</head>
<body class="style-3"
      style="background: url(<%=path%>/static/adminContent/images/login/background.jpg); background-size:auto;">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-push-8">
                <form action="<%=path%>/user/login.do" method="POST" class="fh5co-form animate-box"
                      data-animate-effect="fadeInRight">
                    <h2>安全登录</h2>
                    <input type="hidden" name="loginType" value="admin"/>
                    <div class="form-group">
                        <input type="text" name="loginAccount" placeholder="账号" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" placeholder="密码" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <p style="color:red; font-size: small;">
                        ${requestScope.errorMsg}
                        </p>
                        <input type="submit" class="btn btn-primary" value="登录"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- jQuery -->
    <script src="<%=path%>/static/adminContent/js/login_js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="<%=path%>/static/adminContent/js/login_js/bootstrap.min.js"></script>
    <!-- Placeholder -->
    <script src="<%=path%>/static/adminContent/js/login_js/jquery.placeholder.min.js"></script>
    <!-- Waypoints -->
    <script src="<%=path%>/static/adminContent/js/login_js/jquery.waypoints.min.js"></script>
    <!-- Main JS -->
    <script src="<%=path%>/static/adminContent/js/login_js/main.js"></script>
</body>
</html>
