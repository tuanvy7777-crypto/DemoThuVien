package uef.edu.vn.service;

import org.springframework.stereotype.Service;
import uef.edu.vn.dao.BorrowDAO;
import uef.edu.vn.model.BorrowRecord;
import uef.edu.vn.model.BorrowRequest;

import java.util.List;

@Service
public class BorrowService {
    private final BorrowDAO borrowDAO;

    public BorrowService(BorrowDAO borrowDAO) {
        this.borrowDAO = borrowDAO;
    }

    public List<BorrowRecord> findRecords() {
        return borrowDAO.findRecords();
    }

    public List<BorrowRecord> findRecordsByUserId(int userId) {
        return borrowDAO.findRecordsByUserId(userId);
    }

    public List<BorrowRequest> findRequests() {
        return borrowDAO.findRequests();
    }

    public List<BorrowRequest> findRequestsByUserId(int userId) {
        return borrowDAO.findRequestsByUserId(userId);
    }

    public void createRequest(int userId, int bookId, int quantity, String note) {
        borrowDAO.createRequest(userId, bookId, quantity, note);
    }

    public void updateRequestStatus(int requestId, int librarianId, String status, String note) {
        borrowDAO.updateRequestStatus(requestId, librarianId, status, note);
    }

    public int countBorrowing() {
        return borrowDAO.countBorrowing();
    }

    public int countOverdue() {
        return borrowDAO.countOverdue();
    }

    public int countTodayBorrows() {
        return borrowDAO.countTodayBorrows();
    }
}
