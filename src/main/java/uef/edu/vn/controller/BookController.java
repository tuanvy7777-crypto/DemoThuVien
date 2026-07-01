package uef.edu.vn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import uef.edu.vn.service.BookService;

@Controller
public class BookController {
    private final BookService bookService;

    public BookController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/books")
    public String list(Model model) {
        model.addAttribute("pageTitle", "Kho sách");
        model.addAttribute("books", bookService.findAll());
        model.addAttribute("body", "books/book-list.jsp");
        return "layout/main";
    }

    @GetMapping("/books/detail")
    public String detail(@RequestParam(defaultValue = "1") int id, Model model) {
        model.addAttribute("pageTitle", "Chi tiết sách");
        model.addAttribute("book", bookService.findById(id));
        model.addAttribute("body", "books/book-detail.jsp");
        return "layout/main";
    }

    @GetMapping("/books/search")
    public String search(Model model) {
        model.addAttribute("pageTitle", "Tìm kiếm sách");
        model.addAttribute("books", bookService.findAll());
        model.addAttribute("body", "books/search-book.jsp");
        return "layout/main";
    }

    @GetMapping("/books/category")
    public String category(Model model) {
        model.addAttribute("pageTitle", "Sách theo thể loại");
        model.addAttribute("categories", bookService.findCategories());
        model.addAttribute("books", bookService.findAll());
        model.addAttribute("body", "books/category-books.jsp");
        return "layout/main";
    }
}