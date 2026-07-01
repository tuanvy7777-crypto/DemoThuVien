package uef.edu.vn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import uef.edu.vn.model.Book;
import uef.edu.vn.service.BookService;
import uef.edu.vn.service.BorrowService;
import uef.edu.vn.service.ReportService;

@Controller
public class AdminController {
    private final BookService bookService;
    private final BorrowService borrowService;
    private final ReportService reportService;

    public AdminController(BookService bookService, BorrowService borrowService, ReportService reportService) {
        this.bookService = bookService;
        this.borrowService = borrowService;
        this.reportService = reportService;
    }

    @GetMapping("/admin/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("pageTitle", "Dashboard quản trị");
        model.addAttribute("overview", reportService.overview());
        model.addAttribute("body", "admin/dashboard.jsp");
        return "layout/main";
    }

    @GetMapping("/admin/books")
    public String books(Model model) {
        model.addAttribute("pageTitle", "Quản lý sách");
        model.addAttribute("books", bookService.findAll());
        model.addAttribute("body", "admin/books/list.jsp");
        return "layout/main";
    }

    @GetMapping("/admin/books/create")
    public String createBook(Model model) {
        prepareBookForm(model, new Book(), "Thêm sách");
        return "layout/main";
    }

    @GetMapping("/admin/books/edit")
    public String editBook(@RequestParam int id, Model model) {
        prepareBookForm(model, bookService.findById(id), "Cập nhật sách");
        return "layout/main";
    }

    @PostMapping("/admin/books/save")
    public String saveBook(@ModelAttribute Book book, RedirectAttributes redirectAttributes) {
        bookService.save(book);
        redirectAttributes.addFlashAttribute("success", "Lưu sách thành công.");
        return "redirect:/admin/books";
    }

    @PostMapping("/admin/books/delete")
    public String deleteBook(@RequestParam int id, RedirectAttributes redirectAttributes) {
        bookService.delete(id);
        redirectAttributes.addFlashAttribute("success", "Xóa sách thành công.");
        return "redirect:/admin/books";
    }

    @GetMapping({"/admin/borrowings", "/admin/borrowings/approve", "/admin/borrowings/return", "/admin/borrowings/overdue"})
    public String borrowings(Model model) {
        model.addAttribute("pageTitle", "Quản lý phiếu mượn");
        model.addAttribute("records", borrowService.findRecords());
        model.addAttribute("requests", borrowService.findRequests());
        model.addAttribute("body", "admin/borrowings/list.jsp");
        return "layout/main";
    }

    private void prepareBookForm(Model model, Book book, String title) {
        model.addAttribute("pageTitle", title);
        model.addAttribute("book", book);
        model.addAttribute("categories", bookService.findCategories());
        model.addAttribute("authors", bookService.findAuthors());
        model.addAttribute("publishers", bookService.findPublishers());
        model.addAttribute("body", "admin/books/form.jsp");
    }
}