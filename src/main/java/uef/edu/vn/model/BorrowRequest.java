package uef.edu.vn.model;

import java.time.LocalDateTime;

public class BorrowRequest {
    private int id;
    private String readerName;
    private String bookTitle;
    private LocalDateTime requestDate;
    private String status;

    public BorrowRequest() {
    }

    public BorrowRequest(int id, String readerName, String bookTitle, LocalDateTime requestDate, String status) {
        this.id = id;
        this.readerName = readerName;
        this.bookTitle = bookTitle;
        this.requestDate = requestDate;
        this.status = status;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getReaderName() { return readerName; }
    public void setReaderName(String readerName) { this.readerName = readerName; }
    public String getBookTitle() { return bookTitle; }
    public void setBookTitle(String bookTitle) { this.bookTitle = bookTitle; }
    public LocalDateTime getRequestDate() { return requestDate; }
    public void setRequestDate(LocalDateTime requestDate) { this.requestDate = requestDate; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}