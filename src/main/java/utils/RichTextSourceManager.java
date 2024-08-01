package utils;

import entity.RichText;
import entity.RichTextElement;

import java.sql.*;

public class RichTextSourceManager {
    private Connection connection;

    public RichTextSourceManager(Connection connection) throws SQLException {
        this.connection = connection;
        initialize();
    }

    private void initialize() throws SQLException {
        String sql = "create table if not exists RichText(id integer AUTO_INCREMENT, newsId integer, type integer, content text, primary key (id, newsId))";
        try (Statement stmt = connection.createStatement()) {
            stmt.execute(sql);
        }
    }

    public void insertRichText(RichText richText) throws SQLException {
        String sql = "insert into RichText values(null,?,?,?)";
        for (RichTextElement r : richText.getAllElements()) {
            try (PreparedStatement stmt = connection.prepareStatement(sql)) {
                stmt.setInt(1, richText.getId());
                int type = r.getTypeIdentifier();
                stmt.setInt(2, type);
                stmt.setString(3, r.getSaveString());
                stmt.executeUpdate();
            }
        }
    }

    public RichText getRichText(int id) throws SQLException {
        String sql = "select * from RichText where newsId = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                RichText richText = new RichText(id);
                while (rs.next()) {
                    int type = rs.getInt("type");
                    String saveString = rs.getString("content");
                    RichTextElement element = RichTextElement.getInstance(type);
                    if (element == null) continue;
                    element.fromSaveString(saveString);
                    try {
                        richText.addElement(element);
                    } catch (IllegalAccessException ignored) {
                    }
                }
                return richText;
            }
        }
    }

    public boolean checkRichTextExists(int id) throws SQLException {
        String sql = "select count(*) from RichText where newsId = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) != 0;
                }
            }
        }

        return false;
    }

    public void removeRichText(int id) throws SQLException {
        String sql = "delete from RichText where newsId = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}
