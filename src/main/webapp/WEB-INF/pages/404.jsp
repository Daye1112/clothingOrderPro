<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>404</title>
    <link href="<%=path%>/static/css/404/404.css" rel="stylesheet" type="text/css">
    <script src="<%=path%>/static/js/404/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        $(function() {
            var h = $(window).height();
            $('body').height(h);
            $('.mianBox').height(h);
            centerWindow(".tipInfo");
        });

        //2.将盒子方法放入这个方，方便法统一调用
        function centerWindow(a) {
            center(a);
            //自适应窗口
            $(window).bind('scroll resize',
                function() {
                    center(a);
                });
        }

        //1.居中方法，传入需要剧中的标签
        function center(a) {
            var wWidth = $(window).width();
            var wHeight = $(window).height();
            var boxWidth = $(a).width();
            var boxHeight = $(a).height();
            var scrollTop = $(window).scrollTop();
            var scrollLeft = $(window).scrollLeft();
            var top = scrollTop + (wHeight - boxHeight) / 2;
            var left = scrollLeft + (wWidth - boxWidth) / 2;
            $(a).css({
                "top": top,
                "left": left
            });
        }
    </script>
</head>
<body style="height: 871px;">
    <div class="mianBox" style="height: 871px;">
        <img src="<%=path%>/static/images/404/yun0.png" alt="" class="yun yun0">
        <img src="<%=path%>/static/images/404/yun1.png" alt="" class="yun yun1">
        <img src="<%=path%>/static/images/404/yun2.png" alt="" class="yun yun2">
        <img src="<%=path%>/static/images/404/bird.png" alt="" class="bird">
        <img src="<%=path%>/static/images/404/san.png" alt="" class="san">
        <div class="tipInfo" style="top: 361.5px; left: 780px;">
            <div class="in">
                <div class="textThis">
                    <h2>页面开发中</h2>
                    <p><span>3秒后，<a href="<%=path%>/customerLink/home.html">去首页溜达吧</a><a id="href" href="<%=path%>/customerLink/home.html"></a></span><span><b id="wait">3</b>秒</span></p>
                    <script type="text/javascript">                            (function() {
                        var wait = document.getElementById('wait'), href = document.getElementById('href').href;
                        var interval = setInterval(function() {
                            var time = --wait.innerHTML;
                            if (time <= 0) {
                                location.href = href;
                                clearInterval(interval);
                            }
                        }, 2000);
                    })();
                    </script>
                </div>
            </div>
        </div>
    </div>

</body>
</html>