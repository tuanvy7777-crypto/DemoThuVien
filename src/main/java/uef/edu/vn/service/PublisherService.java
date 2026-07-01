package uef.edu.vn.service;

import org.springframework.stereotype.Service;
import uef.edu.vn.dao.PublisherDAO;
import uef.edu.vn.model.Publisher;

import java.util.List;

@Service
public class PublisherService {
    private final PublisherDAO publisherDAO;

    public PublisherService(PublisherDAO publisherDAO) {
        this.publisherDAO = publisherDAO;
    }

    public List<Publisher> findAll() {
        return publisherDAO.findAll();
    }

    public Publisher findById(int id) {
        return publisherDAO.findById(id).orElseGet(Publisher::new);
    }

    public void save(Publisher publisher) {
        if (publisher.getId() > 0) {
            publisherDAO.update(publisher);
            return;
        }

        publisherDAO.create(publisher);
    }

    public void delete(int id) {
        publisherDAO.delete(id);
    }
}