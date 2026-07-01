package uef.edu.vn.dao;

import org.springframework.stereotype.Repository;
import uef.edu.vn.config.DBConfig;
import uef.edu.vn.model.Author;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class AuthorDAO {
    private Connection openConnection() throws SQLException {
        return DBConfig.getConnection();
    }

    public List<Author> findAll() {
        List<Author> authors = new ArrayList<>();
        String sql = "SELECT AuthorId, AuthorName, Nationality FROM Authors ORDER BY AuthorId DESC";

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                authors.add(mapAuthor(rs));
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load authors", ex);
        }

        return authors;
    }

    public Optional<Author> findById(int id) {
        String sql = "SELECT AuthorId, AuthorName, Nationality FROM Authors WHERE AuthorId = ?";

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);

            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapAuthor(rs));
                }
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load author", ex);
        }

        return Optional.empty();
    }

    public void create(Author author) {
        String sql = "INSERT INTO Authors(AuthorName, Nationality) VALUES (?, ?)";

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, author.getName());
            statement.setString(2, author.getNationality());
            statement.executeUpdate();
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot create author", ex);
        }
    }

    public void update(Author author) {
        String sql = "UPDATE Authors SET AuthorName = ?, Nationality = ? WHERE AuthorId = ?";

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, author.getName());
            statement.setString(2, author.getNationality());
            statement.setInt(3, author.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot update author", ex);
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM Authors WHERE AuthorId = ?";

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot delete author", ex);
        }
    }

    private Author mapAuthor(ResultSet rs) throws SQLException {
        return new Author(
                rs.getInt("AuthorId"),
                rs.getString("AuthorName"),
                rs.getString("Nationality")
        );
    }
}