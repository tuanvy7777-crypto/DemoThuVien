package uef.edu.vn.dao;

import org.springframework.stereotype.Repository;
import uef.edu.vn.config.DBConfig;
import uef.edu.vn.model.Fine;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class FineDAO {
    private Connection openConnection() throws SQLException {
        return DBConfig.getConnection();
    }

    public List<Fine> findAll() {
        String sql = """
                SELECT f.FineId, u.FullName, f.Reason, f.Amount, f.Paid
                FROM Fines f
                JOIN BorrowRecords br ON f.BorrowId = br.BorrowId
                JOIN Users u ON br.UserId = u.UserId
                ORDER BY f.CreatedAt DESC, f.FineId DESC
                """;
        return queryFines(sql);
    }

    public List<Fine> findByUserId(int userId) {
        String sql = """
                SELECT f.FineId, u.FullName, f.Reason, f.Amount, f.Paid
                FROM Fines f
                JOIN BorrowRecords br ON f.BorrowId = br.BorrowId
                JOIN Users u ON br.UserId = u.UserId
                WHERE br.UserId = ?
                ORDER BY f.CreatedAt DESC, f.FineId DESC
                """;
        return queryFines(sql, userId);
    }

    public BigDecimal sumAll() {
        return sum("SELECT COALESCE(SUM(Amount), 0) FROM Fines");
    }

    public BigDecimal sumUnpaid() {
        return sum("SELECT COALESCE(SUM(Amount), 0) FROM Fines WHERE Paid = 0");
    }

    public int countAll() {
        return count("SELECT COUNT(*) FROM Fines");
    }

    public void updatePaid(int fineId, boolean paid) {
        String sql = "UPDATE Fines SET Paid = ? WHERE FineId = ?";

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setBoolean(1, paid);
            statement.setInt(2, fineId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot update fine status", ex);
        }
    }

    private List<Fine> queryFines(String sql, Object... params) {
        List<Fine> fines = new ArrayList<>();

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            for (int i = 0; i < params.length; i++) {
                statement.setObject(i + 1, params[i]);
            }

            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    fines.add(new Fine(
                            rs.getInt("FineId"),
                            rs.getString("FullName"),
                            rs.getString("Reason"),
                            rs.getBigDecimal("Amount"),
                            rs.getBoolean("Paid")
                    ));
                }
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load fines", ex);
        }

        return fines;
    }

    private BigDecimal sum(String sql) {
        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            return rs.next() ? rs.getBigDecimal(1) : BigDecimal.ZERO;
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot sum fines", ex);
        }
    }

    private int count(String sql) {
        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            return rs.next() ? rs.getInt(1) : 0;
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot count fines", ex);
        }
    }
}
