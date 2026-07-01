package uef.edu.vn.service;

import org.springframework.stereotype.Service;
import uef.edu.vn.dao.AuthorDAO;
import uef.edu.vn.model.Author;

import java.util.List;

@Service
public class AuthorService {
    private final AuthorDAO authorDAO;

    public AuthorService(AuthorDAO authorDAO) {
        this.authorDAO = authorDAO;
    }

    public List<Author> findAll() {
        return authorDAO.findAll();
    }

    public Author findById(int id) {
        return authorDAO.findById(id).orElseGet(Author::new);
    }

    public void save(Author author) {
        if (author.getId() > 0) {
            authorDAO.update(author);
            return;
        }

        authorDAO.create(author);
    }

    public void delete(int id) {
        authorDAO.delete(id);
    }
}