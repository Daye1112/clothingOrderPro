<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Categories</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Wish shop project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/bootstrap4/bootstrap.min.css">
    <link href="<%=path%>/static/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/static/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.css" rel="stylesheet"
          type="text/css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/categories.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/categories_responsive.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/checkout.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/checkout_responsive.css">

    <link rel="stylesheet" type="text/css" href="<%=path%>/static/plugins/layui/css/layui.css">

    <!-- 图片上传 -->
    <link rel="stylesheet" href="<%=path%>/static/css/head/cropper.min.css">
    <link rel="stylesheet" href="<%=path%>/static/css/head/ImgCropping.css">
</head>
<body>

    <div class="super_container">

        <!-- Header -->
        <jsp:include page="module/top.jsp"/>
        <!-- Menu -->
        <jsp:include page="module/menu.jsp"/>
        <!-- Home -->
        <!-- <div class="home" style="height: 10px;">
        </div> -->

        <!-- Products -->

        <div class="products">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div style="top:5%;padding-bottom: 2%;float: left;">
                            <img alt="Loading..." src="<%=path%>${sessionScope.user.avatarUrl}" width="40px"
                                 height="40px"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            ${sessionScope.user.loginAccount}
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="#" id="replaceImg">修改头像</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="<%=path%>/logout.do">登出</a>
                        </div>

                        <!-- Color -->
                        <div class="sidebar_section" style="top:6%;float: right;">
                            <div class="sidebar_title">个人信息</div>
                            <div class="sidebar_section_content sidebar_color_content mCustomScrollbar"
                                 style="height: auto;" data-mcs-theme="minimal-dark">
                                <form action="<%=path%>/user/update/self.do" method="post">
                                    <ul>
                                        <li>
                                            <a><span style="background:#a3ccff"></span>账号：</a>
                                            ${sessionScope.user.loginAccount}
                                        </li>
                                        <li>
                                            <a><span style="background:#937c6f"></span>密码：</a>
                                            <a id="modifyPwd" style="color: #0096b1;" href="#">修改密码</a>
                                        </li>
                                        <li>
                                            <a><span style="background:#000000"></span>身份证：</a>
                                            <input type="text" name="idCard" value="${sessionScope.user.idCard}"/>
                                        </li>
                                        <li>
                                            <a><span style="background:#ec971f;"></span>手机号码：</a>
                                            <input type="text" name="phone" value="${sessionScope.user.phone}"/>
                                        </li>
                                        <li>
                                            <a><span style="background:#ff5c00"></span>email：</a>
                                            <input type="text" name="email" value="${sessionScope.user.email}"/>
                                        </li>
                                        <li>
                                            <a><span style="background:#a3ffb2"></span>性别：</a>
                                            <input value="男" type="radio" id="sex01" name="sex"
                                                   class="regular_radio" ${sessionScope.user.sex == "男" ? "checked = 'checked'" : ""}>
                                            <label for="sex01">男</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input value="女" type="radio" id="sex02" name="sex"
                                                   class="regular_radio" ${sessionScope.user.sex == "女" ? "checked = 'checked'" : ""}>
                                            <label for="sex02">女</label>
                                        </li>
                                        <li>
                                            <a><span style="background:#f52832"></span>用户级别：</a>
                                            ${sessionScope.user.manage == true ? "管理员" : "普通用户"}
                                        </li>
                                        <li style="text-align: center;">
                                            <input type="submit" value="保存信息" style="margin-top: 5px;"
                                                   class="clear_price_btn"/>
                                        </li>
                                    </ul>
                                </form>
                            </div>
                        </div>
                        <!-- Color End -->

                        <!-- Size -->
                        <div class="sidebar_section sidebar_options" style="top:6%;float: right;">
                            <div class="sidebar_section_content">

                                <!-- Option Item -->
                                <div class="sidebar_option d-flex flex-row align-items-center justify-content-start">
                                    <div class="option_image"><img src="<%=path%>/static/images/option_1.png" alt="">
                                    </div>
                                    <div class="option_content">
                                        <div class="option_title">总消费</div>
                                        <div class="option_subtitle">No questions asked</div>
                                    </div>
                                </div>

                                <!-- Option Item -->
                                <div class="sidebar_option d-flex flex-row align-items-center justify-content-start">
                                    <div class="option_image"><img src="<%=path%>/static/images/option_2.png" alt="">
                                    </div>
                                    <div class="option_content">
                                        <div class="option_title">我的购物车</div>
                                        <div class="option_subtitle">On all orders</div>
                                    </div>
                                </div>

                                <!-- Option Item -->
                                <div class="sidebar_option d-flex flex-row align-items-center justify-content-start">
                                    <div class="option_image"><img src="<%=path%>/static/images/option_3.png" alt="">
                                    </div>
                                    <div class="option_content">
                                        <div class="option_title">我的收藏</div>
                                        <div class="option_subtitle">No need to worry</div>
                                    </div>
                                </div>

                                <!-- Option Item -->
                                <div class="sidebar_option d-flex flex-row align-items-center justify-content-start">
                                    <div class="option_image"><img src="<%=path%>/static/images/option_4.png" alt="">
                                    </div>
                                    <div class="option_content">
                                        <div class="option_title">我的关注</div>
                                        <div class="option_subtitle">Just call us</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Size End -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <jsp:include page="module/footer.jsp"/>
    </div>
    <!-- 图片上传 -->
    <form action="<%=path%>/user/file/avatar.do" method="post" enctype="multipart/form-data">
        <div style="display: none" class="tailoring-container">
            <div class="black-cloth" onclick="closeTailor(this)"></div>
            <div class="tailoring-content" style="top: 50px; left: 353px;">
                <div class="tailoring-content-one">
                    <label title="上传图片" for="chooseImg" class="l-btn choose-btn">
                        <input type="file" accept="image/jpg,image/jpeg,image/png" name="file" id="chooseImg"
                               class="hidden" onchange="selectImg(this)">
                        选择图片
                    </label>
                    <input name="imgBase" hidden="hidden" type="text" id="base64url"/>
                    <input name="imgName" hidden="hidden" type="text" id="imgName"/>
                    <div class="close-tailoring" onclick="closeTailor(this)">×</div>
                </div>
                <div class="tailoring-content-two">
                    <div class="tailoring-box-parcel">
                        <img id="tailoringImg">
                    </div>
                    <div class="preview-box-parcel">
                        <p>图片预览：</p>
                        <div class="square previewImg"></div>
                        <div class="circular previewImg"></div>
                    </div>
                </div>
                <div class="tailoring-content-three">
                    <button class="l-btn cropper-reset-btn">复位</button>
                    <button class="l-btn cropper-rotate-btn">旋转</button>
                    <button class="l-btn cropper-scaleX-btn">换向</button>
                    <button type="submit" class="l-btn sureCut" id="sureCut">确定</button>
                </div>
            </div>
        </div>
    </form>


    <script src="<%=path%>/static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/plugins/layui/layui.js"></script>
    <script src="<%=path%>/static/styles/bootstrap4/popper.js"></script>
    <script src="<%=path%>/static/styles/bootstrap4/bootstrap.min.js"></script>
    <script src="<%=path%>/static/plugins/easing/easing.js"></script>
    <script src="<%=path%>/static/plugins/parallax-js-master/parallax.min.js"></script>
    <script src="<%=path%>/static/plugins/Isotope/isotope.pkgd.min.js"></script>
    <script src="<%=path%>/static/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.js"></script>
    <script src="<%=path%>/static/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
    <script src="<%=path%>/static/js/categories_custom.js"></script>

    <!-- 图片上传 -->
    <%--<script type="text/javascript" src="<%=path%>/static/js/head/jquery.min.js"></script>--%>
    <script type="text/javascript" src="<%=path%>/static/js/head/cropper.min.js"></script>

    <script type="text/javascript">
        layui.use('layer', function () {
            var layer = layui.layer;
            <c:if test="${not empty requestScope.succeedMsg}">
            layer.msg("${requestScope.succeedMsg}");
            </c:if>
            <c:if test="${not empty requestScope.errorMsg}">
            layer.msg("${requestScope.errorMsg}");
            </c:if>
        });
        $("#modifyPwd").click(function () {
            layui.use('layer', function () {
                var layer = layui.layer;
                // layer.msg("hello");
                layer.open({
                    title: "修改密码",
                    type: 1,
                    skin: '', //样式类名
                    closeBtn: 1, //不显示关闭按钮
                    anim: 2,
                    shadeClose: true, //开启遮罩关闭
                    content: '<div style="width: 360px;text-align: center;">' +
                        '<form action="<%=path%>/user/update/pwd.do" method="post" style="text-align: center;"><br/>' +
                        '原密码：&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="oldPassword"/><br/><br/>' +
                        '新密码：&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="newPassword"/><br/><br/>' +
                        '确认密码：<input type="password" name="newPasswordCheck"/><br/><br/>' +
                        '<input style="margin-top: 5px;" class="clear_price_btn" type="submit" value="提交"/><br/><br/>' +
                        '</form>' +
                        '</div>'
                });
                return false;
            });
        });
    </script>

    <!-- 上传图片 -->
    <script type="text/javascript">
        //弹出框水平垂直居中
        (window.onresize = function () {
            var win_height = $(window).height();
            var win_width = $(window).width();
            if (win_width <= 768) {
                $(".tailoring-content").css({
                    "top": (win_height - $(".tailoring-content").outerHeight()) / 2,
                    "left": 0
                });
            } else {
                $(".tailoring-content").css({
                    "top": (win_height - $(".tailoring-content").outerHeight()) / 2,
                    "left": (win_width - $(".tailoring-content").outerWidth()) / 2
                });
            }
        })();

        //弹出图片裁剪框
        $("#replaceImg").on("click", function () {
            $(".tailoring-container").toggle();
        });

        //图像上传
        function selectImg(file) {
            if (!file.files || !file.files[0]) {
                return;
            }
            var reader = new FileReader();
            reader.onload = function (evt) {
                var replaceSrc = evt.target.result;
                //更换cropper的图片
                $('#tailoringImg').cropper('replace', replaceSrc, false);//默认false，适应高度，不失真
            }
            reader.readAsDataURL(file.files[0]);
        }

        //cropper图片裁剪
        $('#tailoringImg').cropper({
            aspectRatio: 1 / 1,//默认比例
            preview: '.previewImg',//预览视图
            guides: false,  //裁剪框的虚线(九宫格)
            autoCropArea: 0.5,  //0-1之间的数值，定义自动剪裁区域的大小，默认0.8
            movable: false, //是否允许移动图片
            dragCrop: true,  //是否允许移除当前的剪裁框，并通过拖动来新建一个剪裁框区域
            movable: true,  //是否允许移动剪裁框
            resizable: true,  //是否允许改变裁剪框的大小
            zoomable: false,  //是否允许缩放图片大小
            mouseWheelZoom: false,  //是否允许通过鼠标滚轮来缩放图片
            touchDragZoom: true,  //是否允许通过触摸移动来缩放图片
            rotatable: true,  //是否允许旋转图片
            crop: function (e) {
                // 输出结果数据裁剪图像。
            }
        });
        //旋转
        $(".cropper-rotate-btn").on("click", function () {
            $('#tailoringImg').cropper("rotate", 45);
        });
        //复位
        $(".cropper-reset-btn").on("click", function () {
            $('#tailoringImg').cropper("reset");
        });
        //换向
        var flagX = true;
        $(".cropper-scaleX-btn").on("click", function () {
            if (flagX) {
                $('#tailoringImg').cropper("scaleX", -1);
                flagX = false;
            } else {
                $('#tailoringImg').cropper("scaleX", 1);
                flagX = true;
            }
            flagX != flagX;
        });

        //裁剪后的处理
        $("#sureCut").on("click", function () {
            if ($("#tailoringImg").attr("src") == null) {
                return false;
            } else {
                var cas = $('#tailoringImg').cropper('getCroppedCanvas');//获取被裁剪后的canvas
                var base64url = cas.toDataURL('image/jpeg'); //转换为base64地址形式
                $("#base64url").val(base64url);
                $("#imgName").val(document.getElementById('chooseImg').files[0].name);
                //关闭裁剪框
                closeTailor();
            }
        });

        //关闭裁剪框
        function closeTailor() {
            $(".tailoring-container").toggle();
        }
    </script>
</body>
</html>