package org.nefu.software.webproject.filter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebFilter(value = "/*")
public class EncodingFilter extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException, ServletException {
        response.setCharacterEncoding("UTF-8");
        chain.doFilter(request, response);
    }
}
