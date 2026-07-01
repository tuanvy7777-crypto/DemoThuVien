package uef.edu.vn.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import uef.edu.vn.service.BorrowService;
import uef.edu.vn.service.FineService;

@Controller
public class FineController {
    private final FineService fineService;
    private final BorrowService borrowService;

    public FineController(FineService fineService, BorrowService borrowService) {
        this.fineService = fineService;
        this.borrowService = borrowService;
    }

    @GetMapping({"/admin/fines", "/admin/fines/payment"})
    public String fines(Model model) {
        model.addAttribute("pageTitle", "Quan ly phi phat");
        model.addAttribute("fines", fineService.findAll());
        model.addAttribute("totalFineAmount", fineService.sumAll());
        model.addAttribute("unpaidFineAmount", fineService.sumUnpaid());
        model.addAttribute("overdueRecords", fineService.findOverdueBooks(borrowService.findRecords()));
        model.addAttribute("body", "admin/fines/list.jsp");
        return "layout/main";
    }

    @PostMapping({"/admin/fines/status", "/librarian/fines/status"})
    public String updateFineStatus(@RequestParam int fineId,
            @RequestParam boolean paid,
            HttpSession session,
            RedirectAttributes redirectAttributes) {
        fineService.updatePaid(fineId, paid);
        redirectAttributes.addFlashAttribute("success", "Da cap nhat trang thai phieu phat.");
        String role = String.valueOf(session.getAttribute("currentRole"));
        return "ADMIN".equalsIgnoreCase(role) ? "redirect:/admin/fines" : "redirect:/librarian/fines";
    }
}
