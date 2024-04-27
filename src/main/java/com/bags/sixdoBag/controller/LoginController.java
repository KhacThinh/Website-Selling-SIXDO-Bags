package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.config.PasswordResetUtil;
import com.bags.sixdoBag.model.dto.request.GioHangRequest;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.entitys.NhanVien;
import com.bags.sixdoBag.model.user.EmailService;
import com.bags.sixdoBag.service.GioHangService;
import com.bags.sixdoBag.service.KhachHangService;
import com.bags.sixdoBag.service.NhanVienService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.Objects;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;

@Controller
@RequiredArgsConstructor
public class LoginController {
    @Autowired
    private NhanVienService nhanVienService;

    @Autowired
    private KhachHangService khachHangService;

    private final EmailService emailService;

    @Autowired
    GioHangService gioHangService;
    @Autowired
    private HttpSession session;
    @Autowired
    private HttpServletRequest request;


    @GetMapping("/login/hien-thi")
    public String hienThiSanPham(Model model) {

        model.addAttribute("action", "/login/dang-nhap-nhan-vien");

        return "login";
    }


    @GetMapping("/logout/quan-ly")
    public String logOutQuanLy(Model model) {
        session.removeAttribute("quanLy");
        return "redirect:/login/hien-thi";
    }

    @PostMapping("/mmployee-login/check")
    public @ResponseBody
    int Employeeloginr(@RequestParam("email") String email,
                       @RequestParam("mat_khau") String mat_khau, Model model) {

        NhanVien nv = nhanVienService.loginNhanVien(email, mat_khau);
        if (email.trim().isEmpty() && mat_khau.trim().isEmpty()) {
            throw new IllegalArgumentException("tài khoản mật khẩu không được để trống");

        }

        if (Objects.nonNull(nv)) {
            if (nv.getChucVu().getId() == 4) {
                session.setAttribute("quanLy", nv);
                return 4;
            } else {
                session.setAttribute("nhanVien", nv);
                return 2;
            }

        } else {
            return 0;
        }

    }

    @PostMapping("/login/dang-nhap-nhan-vien")
    public String dangNhapNhanVien(@RequestParam("email") String email, @RequestParam("mat_khau") String mat_khau, Model model) {
        session.removeAttribute("nhanVien");
        session.removeAttribute("quanLy");
        NhanVien nv = nhanVienService.loginNhanVien(email, mat_khau);

        if (email.isEmpty() || mat_khau.isEmpty()) {
            model.addAttribute("mes", "Không được bỏ trống");
            session.setAttribute("error", "Không được bỏ trống");
            return "login";
        } else if (nv == null) {
            session.setAttribute("error", "Sai tên hoặc mk");

            return "login";
        } else if (nv.getChucVu().getId() == 4) {
            session.setAttribute("quanLy", nv);
            return "redirect:/thong-ke";
        }
        session.setAttribute("nhanVien", nv);
        return "redirect:/hoa-don/nv-lich-su";
    }


    @PostMapping("/buyer-login/check")
    public @ResponseBody
    boolean loginByBuyer(@RequestParam("email") String userName,
                         @RequestParam("password") String passWord) {
        GioHangRequest gioHangRequest = new GioHangRequest();

        KhachHang khachHang = khachHangService.getKhachHangByUserNameAndPassword(userName, passWord);
        if (Objects.nonNull(khachHang)) {
            gioHangRequest.setIdKhachHang(khachHang.getId());
            gioHangService.addGioHang(gioHangRequest);
            session.setAttribute("buyer", khachHang);
            return true;
        } else {
            return false;
        }

    }

    @PostMapping("/buyer-register/check")
    public @ResponseBody
    boolean dangKy(@RequestParam("tenKhachHang") String ten,
                   @RequestParam("email") String email,
                   @RequestParam("password") String passWord) {
        if (passWord.trim().equals("")) {
            throw new IllegalArgumentException("Không được để trống mật khẩu");
        } else if (passWord.trim().length() < 6) {
            throw new IllegalArgumentException("Mật khẩu lớn hơn 6 ký tự");
        }
        if (Objects.nonNull(khachHangService.searchKh(email))) {
            throw new IllegalArgumentException("Email đã tồn tại");
        }
        KhachHang khachHang = new KhachHang();
        khachHang.setTenKhachHang(ten.trim());
        khachHang.setEmail(email.trim());
        khachHang.setMatKhau(passWord);
        if (Objects.nonNull(khachHangService.addKhachHang(khachHang))) {
            return true;
        } else {
            return false;
        }
    }


    @PostMapping("/buyer-register/sendMail")
    @ResponseBody
    public int sendMailXN(@RequestParam("email") String emailSend) {
        Random random = new Random();
        int confirmationCode = random.nextInt(10000, 99999);
        String email = emailSend.trim();

        String subject = "Xác nhận đăng ký tài khoản từ Shop SixDo";
        String htmlContent = "<html>" +
                "<head><title>Xác nhận đăng ký tài khoản</title></head>" +
                "<body>" +
                "<h2>Xác nhận đăng ký tài khoản</h2>" +
                "<p>Chúng tôi xin gửi mã xác nhận cho bạn:</p>" +
                "<h3>Mã xác nhận: <strong>" + confirmationCode + "</strong></h3>" +
                "<p>Vui lòng sử dụng mã xác nhận này để hoàn thành quá trình đăng ký tài khoản.</p>" +
                "<p>Xin cảm ơn!</p>" +
                "</body>" +
                "</html>";

        MimeMessagePreparator messagePreparator = mimeMessage -> {
            MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
            messageHelper.setTo(email);
            messageHelper.setSubject(subject);
            messageHelper.setText(htmlContent, true);
        };

        emailService.sendEmail(messagePreparator);

        return confirmationCode;
    }

