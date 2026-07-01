package uef.edu.vn.service;

import org.springframework.stereotype.Service;
import uef.edu.vn.dao.NotificationDAO;
import uef.edu.vn.model.Notification;

import java.util.List;

@Service
public class NotificationService {
    private final NotificationDAO notificationDAO;

    public NotificationService(NotificationDAO notificationDAO) {
        this.notificationDAO = notificationDAO;
    }

    public List<Notification> findByUserId(int userId) {
        return notificationDAO.findByUserId(userId);
    }

    public int countByUserId(int userId) {
        return notificationDAO.countByUserId(userId);
    }
}
