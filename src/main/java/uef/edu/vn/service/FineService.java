package uef.edu.vn.service;

import org.springframework.stereotype.Service;
import uef.edu.vn.dao.FineDAO;
import uef.edu.vn.model.BorrowRecord;
import uef.edu.vn.model.Fine;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Service
public class FineService {
    private static final BigDecimal DAILY_FINE = new BigDecimal("5000");
    private final FineDAO fineDAO;

    public FineService(FineDAO fineDAO) {
        this.fineDAO = fineDAO;
    }

    public List<Fine> findAll() {
        return fineDAO.findAll();
    }

    public List<Fine> findByUserId(int userId) {
        return fineDAO.findByUserId(userId);
    }

    public BigDecimal sumAll() {
        return fineDAO.sumAll();
    }

    public BigDecimal sumUnpaid() {
        return fineDAO.sumUnpaid();
    }

    public int countAll() {
        return fineDAO.countAll();
    }

    public void updatePaid(int fineId, boolean paid) {
        fineDAO.updatePaid(fineId, paid);
    }

    public BigDecimal calculateFine(BorrowRecord record) {
        if (record == null || record.getDueDate() == null) {
            return BigDecimal.ZERO;
        }
        LocalDate compareDate = record.getReturnDate() == null ? LocalDate.now() : record.getReturnDate();
        long overdueDays = ChronoUnit.DAYS.between(record.getDueDate(), compareDate);
        if (overdueDays <= 0) {
            return BigDecimal.ZERO;
        }
        return DAILY_FINE.multiply(BigDecimal.valueOf(overdueDays));
    }

    public List<BorrowRecord> findOverdueBooks(List<BorrowRecord> records) {
        return records.stream().filter(record -> calculateFine(record).compareTo(BigDecimal.ZERO) > 0).toList();
    }
}
