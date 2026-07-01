package uef.edu.vn.service;

import org.springframework.stereotype.Service;

@Service
public class EmailService {
    public boolean sendNotification(String email, String subject, String content) {
        return email != null && !email.isBlank() && subject != null && content != null;
    }
}