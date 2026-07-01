package uef.edu.vn.dao;

import org.springframework.stereotype.Repository;
import uef.edu.vn.config.DBConfig;
import uef.edu.vn.model.Publisher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class PublisherDAO {
    private Connection openConnection() throws SQLException {
        return DBConfig.getConnection();
    }

    public List<Publisher> findAll() {
        List<Publisher> publishers = new ArrayList<>();
        String sql = "SELECT PublisherId, PublisherName, Email FROM Publishers ORDER BY PublisherId DESC";

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                publishers.add(mapPublisher(rs));
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load publishers", ex);
        }

        return publishers;
    }

    public Optional<Publisher> findById(int id) {
        String sql = "SELECT PublisherId, PublisherName, Email FROM Publishers WHERE PublisherId = ?";

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);

            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapPublisher(rs));
                }
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load publisher", ex);
        }

        return Optional.empty();
    }

    public void create(Publisher publisher) {
        String sql = "INSERT INTO Publishers(PublisherName, Email) VALUES (?, ?)";

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, publisher.getName());
            statement.setString(2, publisher.getEmail());
            statement.executeUpdate();
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot create publisher", ex);
        }
    }

    public void update(Publisher publisher) {
        String sql = "UPDATE Publishers SET PublisherName = ?, Email = ? WHERE PublisherId = ?";

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, publisher.getName());
            statement.setString(2, publisher.getEmail());
            statement.setInt(3, publisher.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot update publisher", ex);
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM Publishers WHERE PublisherId = ?";

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot delete publisher", ex);
        }
    }

    private Publisher mapPublisher(ResultSet rs) throws SQLException {
        return new Publisher(
                rs.getInt("PublisherId"),
                rs.getString("PublisherName"),
                rs.getString("Email")
        );
    }
}