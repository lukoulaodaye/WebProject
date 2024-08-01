package utils;

import entity.News;
import entity.RichText;
import jakarta.annotation.Nullable;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class NewsSourceManager {
    private Connection _connection;

    public NewsSourceManager(Connection connection) throws SQLException {
        _connection = connection;
        initialize();
    }

    private void initialize() throws SQLException {
        String create = "create table if not exists News(id integer primary key, title varchar(200), publishDate bigint);";
        Statement statement = _connection.createStatement();
        statement.executeUpdate(create);
        statement.close();
    }

    public void insertNews(News news) throws SQLException {
        String insert = "insert into News values(?,?,?)";
        PreparedStatement statement = _connection.prepareStatement(insert);
        statement.setInt(1, news.getId());
        statement.setString(2, news.getTitle());
        statement.setLong(3, news.getPublishDate().getTime());

        statement.executeUpdate();
        statement.close();

        saveRichText(news.getRichText(), null);
    }

    public List<News> getAllNews() throws SQLException {
        String select = "select * from News";
        PreparedStatement statement = _connection.prepareStatement(select);
        ResultSet resultSet = statement.executeQuery();
        List<News> newsList = new ArrayList<News>();
        RichTextSourceManager manager = new RichTextSourceManager(_connection);
        while (resultSet.next()) {
            int id = resultSet.getInt(1);
            String title = resultSet.getString(2);
            Date publishDate = new Date(resultSet.getLong(3));
            News news = new News(id, title, readRichText(id, manager), publishDate);
            newsList.add(news);
        }
        resultSet.close();
        statement.close();
        return newsList;
    }

    public News queryNews(int id) throws SQLException {
        String select = "select * from News where id = ?";
        PreparedStatement statement = _connection.prepareStatement(select);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        News news = null;
        if (resultSet.next()) {
            String title = resultSet.getString(2);
            Date publishDate = new Date(resultSet.getLong(3));
            news = new News(id, title, readRichText(id, null), publishDate);
        }
        resultSet.close();
        statement.close();
        return news;
    }

    public void updateNews(News news, int id) throws SQLException {
        String update = "update News set title = ?, publishDate = ? where id = ?";
        PreparedStatement statement = _connection.prepareStatement(update);
        statement.setString(1, news.getTitle());
        statement.setLong(2, news.getPublishDate().getTime());
        statement.setInt(3, id);
        statement.executeUpdate();
        statement.close();

        saveRichText(news.getRichText(), null);
    }

    public void deleteNews(int id) throws SQLException {
        String delete = "delete from News where id = ?";
        PreparedStatement statement = _connection.prepareStatement(delete);
        statement.setInt(1, id);
        statement.executeUpdate();
        statement.close();
    }

    public int getNextId() throws SQLException {
        String query = "select max(id) from News";
        try(Statement statement = _connection.createStatement()) {
            try(ResultSet resultSet = statement.executeQuery(query)) {
                if(resultSet.next()) {
                    return resultSet.getInt(1) + 1;
                }
            }
        }

        return -1;
    }

    private RichText readRichText(int id, @Nullable RichTextSourceManager richTextSourceManager) throws SQLException {
        if(richTextSourceManager == null){
            richTextSourceManager = new RichTextSourceManager(_connection);
        }
        if(!richTextSourceManager.checkRichTextExists(id)){
            return RichText.getEmpty();
        }
        return richTextSourceManager.getRichText(id);
    }

    private void saveRichText(RichText richText, @Nullable RichTextSourceManager richTextSourceManager) throws SQLException {
        if(richTextSourceManager == null){
            richTextSourceManager = new RichTextSourceManager(_connection);
        }
        if(richTextSourceManager.checkRichTextExists(richText.getId())){
            richTextSourceManager.removeRichText(richText.getId());
        }
        richTextSourceManager.insertRichText(richText);
    }
}
