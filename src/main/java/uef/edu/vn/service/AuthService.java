package uef.edu.vn.service;

import org.springframework.stereotype.Service;
import uef.edu.vn.model.User;

import java.util.Optional;

@Service
public class AuthService {
    private final UserService userService;

    public AuthService(UserService userService) {
        this.userService = userService;
    }

    public Optional<User> login(String username, String password) {
        return userService.authenticate(username, password);
    }

    public User registerReader(String fullName, String username, String email, String phone) {
        return new User(0, fullName, username, email, phone, "READER", "ACTIVE");
    }
}