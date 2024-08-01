package org.nefu.software.webproject.filter;

import entity.News;
import entity.RichText;
import utils.NewsSourceManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.*;
import utils.DataSourceUtil;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "adminServlet", value = "/admin")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String op = req.getParameter("op");
        if ("manage".equals(op) || "".equals(op) || op == null) {
            try {
                NewsSourceManager newsSourceManager = new NewsSourceManager(DataSourceUtil.getConnection());
                List<News> news = newsSourceManager.getAllNews();

                req.setAttribute("news", news);

            } catch (SQLException e) {
                resp.sendRedirect(req.getContextPath() + "/index");
            }

            req.getRequestDispatcher("/WEB-INF/admin/manage-news.jsp").forward(req, resp);
        } else if ("add".equals(op)) {
            req.setAttribute("id", -1);
            req.setAttribute("mode", "add");
            req.setAttribute("editNews", News.placeholder);
            req.getRequestDispatcher("/WEB-INF/admin/edit-news.jsp").forward(req, resp);
        } else if ("edit".equals(op)) {
            String idStr = req.getParameter("id");
            int id = Integer.parseInt(idStr);

            req.setAttribute("mode", "edit");
            req.setAttribute("id", id);

            try {
                NewsSourceManager newsSourceManager = new NewsSourceManager(DataSourceUtil.getConnection());
                News news = newsSourceManager.queryNews(id);
                req.setAttribute("editNews", news);

            } catch (SQLException e) {
                resp.sendRedirect(req.getContextPath() + "/index");
                return;
            }

            req.getRequestDispatcher("/WEB-INF/admin/edit-news.jsp").forward(req, resp);
        } else if ("delete".equals(op)) {
            String idStr = req.getParameter("id");
            int id = Integer.parseInt(idStr);

            try {
                NewsSourceManager newsSourceManager = new NewsSourceManager(DataSourceUtil.getConnection());
                newsSourceManager.deleteNews(id);
            } catch (SQLException e) {
                resp.sendRedirect(req.getContextPath() + "/index");
            }

            resp.sendRedirect(req.getRequestURI());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String op = req.getParameter("op");
        String idStr = req.getParameter("id");
        String title = req.getParameter("title");
        String dateTimeStr = req.getParameter("publishDate");
        String content = req.getParameter("content");
        Date publishDatetime;
        int id = -1;
        try {
            if (idStr != null) {
                id = Integer.parseInt(idStr);
            }
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            publishDatetime = format.parse(dateTimeStr);
        } catch (Exception ex) {
            PrintWriter out = resp.getWriter();
            out.println("<script>alert('输入错误！')</script>");
            return;
        }

        NewsSourceManager newsSourceManager;
        try {
            newsSourceManager = new NewsSourceManager(DataSourceUtil.getConnection());
            if (id == -1)
                id = newsSourceManager.getNextId();
        } catch (SQLException e) {
            PrintWriter out = resp.getWriter();
            out.println("<script>alert('服务器异常')</script>");
            return;
        }

        RichText richText = new RichText(id);
        try {
            richText.fromFormatString(content);
        } catch (IllegalAccessException ignored) {

        }
        News news = new News(id, title, richText, publishDatetime);


        if ("add".equals(op)) {
            try {
                newsSourceManager.insertNews(news);
            } catch (SQLException e) {
                PrintWriter out = resp.getWriter();
                out.println("<script>alert('发布失败：服务器异常')</script>");
            }

        } else if ("edit".equals(op)) {

            news.setId(id);
            try {
                newsSourceManager.updateNews(news, id);
            } catch (SQLException e) {
                PrintWriter out = resp.getWriter();
                out.println("<script>alert('修改失败：服务器异常')</script>");
            }
        }


        resp.sendRedirect(req.getRequestURI());
    }
}
