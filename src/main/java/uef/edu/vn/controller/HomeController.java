package uef.edu.vn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import uef.edu.vn.service.BookService;
import uef.edu.vn.service.ReportService;

@Controller
public class HomeController {
    private final BookService bookService;
    private final ReportService reportService;

    public HomeController(BookService bookService, ReportService reportService) {
        this.bookService = bookService;
        this.reportService = reportService;
    }

    @GetMapping("/")
    public String root() {
        return "redirect:/login";
    }

    @GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("pageTitle", "Trang chủ thư viện");
        model.addAttribute("books", bookService.findAll());
        model.addAttribute("overview", reportService.overview());
        model.addAttribute("body", "home.jsp");
        return "layout/main";
    }
}