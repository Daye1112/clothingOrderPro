<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="#" class="site_title"><i class="fa fa-paw"></i><span>商城后台</span></a>
        </div>

        <div class="clearfix"></div>

        <!-- menu profile quick info -->
        <div class="profile clearfix">
            <div class="profile_pic">
                <img alt="loading..." src="<%=path%>/static/adminContent/images/head/1.jpg" class="img-circle profile_img"/>
            </div>
            <div class="profile_info">
                <span>欢迎,</span>
                <p style="font-size: medium;"></p>
            </div>
        </div>
        <!-- /menu profile quick info -->

        <br/>

        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <ul class="nav side-menu">
                    <li><a href="#"><i class="fa fa-home"></i>首页</a></li>
                    <li><a href="#"><i class="fa fa-shopping-cart"></i>查看用户信息</a></li>
                    <li><a href="#"><i class="fa fa-table"></i>添加学生信息</a></li>
                    <li><a href="<%=path%>/logout.do"><i class="fa fa-clone"></i>安全退出</a></li>
                </ul>
            </div>
        </div>
        <!-- /sidebar menu -->

        <!-- /menu footer buttons -->
        <div class="sidebar-footer hidden-small">
        </div>
        <!-- /menu footer buttons -->
    </div>
</div>

<!-- top navigation -->
<div class="top_nav">
    <div class="nav_menu">
        <nav>
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <li class="">
                    <a href="#" class="user-profile dropdown-toggle" data-toggle="dropdown"
                       aria-expanded="false">
                        <img alt="loading..." src="<%=path%>/static/adminContent/images/head/1.jpg"/>
                        <span class=" fa fa-angle-down"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                        <li><a href="<%=path%>/logout.do"><i  class="fa fa-sign-out pull-right"></i>安全退出</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>