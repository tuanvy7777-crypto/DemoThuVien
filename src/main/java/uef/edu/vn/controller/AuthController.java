package uef.edu.vn.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import uef.edu.vn.model.User;
import uef.edu.vn.service.AuthService;

import java.util.Optional;

@Controller
public class AuthController {

    private final AuthService authService;

    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @GetMapping("/login")
    public String login() {
        return "auth/login";
    }

    @PostMapping("/login")
    public String doLogin(@RequestParam String username,
            @RequestParam String password,
            HttpSession session,
            Model model) {

        Optional<User> user = authService.login(username, password);

        if (user.isEmpty()) {
            model.addAttribute(
                    "error",
                    "Username or password is incorrect, or the account is locked."
            );
            return "auth/login";
        }

        User currentUser = user.get();

        if (currentUser.getRole() == null
                || currentUser.getRole().trim().isEmpty()) {

            model.addAttribute(
                    "error",
                    "This account has not been assigned a role."
            );

            return "auth/login";
        }

        currentUser.setRole(currentUser.getRole().trim().toUpperCase());
        session.setAttribute("currentUser", currentUser);
        session.setAttribute("currentRole", currentUser.getRole());

        System.out.println("===== LOGIN SUCCESS =====");
        System.out.println("Username : " + currentUser.getUsername());
        System.out.println("Role     : " + currentUser.getRole());
        System.out.println("=========================");

        switch (currentUser.getRole()) {

            case "ADMIN":
                return "redirect:/admin/dashboard";

            case "LIBRARIAN":
                return "redirect:/librarian/dashboard";

            case "READER":
                return "redirect:/reader/dashboard";

            default:
                model.addAttribute(
                        "error",
                        "Invalid role: " + currentUser.getRole()
                );
                session.invalidate();
                return "auth/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    @GetMapping("/register")
    public String register() {
        return "auth/register";
    }

    @GetMapping("/forgot-password")
    public String forgotPassword() {
        return "auth/forgot-password";
    }

}
