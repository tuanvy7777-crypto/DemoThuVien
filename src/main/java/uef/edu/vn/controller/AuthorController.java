package uef.edu.vn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import uef.edu.vn.model.Author;
import uef.edu.vn.service.AuthorService;

@Controller
public class AuthorController {
    private final AuthorService authorService;

    public AuthorController(AuthorService authorService) {
        this.authorService = authorService;
    }

    @GetMapping("/admin/authors")
    public String authors(Model model) {
        model.addAttribute("pageTitle", "Quản lý tác giả");
        model.addAttribute("authors", authorService.findAll());
        model.addAttribute("body", "admin/authors/list.jsp");
        return "layout/main";
    }

    @GetMapping("/admin/authors/create")
    public String create(Model model) {
        model.addAttribute("pageTitle", "Thêm tác giả");
        model.addAttribute("author", new Author());
        model.addAttribute("body", "admin/authors/form.jsp");
        return "layout/main";
    }

    @GetMapping("/admin/authors/edit")
    public String edit(@RequestParam int id, Model model) {
        model.addAttribute("pageTitle", "Cập nhật tác giả");
        model.addAttribute("author", authorService.findById(id));
        model.addAttribute("body", "admin/authors/form.jsp");
        return "layout/main";
    }

    @PostMapping("/admin/authors/save")
    public String save(@ModelAttribute Author author, RedirectAttributes redirectAttributes) {
        authorService.save(author);
        redirectAttributes.addFlashAttribute("success", "Lưu tác giả thành công.");
        return "redirect:/admin/authors";
    }

    @PostMapping("/admin/authors/delete")
    public String delete(@RequestParam int id, RedirectAttributes redirectAttributes) {
        authorService.delete(id);
        redirectAttributes.addFlashAttribute("success", "Xóa tác giả thành công.");
        return "redirect:/admin/authors";
    }
}