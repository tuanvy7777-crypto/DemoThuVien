package uef.edu.vn.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import uef.edu.vn.model.User;
import uef.edu.vn.service.BookService;
import uef.edu.vn.service.BorrowService;

@Controller
public class BorrowController {
    private final BorrowService borrowService;
    private final BookService bookService;

    public BorrowController(BorrowService borrowService, BookService bookService) {
        this.borrowService = borrowService;
        this.bookService = bookService;
    }

    @GetMapping("/borrow/request")
    public String request(@RequestParam(required = false) Integer bookId, Model model, HttpSession session) {
        int userId = currentUserId(session);
        model.addAttribute("pageTitle", "Yeu cau muon sach");
        model.addAttribute("requests", borrowService.findRequestsByUserId(userId));
        model.addAttribute("books", bookService.findAll());
        if (bookId != null && bookId > 0) {
            model.addAttribute("selectedBook", bookService.findById(bookId));
        }
        model.addAttribute("body", "borrow/request-borrow.jsp");
        return "layout/main";
    }

    @PostMapping("/borrow/request")
    public String createRequest(@RequestParam int bookId,
            @RequestParam(defaultValue = "1") int quantity,
            @RequestParam(required = false) String note,
            HttpSession session,
            RedirectAttributes redirectAttributes) {
        borrowService.createRequest(currentUserId(session), bookId, quantity, note);
        redirectAttributes.addFlashAttribute("success", "Da gui yeu cau muon sach.");
        return "redirect:/borrow/request?bookId=" + bookId;
    }

    @PostMapping({"/admin/borrow-requests/status", "/librarian/borrow-requests/status"})
    public String updateRequestStatus(@RequestParam int requestId,
            @RequestParam String status,
            @RequestParam(required = false) String note,
            HttpSession session,
            RedirectAttributes redirectAttributes) {
        borrowService.updateRequestStatus(requestId, currentUserId(session), status, note);
        redirectAttributes.addFlashAttribute("success", "Da cap nhat trang thai yeu cau.");
        return redirectByRole(session);
    }

    @GetMapping("/borrow/list")
    public String list(Model model, HttpSession session) {
        model.addAttribute("pageTitle", "Danh sach muon tra");
        model.addAttribute("records", borrowService.findRecordsByUserId(currentUserId(session)));
        model.addAttribute("body", "borrow/borrow-list.jsp");
        return "layout/main";
    }

    @GetMapping("/borrow/return")
    public String returnBook(Model model, HttpSession session) {
        model.addAttribute("pageTitle", "Tra sach");
        model.addAttribute("records", borrowService.findRecordsByUserId(currentUserId(session)));
        model.addAttribute("body", "borrow/return-book.jsp");
        return "layout/main";
    }

    @GetMapping("/borrow/receipt")
    public String receipt(Model model, HttpSession session) {
        model.addAttribute("pageTitle", "Bien nhan muon sach");
        model.addAttribute("records", borrowService.findRecordsByUserId(currentUserId(session)));
        model.addAttribute("body", "borrow/borrow-receipt.jsp");
        return "layout/main";
    }

    private int currentUserId(HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
        return user == null ? 0 : user.getId();
    }

    private String redirectByRole(HttpSession session) {
        String role = String.valueOf(session.getAttribute("currentRole"));
        if ("ADMIN".equalsIgnoreCase(role)) {
            return "redirect:/admin/borrowings";
        }
        return "redirect:/librarian/borrowings";
    }
}
