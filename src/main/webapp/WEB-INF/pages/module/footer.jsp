<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col text-center">
                <div class="footer_logo"><a href="#">Wish</a></div>
                <nav class="footer_nav">
                    <ul>
                        <li><a href="<%=path%>/customerLink/home.html">主页</a></li>
                        <li><a href="<%=path%>/customerLink/clothes/1/12.html">服装</a></li>
                        <%--<li><a href="">accessories</a></li>--%>
                        <li><a href="<%=path%>/userLink/order/list.html">我的订单</a></li>
                        <li><a href="<%=path%>/customerLink/contact.html">联系我们</a></li>
                    </ul>
                </nav>
                <div class="footer_social">
                    <ul>
                        <li><a href=""><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-reddit-alien" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
                <div class="copyright">
                    <p>Copyright &copy; 2019.基于“互联网+”的广场舞服饰设计与研究 All rights reserved.More 浙江理工大学科技与艺术学院—科技创新计划</p>
                </div>
            </div>
        </div>
    </div>
</footer>