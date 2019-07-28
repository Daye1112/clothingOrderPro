<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Contact</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Wish shop project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/bootstrap4/bootstrap.min.css">
    <link href="<%=path%>/static/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/contact.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/styles/contact_responsive.css">

    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=2T0VlHliqUKjd1LOC6akAjnF1i5YBFSi"></script>
</head>
<body>

    <div class="super_container">

        <!-- Header -->
        <jsp:include page="module/top.jsp"/>

        <!-- Menu -->
        <jsp:include page="module/menu.jsp"/>

        <!-- Home -->

        <div class="home">
            <div class="home_background parallax-window" data-parallax="scroll" data-image-src="<%=path%>/static/images/contact.jpg" data-speed="0.8"></div>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="home_container">
                            <div class="home_content">
                                <div class="home_title">联系我们</div>
                                <div class="breadcrumbs">
                                    <ul>
                                        <li><a href="#">主页</a></li>
                                        <li>联系</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Baidu Map -->

        <div class="map">
            <div id="google_map" class="google_map">
                <div class="map_container">
                    <div id="map"></div>
                </div>
            </div>
        </div>

        <!-- Contact Form -->

        <div class="contact">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="review_form_container">
                            <div class="review_form_title">get in touch</div>
                            <div class="review_form_content">
                                <form action="#" id="review_form" class="review_form">
                                    <div class="d-flex flex-md-row flex-column align-items-start justify-content-between">
                                        <input type="text" class="review_form_input" placeholder="姓名" required="required">
                                        <input type="email" class="review_form_input" placeholder="邮箱" required="required">
                                        <input type="text" class="review_form_input" placeholder="主题">
                                    </div>
                                    <textarea class="review_form_text" name="review_form_text" placeholder="内容"></textarea>
                                    <button type="submit" class="review_form_button">发送信息</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Contact Text -->

        <div class="contact_text">
            <div class="container">
                <div class="row">

                    <!-- Contact Info -->
                    <div class="col-lg-5">

                        <div class="contact_info">
                            <div class="contact_title">联系方式</div>
                            <div class="contact_info_content">
                                <ul>
                                    <li>
                                        <div class="contact_info_icon"><img src="<%=path%>/static/images/contact_info_1.png" alt=""></div>
                                        <div class="contact_info_text">绍兴市上虞区康阳大道58号</div>
                                    </li>
                                    <li>
                                        <div class="contact_info_icon"><img src="<%=path%>/static/images/contact_info_2.png" alt=""></div>
                                        <div class="contact_info_text">123@163.com</div>
                                    </li>
                                    <li>
                                        <div class="contact_info_icon"><img src="<%=path%>/static/images/contact_info_3.png" alt=""></div>
                                        <div class="contact_info_text">(0575)123456789</div>
                                    </li>
                                </ul>
                            </div>
                            <div class="contact_info_social">
                                <ul>
                                    <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-reddit-alien" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- FAQ -->
                    <div class="col-lg-7">
                        <div class="faq">
                            <div class="contact_title">常问问题</div>
                            <div class="faq_content">

                                <!-- Accordions -->
                                <div class="accordions">

                                    <div class="accordion_container">
                                        <div class="accordion d-flex flex-row align-items-center"><div>问题1</div></div>
                                        <div class="accordion_panel">
                                            <p>回复1</p>
                                        </div>
                                    </div>

                                    <div class="accordion_container">
                                        <div class="accordion d-flex flex-row align-items-center"><div>问题2</div></div>
                                        <div class="accordion_panel">
                                            <p>回复2</p>
                                        </div>
                                    </div>

                                    <div class="accordion_container">
                                        <div class="accordion d-flex flex-row align-items-center active"><div>问题3</div></div>
                                        <div class="accordion_panel">
                                            <p>回复3</p>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Newsletter -->
        <jsp:include page="module/news_letter.jsp"/>

        <!-- Footer -->
        <jsp:include page="module/footer.jsp"/>
    </div>


    <script src="<%=path%>/static/js/jquery-3.2.1.min.js"></script>
    <script src="<%=path%>/static/styles/bootstrap4/popper.js"></script>
    <script src="<%=path%>/static/styles/bootstrap4/bootstrap.min.js"></script>
    <script src="<%=path%>/static/plugins/easing/easing.js"></script>
    <script src="<%=path%>/static/plugins/parallax-js-master/parallax.min.js"></script>
<%--<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>--%>
    <script src="<%=path%>/static/js/contact_custom.js"></script>
    <script type="text/javascript">
        var map = new BMap.Map("map"); // 创建Map实例
        map.centerAndZoom(new BMap.Point(120.8246911498,30.1900229374), 17); // 初始化地图,设置中心点坐标和地图级别
        map.addControl(new BMap.MapTypeControl()); //添加地图类型控件
        map.setCurrentCity("绍兴"); // 设置地图显示的城市 此项是必须设置的
        // map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
    </script>
</body>
</html>