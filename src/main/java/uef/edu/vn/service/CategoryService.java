package uef.edu.vn.service;

import org.springframework.stereotype.Service;
import uef.edu.vn.dao.CategoryDAO;
import uef.edu.vn.model.Category;

import java.util.List;

@Service
public class CategoryService {
    private final CategoryDAO categoryDAO;

    public CategoryService(CategoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
    }

    public List<Category> findAll() {
        return categoryDAO.findAll();
    }

    public Category findById(int id) {
        return categoryDAO.findById(id).orElseGet(Category::new);
    }

    public void save(Category category) {
        if (category.getId() > 0) {
            categoryDAO.update(category);
            return;
        }

        categoryDAO.create(category);
    }

    public void delete(int id) {
        categoryDAO.delete(id);
    }
}