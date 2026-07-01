package uef.edu.vn.service;

import org.springframework.stereotype.Service;
import uef.edu.vn.dao.AuthorDAO;
import uef.edu.vn.dao.BookDAO;
import uef.edu.vn.dao.CategoryDAO;
import uef.edu.vn.dao.PublisherDAO;
import uef.edu.vn.model.Author;
import uef.edu.vn.model.Book;
import uef.edu.vn.model.Category;
import uef.edu.vn.model.Publisher;

import java.util.List;

@Service
public class BookService {
    private final BookDAO bookDAO;
    private final CategoryDAO categoryDAO;
    private final AuthorDAO authorDAO;
    private final PublisherDAO publisherDAO;

    public BookService(BookDAO bookDAO, CategoryDAO categoryDAO, AuthorDAO authorDAO, PublisherDAO publisherDAO) {
        this.bookDAO = bookDAO;
        this.categoryDAO = categoryDAO;
        this.authorDAO = authorDAO;
        this.publisherDAO = publisherDAO;
    }

    public List<Book> findAll() {
        return bookDAO.findAll();
    }

    public Book findById(int id) {
        return bookDAO.findById(id).orElseGet(Book::new);
    }

    public void save(Book book) {
        if (book.getAvailableQuantity() > book.getQuantity()) {
            book.setAvailableQuantity(book.getQuantity());
        }

        if (book.getId() > 0) {
            bookDAO.update(book);
            return;
        }

        bookDAO.create(book);
    }

    public void delete(int id) {
        bookDAO.delete(id);
    }

    public List<Category> findCategories() {
        return categoryDAO.findAll();
    }

    public List<Author> findAuthors() {
        return authorDAO.findAll();
    }

    public List<Publisher> findPublishers() {
        return publisherDAO.findAll();
    }
}