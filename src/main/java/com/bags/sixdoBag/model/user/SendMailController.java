package com.bags.sixdoBag.model.user;

import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.entitys.NhanVien;
import com.bags.sixdoBag.model.repository.KhachHangRepository;
import com.bags.sixdoBag.model.repository.NhanVienRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class SendMailController {

    @Autowired
    private EmailService emailService;
    @Autowired
    private NhanVienRepository nhanVienRepository;

    @PostMapping(value = "/send-email")
    public String sendEmail(@RequestParam String email, Model model, RedirectAttributes redirectAttributes) {
        NhanVien nhanVien = new NhanVien();
        nhanVien = nhanVienRepository.getNhanVienByEmail(email);


        if (nhanVien != null) {
            String ten = nhanVien.getHoTen();
            MimeMessagePreparator messagePreparator = mimeMessage -> {
                MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                messageHelper.setTo(email);
                messageHelper.setSubject("Mail từ SixDo");
                String link = "http://localhost:8080/lay-mk/Reset/"+email;

                String htmlContent = "<html>" +
                        "<head>" +
                        "<title>Reset Password</title>" +
                        "</head>" +
                        "<body>" +
                        "<h2> Xin chào bạn: " + ten + "  </h2>" +
                        "<p>Click <a href='" + link + "'>vào đây</a> để thay đổi mật khẩu của bạn.</p>" +
                        "</body>" +
                        "</html>";
                messageHelper.setText(htmlContent, true);

            };
            emailService.sendEmail(messagePreparator);

            return "/user/laylaipass/thong_bao";

        }
        else {
            redirectAttributes.addFlashAttribute("tb", "Email này không tồn tại");
            redirectAttributes.addAttribute("email", email);
            return "redirect:/lay-mk";

        }


    }
}