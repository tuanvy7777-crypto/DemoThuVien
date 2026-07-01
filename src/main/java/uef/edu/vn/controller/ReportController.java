package uef.edu.vn.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import uef.edu.vn.model.Book;
import uef.edu.vn.model.BorrowRecord;
import uef.edu.vn.service.BookService;
import uef.edu.vn.service.BorrowService;
import uef.edu.vn.service.FineService;
import uef.edu.vn.service.ReportService;
import uef.edu.vn.utils.ExcelExportUtil;
import uef.edu.vn.utils.PdfExportUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class ReportController {
    private final ReportService reportService;
    private final BookService bookService;
    private final BorrowService borrowService;
    private final FineService fineService;

    public ReportController(ReportService reportService, BookService bookService, BorrowService borrowService, FineService fineService) {
        this.reportService = reportService;
        this.bookService = bookService;
        this.borrowService = borrowService;
        this.fineService = fineService;
    }

    @GetMapping({"/admin/reports/monthly", "/admin/reports/yearly", "/admin/reports/most-borrowed", "/admin/reports/overdue"})
    public String reports(Model model) {
        model.addAttribute("pageTitle", "Bao cao thu vien");
        model.addAttribute("overview", reportService.overview());
        model.addAttribute("monthlyStats", reportService.monthlyBorrowStats());
        model.addAttribute("mostBorrowedBooks", reportService.mostBorrowedBooks(bookService));
        model.addAttribute("overdueRecords", reportService.overdueBooks(borrowService, fineService));
        model.addAttribute("body", "admin/reports/monthly-report.jsp");
        return "layout/main";
    }

    @GetMapping("/admin/reports/export/excel")
    public ResponseEntity<byte[]> exportExcel() {
        byte[] body = ExcelExportUtil.exportRows(reportRows());
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=library-report.csv")
                .contentType(MediaType.parseMediaType("text/csv; charset=UTF-8"))
                .body(body);
    }

    @GetMapping("/admin/reports/export/pdf")
    public ResponseEntity<byte[]> exportPdf() {
        byte[] body = PdfExportUtil.exportText("Bao cao thu vien", String.join("\n", reportRows()));
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=library-report.pdf")
                .contentType(MediaType.APPLICATION_PDF)
                .body(body);
    }

    private List<String> reportRows() {
        List<String> rows = new ArrayList<>();
        rows.add("Section,Name,Value");
        for (Map.Entry<String, Integer> item : reportService.overview().entrySet()) {
            rows.add("Overview," + csv(item.getKey()) + "," + item.getValue());
        }
        for (Map.Entry<String, Integer> item : reportService.monthlyBorrowStats().entrySet()) {
            rows.add("Monthly," + csv(item.getKey()) + "," + item.getValue());
        }
        for (Book book : reportService.mostBorrowedBooks(bookService)) {
            rows.add("Most borrowed," + csv(book.getTitle()) + "," + csv(book.getCategory()));
        }
        for (BorrowRecord record : reportService.overdueBooks(borrowService, fineService)) {
            rows.add("Overdue," + csv(record.getReaderName()) + "," + csv(record.getBookTitle()) + " due " + record.getDueDate());
        }
        return rows;
    }

    private String csv(String value) {
        if (value == null) {
            return "";
        }
        return "\"" + value.replace("\"", "\"\"") + "\"";
    }
}
