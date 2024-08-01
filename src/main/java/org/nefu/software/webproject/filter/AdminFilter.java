package org.nefu.software.webproject.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Objects;

@WebFilter("/admin")
public class AdminFilter extends HttpFilter {
    @Override
    public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain) throws IOException, ServletException {
        if(!"admin".equals(req.getSession().getAttribute("username"))){
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        chain.doFilter(req, resp);
    }
}
