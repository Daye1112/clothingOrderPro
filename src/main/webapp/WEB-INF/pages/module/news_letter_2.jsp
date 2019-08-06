<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>

<div class="newsletter">
    <div class="newsletter_content">
        <div class="newsletter_image parallax-window" data-parallax="scroll"
             data-image-src="<%=path%>/static/images/newsletter.jpg"
             data-speed="0.8"></div>
        <div class="container">
            <div class="row options">

                <!-- Options Item -->
                <div class="col-lg-3">
                    <div class="options_item d-flex flex-row align-items-center justify-content-start">
                        <div class="option_image"><img src="<%=path%>/static/images/option_1.png" alt=""></div>
                        <div class="option_content">
                            <div class="option_title">30天退换</div>
                            <div class="option_subtitle">无条件退货</div>
                        </div>
                    </div>
                </div>

                <!-- Options Item -->
                <div class="col-lg-3">
                    <div class="options_item d-flex flex-row align-items-center justify-content-start">
                        <div class="option_image"><img src="<%=path%>/static/images/option_2.png" alt=""></div>
                        <div class="option_content">
                            <div class="option_title">首次定制免费</div>
                            <div class="option_subtitle">定制不加价</div>
                        </div>
                    </div>
                </div>

                <!-- Options Item -->
                <div class="col-lg-3">
                    <div class="options_item d-flex flex-row align-items-center justify-content-start">
                        <div class="option_image"><img src="<%=path%>/static/images/option_3.png" alt=""></div>
                        <div class="option_content">
                            <div class="option_title">安全付款</div>
                            <div class="option_subtitle">无需担心</div>
                        </div>
                    </div>
                </div>

                <!-- Options Item -->
                <div class="col-lg-3">
                    <div class="options_item d-flex flex-row align-items-center justify-content-start">
                        <div class="option_image"><img src="<%=path%>/static/images/option_4.png" alt=""></div>
                        <div class="option_content">
                            <div class="option_title">全天候支持</div>
                            <div class="option_subtitle">随时联系我们</div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row newsletter_row">
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
                            <input type="email" class="newsletter_input" required="required"
                                   placeholder="E-mail here">
                            <button type="submit" class="newsletter_button">提交</button>
                        </form>
                    </div>
                    <div class="newsletter_text">文案
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>