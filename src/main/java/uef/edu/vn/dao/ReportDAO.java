package uef.edu.vn.dao;

import org.springframework.stereotype.Repository;
import uef.edu.vn.config.DBConfig;
import uef.edu.vn.model.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ReportDAO {
    private Connection openConnection() throws SQLException {
        return DBConfig.getConnection();
    }

    public Map<String, Integer> overview() {
        Map<String, Integer> data = new LinkedHashMap<>();
        data.put("Sach", count("SELECT COUNT(*) FROM Books"));
        data.put("Nguoi dung", count("SELECT COUNT(*) FROM Users"));
        data.put("The loai", count("SELECT COUNT(*) FROM Categories"));
        data.put("Phieu muon", count("SELECT COUNT(*) FROM BorrowRecords"));
        return data;
    }

    public Map<String, Integer> monthlyBorrowStats() {
        String sql = """
                SELECT MONTH(BorrowDate) AS BorrowMonth, COUNT(*) AS Total
                FROM BorrowRecords
                WHERE YEAR(BorrowDate) = YEAR(CURRENT_DATE)
                GROUP BY MONTH(BorrowDate)
                """;
        Map<String, Integer> data = new LinkedHashMap<>();
        for (int month = 1; month <= 12; month++) {
            data.put("Thang " + month, 0);
        }

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                data.put("Thang " + rs.getInt("BorrowMonth"), rs.getInt("Total"));
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load monthly borrow stats", ex);
        }

        return data;
    }

    public List<Book> mostBorrowedBooks(int limit) {
        String sql = """
                SELECT b.BookId, b.Title, b.ISBN, b.CategoryId, b.AuthorId, b.PublisherId,
                       COALESCE(c.CategoryName, 'Chua phan loai') AS CategoryName,
                       COALESCE(a.AuthorName, 'Chua ro') AS AuthorName,
                       COALESCE(p.PublisherName, 'Chua ro') AS PublisherName,
                       b.PublicationYear, b.Quantity, b.AvailableQuantity, b.CoverImage, b.Description,
                       COUNT(br.BorrowId) AS BorrowCount
                FROM Books b
                LEFT JOIN BorrowRecords br ON b.BookId = br.BookId
                LEFT JOIN Categories c ON b.CategoryId = c.CategoryId
                LEFT JOIN Authors a ON b.AuthorId = a.AuthorId
                LEFT JOIN Publishers p ON b.PublisherId = p.PublisherId
                GROUP BY b.BookId, b.Title, b.ISBN, b.CategoryId, b.AuthorId, b.PublisherId,
                         c.CategoryName, a.AuthorName, p.PublisherName, b.PublicationYear,
                         b.Quantity, b.AvailableQuantity, b.CoverImage, b.Description
                ORDER BY BorrowCount DESC, b.BookId DESC
                LIMIT ?
                """;
        List<Book> books = new ArrayList<>();

        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, limit);

            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    books.add(new Book(
                            rs.getInt("BookId"),
                            rs.getString("Title"),
                            rs.getString("ISBN"),
                            rs.getInt("CategoryId"),
                            rs.getInt("AuthorId"),
                            rs.getInt("PublisherId"),
                            rs.getString("CategoryName"),
                            rs.getString("AuthorName"),
                            rs.getString("PublisherName"),
                            rs.getInt("PublicationYear"),
                            rs.getInt("Quantity"),
                            rs.getInt("AvailableQuantity"),
                            rs.getString("CoverImage"),
                            rs.getString("Description")
                    ));
                }
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load most borrowed books", ex);
        }

        return books;
    }

    public int countReaders() {
        return count("""
                SELECT COUNT(DISTINCT u.UserId)
                FROM Users u
                JOIN UserRoles ur ON u.UserId = ur.UserId
                JOIN Roles r ON ur.RoleId = r.RoleId
                WHERE r.RoleName = 'READER' AND u.Status = 'ACTIVE'
                """);
    }

    public int countLowStockBooks() {
        return count("SELECT COUNT(*) FROM Books WHERE AvailableQuantity <= 2");
    }

    private int count(String sql) {
        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            return rs.next() ? rs.getInt(1) : 0;
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load report count", ex);
        }
    }
}
