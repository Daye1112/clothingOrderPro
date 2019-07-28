<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<div class="newsletter">
    <div class="newsletter_content">
        <div class="newsletter_image" style="background-image:url(<%=path%>/static/images/newsletter.jpg)"></div>
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="section_title_container text-center">
                        <div class="section_subtitle">only the best</div>
                        <div class="section_title">拓展模块</div>
                    </div>
                </div>
            </div>
            <div class="row newsletter_container">
                <div class="col-lg-10 offset-lg-1">
                    <div class="newsletter_form_container">
                        <form action="#">
                            <input type="email" class="newsletter_input" required="required" placeholder="E-mail here">
                            <button type="submit" class="newsletter_button">提交</button>
                        </form>
                    </div>
                    <div class="newsletter_text">文案</div>
                </div>
            </div>
        </div>
    </div>
</div>