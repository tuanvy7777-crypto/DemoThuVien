package uef.edu.vn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import uef.edu.vn.model.User;
import uef.edu.vn.service.UserService;

@Controller
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin/users")
    public String adminUsers(Model model) {
        model.addAttribute("pageTitle", "Quản lý người dùng");
        model.addAttribute("users", userService.findAll());
        model.addAttribute("body", "admin/users/list.jsp");
        return "layout/main";
    }

    @GetMapping("/admin/users/create")
    public String create(Model model) {
        model.addAttribute("pageTitle", "Thêm người dùng");
        model.addAttribute("user", new User());
        model.addAttribute("body", "admin/users/form.jsp");
        return "layout/main";
    }

    @GetMapping("/admin/users/edit")
    public String edit(@RequestParam int id, Model model) {
        model.addAttribute("pageTitle", "Cập nhật người dùng");
        model.addAttribute("user", userService.findById(id));
        model.addAttribute("body", "admin/users/form.jsp");
        return "layout/main";
    }

    @PostMapping("/admin/users/save")
    public String save(@ModelAttribute User user, RedirectAttributes redirectAttributes) {
        userService.save(user);
        redirectAttributes.addFlashAttribute("success", "Lưu người dùng thành công.");
        return "redirect:/admin/users";
    }

    @PostMapping("/admin/users/delete")
    public String delete(@RequestParam int id, RedirectAttributes redirectAttributes) {
        userService.delete(id);
        redirectAttributes.addFlashAttribute("success", "Xóa người dùng thành công.");
        return "redirect:/admin/users";
    }

    @GetMapping("/reader/profile")
    public String profile(Model model) {
        model.addAttribute("pageTitle", "Hồ sơ độc giả");
        model.addAttribute("users", userService.findAll());
        model.addAttribute("body", "reader/profile.jsp");
        return "layout/main";
    }
}