package com.ky.clothing.filter;

import com.ky.clothing.enums.SysParamEnum;

import javax.servlet.*;
import java.io.IOException;

/**
 * @author Daye
 * 非法字符过滤
 */
public class IllegalCharacterFilter implements Filter {
    private String[] characterParams = null;

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        java.util.Enumeration params = request.getParameterNames();
        String param;
        String paramValue;
        boolean status = false;
        while (params.hasMoreElements()) {
            // 这里原代码是用的   String[] 接的数据，这样会造成一些非法字符  <，> 等，这些都是无法转换的！造成是空
            param = (String) params.nextElement();
            String values = request.getParameter(param);
            paramValue = "";
            //过滤字符串为0个时 不对字符过滤
            paramValue = paramValue + values;
            for (String character : characterParams) {
                if (paramValue.contains(character)) {
                    status = true;
                    break;
                }
            }
        }
        if (status) {
            request.setAttribute(SysParamEnum.ERROR_MSG_NAME.toString(), "存在非法字符");
            request.getRequestDispatcher("/WEB-INF/pages/500.jsp").forward(request, response);
        } else {
            chain.doFilter(request, response);
        }
    }

    @Override
    public void init(FilterConfig config) throws ServletException {
        this.characterParams = config.getInitParameter(SysParamEnum.CHARACTER_FILTER_PARAMS_NAME.toString()).split(",");
    }

}
