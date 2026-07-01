package uef.edu.vn.dao;

import org.springframework.stereotype.Repository;
import uef.edu.vn.config.DBConfig;
import uef.edu.vn.model.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class BookDAO {
    private Connection openConnection() throws SQLException {
        return DBConfig.getConnection();
    }

    public List<Book> findAll() {
        String sql = """
                SELECT b.BookId, b.Title, b.ISBN, b.CategoryId, b.AuthorId, b.PublisherId,
                       COALESCE(c.CategoryName, 'Chưa phân loại') AS CategoryName,
                       COALESCE(a.AuthorName, 'Chưa rõ') AS AuthorName,
                       COALESCE(p.PublisherName, 'Chưa rõ') AS PublisherName,
                       b.PublicationYear, b.Quantity, b.AvailableQuantity, b.CoverImage, b.Description
                FROM Books b
                LEFT JOIN Categories c ON b.CategoryId = c.CategoryId
                LEFT JOIN Authors a ON b.AuthorId = a.AuthorId
                LEFT JOIN Publishers p ON b.PublisherId = p.PublisherId
                ORDER BY b.BookId DESC
                """;
        List<Book> books = new ArrayList<>();
        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                books.add(mapBook(rs));
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load books", ex);
        }
        return books;
    }

    public Optional<Book> findById(int id) {
        String sql = """
                SELECT b.BookId, b.Title, b.ISBN, b.CategoryId, b.AuthorId, b.PublisherId,
                       COALESCE(c.CategoryName, 'Chưa phân loại') AS CategoryName,
                       COALESCE(a.AuthorName, 'Chưa rõ') AS AuthorName,
                       COALESCE(p.PublisherName, 'Chưa rõ') AS PublisherName,
                       b.PublicationYear, b.Quantity, b.AvailableQuantity, b.CoverImage, b.Description
                FROM Books b
                LEFT JOIN Categories c ON b.CategoryId = c.CategoryId
                LEFT JOIN Authors a ON b.AuthorId = a.AuthorId
                LEFT JOIN Publishers p ON b.PublisherId = p.PublisherId
                WHERE b.BookId = ?
                """;
        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapBook(rs));
                }
            }
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot load book", ex);
        }
        return Optional.empty();
    }

    public void create(Book book) {
        String sql = """
                INSERT INTO Books(Title, ISBN, CategoryId, AuthorId, PublisherId, PublicationYear,
                                  Quantity, AvailableQuantity, CoverImage, Description)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                """;
        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            fillStatement(statement, book);
            statement.executeUpdate();
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot create book", ex);
        }
    }

    public void update(Book book) {
        String sql = """
                UPDATE Books
                SET Title = ?, ISBN = ?, CategoryId = ?, AuthorId = ?, PublisherId = ?, PublicationYear = ?,
                    Quantity = ?, AvailableQuantity = ?, CoverImage = ?, Description = ?
                WHERE BookId = ?
                """;
        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            fillStatement(statement, book);
            statement.setInt(11, book.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot update book", ex);
        }
    }

    public void delete(int id) {
        try (Connection connection = openConnection();
             PreparedStatement statement = connection.prepareStatement("DELETE FROM Books WHERE BookId = ?")) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            throw new IllegalStateException("Cannot delete book", ex);
        }
    }

    private void fillStatement(PreparedStatement statement, Book book) throws SQLException {
        statement.setString(1, book.getTitle());
        statement.setString(2, book.getIsbn());
        statement.setObject(3, nullableId(book.getCategoryId()));
        statement.setObject(4, nullableId(book.getAuthorId()));
        statement.setObject(5, nullableId(book.getPublisherId()));
        statement.setInt(6, book.getPublicationYear());
        statement.setInt(7, book.getQuantity());
        statement.setInt(8, book.getAvailableQuantity());
        statement.setString(9, book.getCoverImage());
        statement.setString(10, book.getDescription());
    }

    private Integer nullableId(int value) {
        return value <= 0 ? null : value;
    }

    private Book mapBook(ResultSet rs) throws SQLException {
        return new Book(
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
        );
    }
}