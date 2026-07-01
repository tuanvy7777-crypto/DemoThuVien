package uef.edu.vn.model;

import java.math.BigDecimal;

public class Fine {
    private int id;
    private String readerName;
    private String reason;
    private BigDecimal amount;
    private boolean paid;

    public Fine() {
    }

    public Fine(int id, String readerName, String reason, BigDecimal amount, boolean paid) {
        this.id = id;
        this.readerName = readerName;
        this.reason = reason;
        this.amount = amount;
        this.paid = paid;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getReaderName() { return readerName; }
    public void setReaderName(String readerName) { this.readerName = readerName; }
    public String getReason() { return reason; }
    public void setReason(String reason) { this.reason = reason; }
    public BigDecimal getAmount() { return amount; }
    public void setAmount(BigDecimal amount) { this.amount = amount; }
    public boolean isPaid() { return paid; }
    public void setPaid(boolean paid) { this.paid = paid; }
}