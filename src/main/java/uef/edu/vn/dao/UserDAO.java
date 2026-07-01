package uef.edu.vn.dao;

import org.springframework.stereotype.Repository;
import uef.edu.vn.config.DBConfig;
import uef.edu.vn.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class UserDAO {
    private Connection openConnection() throws SQLException {
        return DBConfig.getConnection();
    }

    public Optional<User> findByUsernameAndPassword(String username, String password) {
        String sql = """
                SELECT u.UserId, u.FullName, u.Username, u.Email, u.Phone, u.Address, u.Status, r.RoleName
                FROM Users u
                JOIN UserRoles ur ON u.UserId = ur.UserId
                JOIN Roles r ON ur.RoleId = r.RoleId
                WHERE u.Username = ? AND u.Password = ? AND u.Status = 'ACTIVE'
                LIMIT 1
                """;

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            statement.setString(2, password);

            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapUser(rs));
                }
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot authenticate user", ex);
        }

        return Optional.empty();
    }

    public List<User> findAll() {
        String sql = """
                SELECT u.UserId, u.FullName, u.Username, u.Email, u.Phone, u.Address, u.Status,
                       COALESCE(r.RoleName, 'READER') AS RoleName
                FROM Users u
                LEFT JOIN UserRoles ur ON u.UserId = ur.UserId
                LEFT JOIN Roles r ON ur.RoleId = r.RoleId
                ORDER BY u.UserId DESC
                """;
        List<User> users = new ArrayList<>();

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                users.add(mapUser(rs));
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load users", ex);
        }

        return users;
    }

    public Optional<User> findById(int id) {
        String sql = """
                SELECT u.UserId, u.FullName, u.Username, u.Email, u.Phone, u.Address, u.Status,
                       COALESCE(r.RoleName, 'READER') AS RoleName
                FROM Users u
                LEFT JOIN UserRoles ur ON u.UserId = ur.UserId
                LEFT JOIN Roles r ON ur.RoleId = r.RoleId
                WHERE u.UserId = ?
                """;

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);

            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapUser(rs));
                }
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load user", ex);
        }

        return Optional.empty();
    }

    public void create(User user) {
        String sql = """
                INSERT INTO Users(FullName, Username, Password, Email, Phone, Address, Status)
                VALUES (?, ?, ?, ?, ?, ?, ?)
                """;

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            fillUserStatement(statement, user, true);
            statement.executeUpdate();

            try (ResultSet keys = statement.getGeneratedKeys()) {
                if (keys.next()) {
                    setUserRole(connection, keys.getInt(1), user.getRole());
                }
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot create user", ex);
        }
    }

    public void update(User user) {
        String sql = """
                UPDATE Users
                SET FullName = ?, Username = ?, Email = ?, Phone = ?, Address = ?, Status = ?
                WHERE UserId = ?
                """;

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getFullName());
            statement.setString(2, user.getUsername());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPhone());
            statement.setString(5, user.getAddress());
            statement.setString(6, user.getStatus());
            statement.setInt(7, user.getId());
            statement.executeUpdate();
            setUserRole(connection, user.getId(), user.getRole());
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot update user", ex);
        }
    }

    public void delete(int id) {
        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement("DELETE FROM Users WHERE UserId = ?")) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot delete user", ex);
        }
    }

    private void fillUserStatement(PreparedStatement statement, User user, boolean includePassword) throws SQLException {
        statement.setString(1, user.getFullName());
        statement.setString(2, user.getUsername());
        statement.setString(3, includePassword ? defaultPassword(user.getPassword()) : user.getPassword());
        statement.setString(4, user.getEmail());
        statement.setString(5, user.getPhone());
        statement.setString(6, user.getAddress());
        statement.setString(7, user.getStatus());
    }

    private String defaultPassword(String password) {
        return password == null || password.isBlank() ? "123456" : password;
    }

    private void setUserRole(Connection connection, int userId, String roleName) throws SQLException {
        int roleId = findRoleId(connection, roleName);

        try (PreparedStatement delete = connection.prepareStatement("DELETE FROM UserRoles WHERE UserId = ?")) {
            delete.setInt(1, userId);
            delete.executeUpdate();
        }

        try (PreparedStatement insert = connection.prepareStatement("INSERT INTO UserRoles(UserId, RoleId) VALUES (?, ?)")) {
            insert.setInt(1, userId);
            insert.setInt(2, roleId);
            insert.executeUpdate();
        }
    }

    private int findRoleId(Connection connection, String roleName) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement("SELECT RoleId FROM Roles WHERE RoleName = ?")) {
            statement.setString(1, normalizeRole(roleName));

            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("RoleId");
                }
            }
        }

        return 3;
    }

    private User mapUser(ResultSet rs) throws SQLException {
        User user = new User(
                rs.getInt("UserId"),
                rs.getString("FullName"),
                rs.getString("Username"),
                rs.getString("Email"),
                rs.getString("Phone"),
                rs.getString("RoleName"),
                rs.getString("Status")
        );
        user.setAddress(rs.getString("Address"));
        user.setRole(normalizeRole(user.getRole()));
        return user;
    }

    private String normalizeRole(String roleName) {
        return roleName == null || roleName.isBlank() ? "READER" : roleName.trim().toUpperCase();
    }
}
