package uef.edu.vn.model;

public class Notification {
    private int id;
    private String title;
    private String message;
    private String status;

    public Notification() {
    }

    public Notification(int id, String title, String message, String status) {
        this.id = id;
        this.title = title;
        this.message = message;
        this.status = status;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}