    @PostMapping("/buyer-register/checkMail")
    @ResponseBody
    public boolean checkMail(@RequestParam("email") String email) {
        return Objects.nonNull(khachHangService.searchKh(email));
    }

    @PostMapping("/buyer-forget/sendMailForgetPassword")
    @ResponseBody
    public void sendMailQuenMatKhau(@RequestParam("email") String emailSend) {
        String email = emailSend.trim();

        if (email.isBlank()) {
            throw new IllegalArgumentException("Email không được để trống hoặc khoảng trắng");
        }

        KhachHang khachHang = khachHangService.searchKh(email);
        if (khachHang == null) {
            throw new IllegalArgumentException("Email không tồn tại trong hệ thống");
        }

        // Tạo mã token duy nhất
        String resetToken = PasswordResetUtil.generateUniqueToken();

        String resetLink = "http://localhost:8080/sixdo-shop/buyer-forget/sendMailForgetPassword?token=" + resetToken;

        String subject = "Lấy lại mật khẩu từ Shop SixDo";
        String htmlContent = "<html>" +
                "<head><title>Lấy lại mật khẩu</title></head>" +
                "<body>" +
                "<h2>Lấy lại mật khẩu</h2>" +
                "<p>Bạn đã yêu cầu lấy lại mật khẩu từ Shop SixDo. Nhấn vào liên kết dưới đây để đặt lại mật khẩu:</p>" +
                "<p><a href='" + resetLink + "'>" + resetLink + "</a></p>" +
                "<p>Nếu bạn không yêu cầu thay đổi mật khẩu, vui lòng bỏ qua email này.</p>" +
                "<p>Xin cảm ơn!</p>" +
                "</body>" +
                "</html>";

        MimeMessagePreparator messagePreparator = mimeMessage -> {
            MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
            messageHelper.setTo(email);
            messageHelper.setSubject(subject);
            messageHelper.setText(htmlContent, true);
        };

        session.setAttribute("resetToken", resetToken);
        session.setAttribute("buyerEmail", email);

        emailService.sendEmail(messagePreparator);
    }


    @GetMapping("/sixdo-shop/buyer-forget/sendMailForgetPassword")
    public String showResetPasswordForm(@RequestParam("token") String token, Model model) {
        String savedToken = (String) session.getAttribute("resetToken");
        String email = (String) session.getAttribute("buyerEmail");
        if (savedToken != null && savedToken.equals(token)) {
            System.out.println(email);
            return "/ban-hang-online/home/reset-password";
        } else {
            return "redirect:/error-page";
        }
    }

    @PostMapping("/sixdo-shop/buyer-forget/reset-password")
    @ResponseBody
    public boolean resetPassword(@RequestParam("token") String token, @RequestParam("password") String password) {
        if (password.trim().equals("")) {
            throw new IllegalArgumentException("Mật Khẩu không được để trống");
        }
        String savedToken = (String) session.getAttribute("resetToken");
        String email = (String) session.getAttribute("buyerEmail");
        if (savedToken != null && savedToken.equals(token)) {
            KhachHang khachHang = khachHangService.searchKh(email);
            khachHang.setMatKhau(password);
            System.out.println("Đã vô đây");
            khachHangService.editKhachHang(khachHang.getId(), khachHang);
            session.removeAttribute("resetToken");
            session.removeAttribute("buyerEmail");
            return true;
        }
        return false;
    }


    @GetMapping("/check-customer/mail")
    @ResponseBody
    public KhachHang checkCustomer(@RequestParam("id") Integer id) {
        KhachHang khachHang = khachHangService.getKhachHang(id);
        if (Objects.nonNull(khachHang)) {
            return khachHang;
        }
        return null;
    }

    @PostMapping("/sixdo-shop/buyer-forget/reset-password-profile")
    @ResponseBody
    public boolean resetPasswordProfile(
            @RequestParam("password") String password,
            @RequestParam("passwordNew") String passwordNew,
            @RequestParam("passwordNewConfig") String passwordNewConfig
    ) {
        System.out.println("password :" + password);
        System.out.println("passwordNew :" + passwordNew);
        System.out.println("passwordNewConfig :" + passwordNewConfig);
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        if (password.trim().equals("") || passwordNew.trim().equals("") || passwordNewConfig.trim().equals("")) {
            throw new IllegalArgumentException("Mật Khẩu không được để trống");
        }
        if (!passwordNew.trim().equals(passwordNewConfig.trim())) {
            return false;
        }

        if (!khachHang.getMatKhau().equals(password)) {
            return false;
        }
        khachHang.setMatKhau(passwordNew);
        khachHangService.editKhachHang(khachHang.getId(), khachHang);
        return true;
    }


}
