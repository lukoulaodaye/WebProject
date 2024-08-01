package org.nefu.software.webproject.filter;

import entity.News;
import entity.RichText;
import entity.RichTextImage;
import entity.RichTextParagraph;
import utils.NewsSourceManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import utils.DataSourceUtil;

import java.io.IOException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "indexServlet", value = "/index")
public class IndexServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        RichTextParagraph.register();
        RichTextImage.register();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        NewsSourceManager newsSourceManager;
        List<News> newsList;
        try{
            newsSourceManager = new NewsSourceManager(DataSourceUtil.getConnection());
            newsList = newsSourceManager.getAllNews()
                    .stream()
                    .sorted((n1, n2) -> n2.getPublishDate().compareTo(n1.getPublishDate()))
                    .limit(6)
                    .collect(Collectors.toList());
        }catch (Exception e){
            newsList = new ArrayList<>();
            newsList.add(new News(0, "无法获取新闻", RichText.getEmpty(), Date.from(Instant.now())));
        }

        req.setAttribute("newsBrief", newsList);
        req.getRequestDispatcher("WEB-INF/index.jsp").forward(req, resp);
    }
}
