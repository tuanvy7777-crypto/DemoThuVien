package uef.edu.vn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import uef.edu.vn.model.Publisher;
import uef.edu.vn.service.PublisherService;

@Controller
public class PublisherController {
    private final PublisherService publisherService;

    public PublisherController(PublisherService publisherService) {
        this.publisherService = publisherService;
    }

    @GetMapping("/admin/publishers")
    public String publishers(Model model) {
        model.addAttribute("pageTitle", "Quản lý nhà xuất bản");
        model.addAttribute("publishers", publisherService.findAll());
        model.addAttribute("body", "admin/publishers/list.jsp");
        return "layout/main";
    }

    @GetMapping("/admin/publishers/create")
    public String create(Model model) {
        model.addAttribute("pageTitle", "Thêm nhà xuất bản");
        model.addAttribute("publisher", new Publisher());
        model.addAttribute("body", "admin/publishers/form.jsp");
        return "layout/main";
    }

    @GetMapping("/admin/publishers/edit")
    public String edit(@RequestParam int id, Model model) {
        model.addAttribute("pageTitle", "Cập nhật nhà xuất bản");
        model.addAttribute("publisher", publisherService.findById(id));
        model.addAttribute("body", "admin/publishers/form.jsp");
        return "layout/main";
    }

    @PostMapping("/admin/publishers/save")
    public String save(@ModelAttribute Publisher publisher, RedirectAttributes redirectAttributes) {
        publisherService.save(publisher);
        redirectAttributes.addFlashAttribute("success", "Lưu nhà xuất bản thành công.");
        return "redirect:/admin/publishers";
    }

    @PostMapping("/admin/publishers/delete")
    public String delete(@RequestParam int id, RedirectAttributes redirectAttributes) {
        publisherService.delete(id);
        redirectAttributes.addFlashAttribute("success", "Xóa nhà xuất bản thành công.");
        return "redirect:/admin/publishers";
    }
}