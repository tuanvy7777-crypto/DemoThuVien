package uef.edu.vn.dao;

import org.springframework.stereotype.Repository;
import uef.edu.vn.config.DBConfig;
import uef.edu.vn.model.Notification;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class NotificationDAO {
    private Connection openConnection() throws SQLException {
        return DBConfig.getConnection();
    }

    public List<Notification> findByUserId(int userId) {
        String sql = """
                SELECT NotificationId, Title, Message, Status
                FROM Notifications
                WHERE UserId = ?
                ORDER BY SentDate DESC, NotificationId DESC
                """;
        List<Notification> notifications = new ArrayList<>();

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);

            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    notifications.add(new Notification(
                            rs.getInt("NotificationId"),
                            rs.getString("Title"),
                            rs.getString("Message"),
                            rs.getString("Status")
                    ));
                }
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load notifications", ex);
        }

        return notifications;
    }

    public int countByUserId(int userId) {
        String sql = "SELECT COUNT(*) FROM Notifications WHERE UserId = ?";

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);

            try (ResultSet rs = statement.executeQuery()) {
                return rs.next() ? rs.getInt(1) : 0;
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot count notifications", ex);
        }
    }
}
