package uef.edu.vn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import uef.edu.vn.model.Category;
import uef.edu.vn.service.CategoryService;

@Controller
public class CategoryController {
    private final CategoryService categoryService;

    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping("/admin/categories")
    public String categories(Model model) {
        model.addAttribute("pageTitle", "Quản lý thể loại");
        model.addAttribute("categories", categoryService.findAll());
        model.addAttribute("body", "admin/categories/list.jsp");
        return "layout/main";
    }

    @GetMapping("/admin/categories/create")
    public String create(Model model) {
        model.addAttribute("pageTitle", "Thêm thể loại");
        model.addAttribute("category", new Category());
        model.addAttribute("body", "admin/categories/form.jsp");
        return "layout/main";
    }

    @GetMapping("/admin/categories/edit")
    public String edit(@RequestParam int id, Model model) {
        model.addAttribute("pageTitle", "Cập nhật thể loại");
        model.addAttribute("category", categoryService.findById(id));
        model.addAttribute("body", "admin/categories/form.jsp");
        return "layout/main";
    }

    @PostMapping("/admin/categories/save")
    public String save(@ModelAttribute Category category, RedirectAttributes redirectAttributes) {
        categoryService.save(category);
        redirectAttributes.addFlashAttribute("success", "Lưu thể loại thành công.");
        return "redirect:/admin/categories";
    }

    @PostMapping("/admin/categories/delete")
    public String delete(@RequestParam int id, RedirectAttributes redirectAttributes) {
        categoryService.delete(id);
        redirectAttributes.addFlashAttribute("success", "Xóa thể loại thành công.");
        return "redirect:/admin/categories";
    }
}