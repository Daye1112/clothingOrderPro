<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<header class="header">
    <div class="header_inner d-flex flex-row align-items-center justify-content-start">
        <div class="logo"><a href="#">项目名</a></div>
        <nav class="main_nav">
            <ul>
                <li><a href="<%=path%>/customerLink/home.html">主页</a></li>
                <li><a href="<%=path%>/customerLink/clothes/1/12.html">服装</a></li>
                <%--<li><a href="">accessories</a></li>--%>
                <li><a href="<%=path%>/userLink/order/list.html">我的订单</a></li>
                <li><a href="<%=path%>/customerLink/contact.html">联系我们</a></li>
            </ul>
        </nav>
        <div class="header_content ml-auto">
            <div class="search header_search">
                <form action="<%=path%>/goods/fq/goods.do" method="post">
                    <input name="goodsName" type="search" class="search_input" required="required"/>
                    <button type="submit" id="search_button" class="search_button"><img
                            src="<%=path%>/static/images/magnifying-glass.svg" alt=""></button>
                </form>
            </div>
            <div class="shopping">
                <!-- Cart -->
                <a href="<%=path%>/cart/info.html">
                    <div class="cart">
                        <img src="<%=path%>/static/images/shopping-bag.svg" alt="">
                        <c:if test="${not empty sessionScope.shopInfo}">
                            <div class="cart_num_container">
                                <div class="cart_num_inner">
                                    <div class="cart_num">${sessionScope.shopInfo.cartCnt}</div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </a>
                <!-- Star -->
                <a href="<%=path%>/clt/info.html">
                    <div class="star">
                        <img src="<%=path%>/static/images/star.svg" alt="">
                        <c:if test="${not empty sessionScope.shopInfo}">
                            <div class="star_num_container">
                                <div class="star_num_inner">
                                    <div class="star_num">${sessionScope.shopInfo.cltCnt}</div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </a>
                <!-- Avatar -->
                <a href="<%=path%>/userLink/self/info.html">
                    <div class="avatar">
                        <img src="<%=path%>/static/images/avatar.svg" alt="">
                    </div>
                </a>
            </div>
        </div>

        <div class="burger_container d-flex flex-column align-items-center justify-content-around menu_mm">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
</header>