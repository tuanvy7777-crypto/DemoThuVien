package uef.edu.vn.service;

import org.springframework.stereotype.Service;
import uef.edu.vn.dao.UserDAO;
import uef.edu.vn.model.User;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private final UserDAO userDAO;

    public UserService(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public List<User> findAll() {
        return userDAO.findAll();
    }

    public User findById(int id) {
        return userDAO.findById(id).orElseGet(User::new);
    }

    public void save(User user) {
        if (user.getStatus() == null || user.getStatus().isBlank()) {
            user.setStatus("ACTIVE");
        }

        if (user.getRole() == null || user.getRole().isBlank()) {
            user.setRole("READER");
        }

        if (user.getId() > 0) {
            userDAO.update(user);
            return;
        }

        userDAO.create(user);
    }

    public void delete(int id) {
        userDAO.delete(id);
    }

    public Optional<User> authenticate(String username, String password) {
        if (username == null || username.isBlank() || password == null || password.isBlank()) {
            return Optional.empty();
        }
        return userDAO.findByUsernameAndPassword(username.trim(), password);
    }
}