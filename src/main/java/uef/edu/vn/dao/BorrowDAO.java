package uef.edu.vn.dao;

import org.springframework.stereotype.Repository;
import uef.edu.vn.config.DBConfig;
import uef.edu.vn.model.BorrowRecord;
import uef.edu.vn.model.BorrowRequest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Repository
public class BorrowDAO {
    private Connection openConnection() throws SQLException {
        return DBConfig.getConnection();
    }

    public List<BorrowRecord> findRecords() {
        String sql = """
                SELECT br.BorrowId, u.FullName, b.Title, br.BorrowDate, br.DueDate, br.ReturnDate, br.Status
                FROM BorrowRecords br
                JOIN Users u ON br.UserId = u.UserId
                JOIN Books b ON br.BookId = b.BookId
                ORDER BY br.BorrowDate DESC, br.BorrowId DESC
                """;
        return queryRecords(sql);
    }

    public List<BorrowRecord> findRecordsByUserId(int userId) {
        String sql = """
                SELECT br.BorrowId, u.FullName, b.Title, br.BorrowDate, br.DueDate, br.ReturnDate, br.Status
                FROM BorrowRecords br
                JOIN Users u ON br.UserId = u.UserId
                JOIN Books b ON br.BookId = b.BookId
                WHERE br.UserId = ?
                ORDER BY br.BorrowDate DESC, br.BorrowId DESC
                """;
        return queryRecords(sql, userId);
    }

    public List<BorrowRequest> findRequests() {
        String sql = """
                SELECT r.RequestId, u.FullName, b.Title, r.RequestDate, r.Status
                FROM BorrowRequests r
                JOIN Users u ON r.UserId = u.UserId
                JOIN Books b ON r.BookId = b.BookId
                ORDER BY r.RequestDate DESC, r.RequestId DESC
                """;
        return queryRequests(sql);
    }

    public List<BorrowRequest> findRequestsByUserId(int userId) {
        String sql = """
                SELECT r.RequestId, u.FullName, b.Title, r.RequestDate, r.Status
                FROM BorrowRequests r
                JOIN Users u ON r.UserId = u.UserId
                JOIN Books b ON r.BookId = b.BookId
                WHERE r.UserId = ?
                ORDER BY r.RequestDate DESC, r.RequestId DESC
                """;
        return queryRequests(sql, userId);
    }

    public void createRequest(int userId, int bookId, int quantity, String note) {
        String sql = """
                INSERT INTO BorrowRequests(UserId, BookId, Quantity, Note)
                VALUES (?, ?, ?, ?)
                """;

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            statement.setInt(2, bookId);
            statement.setInt(3, Math.max(quantity, 1));
            statement.setString(4, note);
            statement.executeUpdate();
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot create borrow request", ex);
        }
    }

    public void updateRequestStatus(int requestId, int librarianId, String status, String note) {
        String normalizedStatus = status == null ? "" : status.trim().toUpperCase();

        try (Connection connection = openConnection()) {
            connection.setAutoCommit(false);
            RequestInfo request = findRequestInfo(connection, requestId);
            if (request == null || !"PENDING".equalsIgnoreCase(request.status())) {
                connection.rollback();
                return;
            }

            try (PreparedStatement statement = connection.prepareStatement("""
                    UPDATE BorrowRequests
                    SET Status = ?, LibrarianId = ?, ProcessDate = NOW(), Note = COALESCE(NULLIF(?, ''), Note)
                    WHERE RequestId = ?
                    """)) {
                statement.setString(1, normalizedStatus);
                statement.setInt(2, librarianId);
                statement.setString(3, note);
                statement.setInt(4, requestId);
                statement.executeUpdate();
            }

            if ("APPROVED".equals(normalizedStatus)) {
                createBorrowRecord(connection, request);
                decreaseBookStock(connection, request.bookId(), request.quantity());
            }

            connection.commit();
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot update borrow request", ex);
        }
    }

    public int countBorrowing() {
        return count("SELECT COUNT(*) FROM BorrowRecords WHERE Status = 'BORROWING'");
    }

    public int countOverdue() {
        return count("SELECT COUNT(*) FROM BorrowRecords WHERE Status = 'OVERDUE' OR (ReturnDate IS NULL AND DueDate < CURRENT_DATE)");
    }

    public int countTodayBorrows() {
        return count("SELECT COUNT(*) FROM BorrowRecords WHERE BorrowDate = CURRENT_DATE");
    }

    private List<BorrowRecord> queryRecords(String sql, Object... params) {
        List<BorrowRecord> records = new ArrayList<>();

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            fillParams(statement, params);

            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    records.add(new BorrowRecord(
                            rs.getInt("BorrowId"),
                            rs.getString("FullName"),
                            rs.getString("Title"),
                            rs.getDate("BorrowDate").toLocalDate(),
                            rs.getDate("DueDate").toLocalDate(),
                            rs.getDate("ReturnDate") == null ? null : rs.getDate("ReturnDate").toLocalDate(),
                            rs.getString("Status")
                    ));
                }
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load borrow records", ex);
        }

        return records;
    }

    private List<BorrowRequest> queryRequests(String sql, Object... params) {
        List<BorrowRequest> requests = new ArrayList<>();

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            fillParams(statement, params);

            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    requests.add(new BorrowRequest(
                            rs.getInt("RequestId"),
                            rs.getString("FullName"),
                            rs.getString("Title"),
                            rs.getTimestamp("RequestDate").toLocalDateTime(),
                            rs.getString("Status")
                    ));
                }
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load borrow requests", ex);
        }

        return requests;
    }

    private RequestInfo findRequestInfo(Connection connection, int requestId) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement("""
                SELECT RequestId, UserId, BookId, Quantity, Status
                FROM BorrowRequests
                WHERE RequestId = ?
                FOR UPDATE
                """)) {
            statement.setInt(1, requestId);

            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    return new RequestInfo(
                            rs.getInt("RequestId"),
                            rs.getInt("UserId"),
                            rs.getInt("BookId"),
                            rs.getInt("Quantity"),
                            rs.getString("Status")
                    );
                }
            }
        }
        return null;
    }

    private void createBorrowRecord(Connection connection, RequestInfo request) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement("""
                INSERT INTO BorrowRecords(UserId, BookId, BorrowDate, DueDate, Status)
                VALUES (?, ?, ?, ?, 'BORROWING')
                """, Statement.RETURN_GENERATED_KEYS)) {
            LocalDate borrowDate = LocalDate.now();
            statement.setInt(1, request.userId());
            statement.setInt(2, request.bookId());
            statement.setDate(3, java.sql.Date.valueOf(borrowDate));
            statement.setDate(4, java.sql.Date.valueOf(borrowDate.plusDays(14)));
            statement.executeUpdate();
        }
    }

    private void decreaseBookStock(Connection connection, int bookId, int quantity) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement("""
                UPDATE Books
                SET AvailableQuantity = GREATEST(AvailableQuantity - ?, 0)
                WHERE BookId = ?
                """)) {
            statement.setInt(1, Math.max(quantity, 1));
            statement.setInt(2, bookId);
            statement.executeUpdate();
        }
    }

    private void fillParams(PreparedStatement statement, Object... params) throws SQLException {
        for (int i = 0; i < params.length; i++) {
            statement.setObject(i + 1, params[i]);
        }
    }

    private int count(String sql) {
        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            return rs.next() ? rs.getInt(1) : 0;
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot count borrow records", ex);
        }
    }

    private record RequestInfo(int id, int userId, int bookId, int quantity, String status) {
    }
}
