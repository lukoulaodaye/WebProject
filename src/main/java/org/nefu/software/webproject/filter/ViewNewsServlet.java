package org.nefu.software.webproject.filter;

import entity.News;
import utils.NewsSourceManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.DataSourceUtil;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "viewNews", value = "/news")
public class ViewNewsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        NewsSourceManager manager;
        News news;
        List<News> oldNews;
        int id;
        try {
            manager = new NewsSourceManager(DataSourceUtil.getConnection());
            id = Integer.parseInt(req.getParameter("id"));
            news = manager.queryNews(id);
            oldNews = manager.getAllNews()
                    .stream()
                    .filter(n -> n.getPublishDate()
                            .before(news.getPublishDate()))
                    .sorted((n1, n2) -> n2.getPublishDate().compareTo(n1.getPublishDate()))
                    .limit(5)
                    .collect(Collectors.toList());
            if (news == null) {
                resp.sendRedirect(req.getContextPath() + "/index");
                return;
            }
        } catch (SQLException e) {
            resp.sendRedirect(req.getContextPath() + "/index");
            return;
        }

        req.setAttribute("targetNews", news);
        req.setAttribute("otherNews", oldNews);
        req.getRequestDispatcher("WEB-INF/news.jsp").forward(req, resp);
    }
}
