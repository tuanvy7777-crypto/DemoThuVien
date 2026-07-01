package uef.edu.vn.dao;

import org.springframework.stereotype.Repository;
import uef.edu.vn.config.DBConfig;
import uef.edu.vn.model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class CategoryDAO {
    private Connection openConnection() throws SQLException {
        return DBConfig.getConnection();
    }

    public List<Category> findAll() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT CategoryId, CategoryName, Description FROM Categories ORDER BY CategoryId DESC";

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                categories.add(mapCategory(rs));
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load categories", ex);
        }

        return categories;
    }

    public Optional<Category> findById(int id) {
        String sql = "SELECT CategoryId, CategoryName, Description FROM Categories WHERE CategoryId = ?";

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);

            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapCategory(rs));
                }
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load category", ex);
        }

        return Optional.empty();
    }

    public void create(Category category) {
        String sql = "INSERT INTO Categories(CategoryName, Description) VALUES (?, ?)";

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, category.getName());
            statement.setString(2, category.getDescription());
            statement.executeUpdate();
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot create category", ex);
        }
    }

    public void update(Category category) {
        String sql = "UPDATE Categories SET CategoryName = ?, Description = ? WHERE CategoryId = ?";

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, category.getName());
            statement.setString(2, category.getDescription());
            statement.setInt(3, category.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot update category", ex);
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM Categories WHERE CategoryId = ?";

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot delete category", ex);
        }
    }

    private Category mapCategory(ResultSet rs) throws SQLException {
        return new Category(
                rs.getInt("CategoryId"),
                rs.getString("CategoryName"),
                rs.getString("Description")
        );
    }
}