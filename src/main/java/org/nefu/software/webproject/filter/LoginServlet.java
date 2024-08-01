package org.nefu.software.webproject.filter;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Base64;

@WebServlet(name = "loginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private byte[] adminInSha256;
    @Override
    public void init() throws ServletException {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            adminInSha256 = digest.digest("admin".getBytes(StandardCharsets.UTF_8));
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Base64.Decoder b64 = Base64.getDecoder();
        byte[] passInSha256 = b64.decode(password);



        if(username.equals("admin") && Arrays.equals(adminInSha256, passInSha256)) {
            req.getSession().setAttribute("username", username);
            if("XMLHttpRequest".equals(req.getHeader("X-Requested-With"))){
                //处理AJAX请求，设置响应头信息
                resp.setHeader("REDIRECT", "REDIRECT");
                //需要跳转页面的URL
                resp.setHeader("CONTEXT PATH", req.getContextPath() + "/admin");
            }
            else{
                resp.sendRedirect(req.getContextPath() + "/admin");
            }
        }
        else{
            resp.sendRedirect(req.getContextPath() + "/login");
        }
    }
}
