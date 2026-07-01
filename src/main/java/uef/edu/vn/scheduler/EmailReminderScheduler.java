package uef.edu.vn.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import uef.edu.vn.service.EmailService;

@Component
public class EmailReminderScheduler {
    private final EmailService emailService;

    public EmailReminderScheduler(EmailService emailService) {
        this.emailService = emailService;
    }

    @Scheduled(cron = "0 0 8 * * *")
    public void remindDueBooks() {
        emailService.sendNotification("reader@uef.edu.vn", "Nhắc hạn trả sách", "Bạn vui lòng kiểm tra các sách sắp đến hạn trả.");
    }
}