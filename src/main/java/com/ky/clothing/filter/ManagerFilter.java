package com.ky.clothing.filter;

import com.ky.clothing.entity.User;
import com.ky.clothing.enums.SysParamEnum;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Daye
 * 管理员过滤器
 */
public class ManagerFilter implements Filter {

//    private static final String[] unCheckedUrl = {"/lk/admin/login.html", "/lk/admin/login.do"};
    private static List<String> unCheckedUrl;
    static {
        unCheckedUrl = new ArrayList<>();
        unCheckedUrl.add("/lk/admin/login.html");
        unCheckedUrl.add("/lk/admin/login.do");
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        // 获得在下面代码中要用的request,response,session对象
        HttpServletRequest request = (HttpServletRequest) req;
        String servletPath = request.getServletPath();
        User user = (User)request.getSession().getAttribute(SysParamEnum.SESSION_USER_NAME.toString());
        if(user == null || unCheckedUrl.contains(servletPath) || user.getManage()){
            chain.doFilter(req, resp);
        }else{
            request.getRequestDispatcher("/lk/admin/login.html").forward(req, resp);
        }
    }

    @Override
    public void destroy() {

    }
}
