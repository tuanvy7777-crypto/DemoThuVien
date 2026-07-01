package uef.edu.vn.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import uef.edu.vn.model.BorrowRecord;
import uef.edu.vn.model.Fine;
import uef.edu.vn.model.User;
import uef.edu.vn.service.BorrowService;
import uef.edu.vn.service.FineService;
import uef.edu.vn.service.NotificationService;

import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/reader")
public class ReaderController {

    private final BorrowService borrowService;
    private final FineService fineService;
    private final NotificationService notificationService;

    public ReaderController(BorrowService borrowService,
            FineService fineService,
            NotificationService notificationService) {
        this.borrowService = borrowService;
        this.fineService = fineService;
        this.notificationService = notificationService;
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model, HttpSession session) {
        int userId = currentUserId(session);
        List<BorrowRecord> records = borrowService.findRecordsByUserId(userId);
        List<Fine> fines = fineService.findByUserId(userId);

        model.addAttribute("pageTitle", "Dashboard doc gia");
        model.addAttribute("records", records);
        model.addAttribute("borrowedCount", records.stream().filter(record -> "BORROWING".equalsIgnoreCase(record.getStatus())).count());
        model.addAttribute("notificationCount", notificationService.countByUserId(userId));
        model.addAttribute("unpaidFineAmount", fines.stream()
                .filter(fine -> !fine.isPaid())
                .map(Fine::getAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add));
        model.addAttribute("pendingRequestCount", borrowService.findRequests().stream().filter(request -> "PENDING".equalsIgnoreCase(request.getStatus())).count());
        model.addAttribute("body", "reader/dashboard.jsp");
        return "layout/main";
    }

    @GetMapping("/borrowed-books")
    public String borrowedBooks(Model model, HttpSession session) {
        model.addAttribute("pageTitle", "Sach dang muon");
        model.addAttribute("records", borrowService.findRecordsByUserId(currentUserId(session)));
        model.addAttribute("body", "reader/borrowed-books.jsp");
        return "layout/main";
    }

    @GetMapping("/borrowing-history")
    public String borrowingHistory(Model model, HttpSession session) {
        model.addAttribute("pageTitle", "Lich su muon sach");
        model.addAttribute("records", borrowService.findRecordsByUserId(currentUserId(session)));
        model.addAttribute("body", "reader/borrowing-history.jsp");
        return "layout/main";
    }

    @GetMapping("/notifications")
    public String notifications(Model model, HttpSession session) {
        model.addAttribute("pageTitle", "Thong bao");
        model.addAttribute("notifications", notificationService.findByUserId(currentUserId(session)));
        model.addAttribute("body", "reader/notifications.jsp");
        return "layout/main";
    }

    @GetMapping("/fine-details")
    public String fineDetails(Model model, HttpSession session) {
        model.addAttribute("pageTitle", "Chi tiet phi phat");
        model.addAttribute("fines", fineService.findByUserId(currentUserId(session)));
        model.addAttribute("body", "reader/fine-details.jsp");
        return "layout/main";
    }

    private int currentUserId(HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
        return user == null ? 0 : user.getId();
    }
}
