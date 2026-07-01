package uef.edu.vn.config;

import org.springframework.stereotype.Component;

import java.util.Map;
import java.util.Set;

@Component
public class SecurityConfig {
    private final Map<String, Set<String>> permissions = Map.of(
            "ADMIN", Set.of(
                    "DASHBOARD_VIEW", "BOOK_VIEW", "BOOK_CREATE", "BOOK_UPDATE", "BOOK_DELETE",
                    "CATEGORY_VIEW", "CATEGORY_CREATE", "CATEGORY_UPDATE", "CATEGORY_DELETE",
                    "AUTHOR_VIEW", "AUTHOR_CREATE", "AUTHOR_UPDATE", "AUTHOR_DELETE",
                    "PUBLISHER_VIEW", "PUBLISHER_CREATE", "PUBLISHER_UPDATE", "PUBLISHER_DELETE",
                    "USER_VIEW", "USER_CREATE", "USER_UPDATE", "USER_DELETE",
                    "BORROW_VIEW", "BORROW_APPROVE", "RETURN_BOOK", "FINE_VIEW",
                    "REPORT_VIEW", "EXPORT_EXCEL", "EXPORT_PDF"
            ),
            "LIBRARIAN", Set.of(
                    "DASHBOARD_VIEW", "BOOK_VIEW", "BOOK_CREATE", "BOOK_UPDATE",
                    "CATEGORY_VIEW", "AUTHOR_VIEW", "PUBLISHER_VIEW",
                    "BORROW_VIEW", "BORROW_APPROVE", "RETURN_BOOK", "FINE_VIEW", "REPORT_VIEW"
            ),
            "READER", Set.of("BOOK_VIEW", "BORROW_VIEW")
    );

    public boolean hasPermission(String role, String permission) {
        return permissions.getOrDefault(role, Set.of()).contains(permission);
    }
}