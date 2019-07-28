<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<div class="menu d-flex flex-column align-items-end justify-content-start text-right menu_mm trans_400">
    <div class="menu_close_container"><div class="menu_close"><div></div><div></div></div></div>
    <div class="logo menu_mm"><a href="#">Wish</a></div>
    <div class="search">
        <form action="">
            <input type="search" class="search_input menu_mm" required="required"/>
            <button type="submit" id="search_button_menu" class="search_button menu_mm"><img class="menu_mm" src="<%=path%>/static/images/magnifying-glass.svg" alt=""></button>
        </form>
    </div>
    <nav class="menu_nav">
        <ul class="menu_mm">
            <li class="menu_mm"><a href="<%=path%>/customerLink/home.html">主页</a></li>
            <li class="menu_mm"><a href="<%=path%>/customerLink/clothes/1/12.html">服装</a></li>
            <li class="menu_mm"><a href="">accessories</a></li>
            <li class="menu_mm"><a href="">lingerie</a></li>
            <li class="menu_mm"><a href="<%=path%>/customerLink/contact.html">联系我们</a></li>
        </ul>
    </nav>
</div>