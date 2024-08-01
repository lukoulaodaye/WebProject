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

@WebServlet(name = "recentNewsServlet", value = "/recentNews")
public class RecentNewsServlet extends HttpServlet {
    private List<News> news;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        loadNews();
        int totalPageCount = news.size() / 5 + 1;
        String pageStr = req.getParameter("p");
        int page;
        if (pageStr != null) {
            page = Integer.parseInt(pageStr);
            if (page < 1 || page > totalPageCount) {
                resp.sendRedirect(req.getContextPath() + "/recentNews?p=1");
                return;
            }
        } else {
            page = 1;
        }

        int left = Math.max((page - 1) * 5, 0);
        int right = Math.min(page * 5, news.size());
        req.setAttribute("news", news.subList(left, right));
        req.setAttribute("totalPage", totalPageCount);
        req.setAttribute("currentPage", page);
        req.getRequestDispatcher("/WEB-INF/recentNews.jsp").forward(req, resp);
    }

    private void loadNews(){
        try {
            NewsSourceManager manager = new NewsSourceManager(DataSourceUtil.getConnection());
            news = manager.getAllNews()
                    .stream()
                    .sorted((n1, n2) -> n2.getPublishDate().compareTo(n1.getPublishDate()))
                    .collect(Collectors.toList());
        } catch (SQLException e) {

        }
    }
}
