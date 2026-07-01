package uef.edu.vn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import uef.edu.vn.service.BookService;
import uef.edu.vn.service.BorrowService;
import uef.edu.vn.service.FineService;
import uef.edu.vn.service.ReportService;

@Controller
@RequestMapping("/librarian")
public class LibrarianController {
    private final BookService bookService;
    private final BorrowService borrowService;
    private final FineService fineService;
    private final ReportService reportService;

    public LibrarianController(BookService bookService,
            BorrowService borrowService,
            FineService fineService,
            ReportService reportService) {
        this.bookService = bookService;
        this.borrowService = borrowService;
        this.fineService = fineService;
        this.reportService = reportService;
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("pageTitle", "Bang dieu khien thu thu");
        model.addAttribute("pendingRequestCount", borrowService.findRequests().size());
        model.addAttribute("borrowingCount", borrowService.countBorrowing());
        model.addAttribute("overdueCount", borrowService.countOverdue());
        model.addAttribute("fineCount", fineService.countAll());
        model.addAttribute("readerCount", reportService.countReaders());
        model.addAttribute("todayBorrowCount", borrowService.countTodayBorrows());
        model.addAttribute("lowStockBookCount", reportService.countLowStockBooks());
        model.addAttribute("body", "librarian/dashboard.jsp");
        return "layout/main";
    }

    @GetMapping("/books")
    public String books(Model model) {
        model.addAttribute("pageTitle", "Quan ly sach");
        model.addAttribute("books", bookService.findAll());
        model.addAttribute("body", "librarian/books.jsp");
        return "layout/main";
    }

    @GetMapping("/borrowings")
    public String borrowings(Model model) {
        model.addAttribute("pageTitle", "Quan ly muon tra");
        model.addAttribute("records", borrowService.findRecords());
        model.addAttribute("requests", borrowService.findRequests());
        model.addAttribute("body", "librarian/borrowings.jsp");
        return "layout/main";
    }

    @GetMapping("/fines")
    public String fines(Model model) {
        model.addAttribute("pageTitle", "Quan ly tien phat");
        model.addAttribute("fines", fineService.findAll());
        model.addAttribute("totalFineAmount", fineService.sumAll());
        model.addAttribute("unpaidFineAmount", fineService.sumUnpaid());
        model.addAttribute("body", "librarian/fines.jsp");
        return "layout/main";
    }
}
