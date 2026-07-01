package uef.edu.vn.service;

import org.springframework.stereotype.Service;
import uef.edu.vn.dao.ReportDAO;
import uef.edu.vn.model.Book;
import uef.edu.vn.model.BorrowRecord;

import java.util.List;
import java.util.Map;

@Service
public class ReportService {
    private final ReportDAO reportDAO;

    public ReportService(ReportDAO reportDAO) {
        this.reportDAO = reportDAO;
    }

    public Map<String, Integer> overview() {
        return reportDAO.overview();
    }

    public Map<String, Integer> monthlyBorrowStats() {
        return reportDAO.monthlyBorrowStats();
    }

    public List<Book> mostBorrowedBooks(BookService bookService) {
        return reportDAO.mostBorrowedBooks(3);
    }

    public List<BorrowRecord> overdueBooks(BorrowService borrowService, FineService fineService) {
        return fineService.findOverdueBooks(borrowService.findRecords());
    }

    public int countReaders() {
        return reportDAO.countReaders();
    }

    public int countLowStockBooks() {
        return reportDAO.countLowStockBooks();
    }
}
