package com.lab2;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = "/*")
public class LogFilter implements Filter {
    private static final Logger logger = LoggerFactory.getLogger(LogFilter.class);
    private int requestCounter;

    public void init(FilterConfig config) {
        requestCounter = 0;
        logger.debug("Server successfully started");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        logger.debug("{} {} total requests={}", httpServletRequest.getMethod(), httpServletRequest.getRequestURI(),
                ++requestCounter);
        if (!checkAccess(httpServletRequest.getRequestURI())) {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath());
        } else {
            chain.doFilter(request, response);
        }
    }

    private boolean checkAccess(String url) {
        String[] invalidUrls = {"AreaCheckServlet"};
        for (String invalidUrl : invalidUrls) {
            if (url.endsWith(invalidUrl)) {
                return false;
            }
        }
        return true;
    }
}
