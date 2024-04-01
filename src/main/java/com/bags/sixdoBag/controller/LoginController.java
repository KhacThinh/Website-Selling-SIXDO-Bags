package com.bags.sixdoBag.controller;

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
        session.removeAttribute("nhanVien");

        model.addAttribute("action", "/login/dang-nhap-nhan-vien");

        return "login";
    }


    @GetMapping("/logout/quan-ly")
    public String logOutQuanLy(Model model) {
        session.removeAttribute("quanLy");
        return "redirect:/login/hien-thi";
    }

//    @PostMapping("/buyer-login/check")
//    public String loginByBuyer(@RequestParam("username-login") String userName,
//                               @RequestParam("password-login") String passWord, Model model) {
//        GioHangRequest gioHangRequest = new GioHangRequest();
//
//        KhachHang khachHang = khachHangService.getKhachHangByUserNameAndPassword(userName, passWord);
//        if (khachHang != null) {
//            gioHangRequest.setIdKhachHang(khachHang.getId());
//            gioHangService.addGioHang(gioHangRequest);
//            session.setAttribute("buyer", khachHang);
//            return "redirect:/sixdo-shop";
//        } else {
//            return "ban-hang-online/home/buyer-login";
//        }
//
//    }

    @PostMapping("/login/dang-nhap-nhan-vien")
    public String dangNhapNhanVien(@RequestParam("email") String email, @RequestParam("mat_khau") String mat_khau, Model model) {
        NhanVien nv = nhanVienService.loginNhanVien(email, mat_khau);

        if (email.isEmpty() || mat_khau.isEmpty()) {
            model.addAttribute("mes", "Không được bỏ trống");
            session.setAttribute("error", "Không được bỏ trống");
            return "login";
        } else if (nv == null) {
            session.setAttribute("error", "Sai tên hoặc mk");

            return "login";
        } else if (nv.getChucVu().getId() == 1) {
            session.setAttribute("quanLy", nv);
            return "redirect:/san-pham";
        }
        session.setAttribute("nhanVien", nv);
        return "redirect:/ban-tai-quay";
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
        System.out.println("Đa vô đây");
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

    private int confirmationCode;

    @PostMapping("/buyer-register/sendMail")
    @ResponseBody
    public int sendMailXN(@RequestParam("email") String emailSend) {
        Random random = new Random();
        confirmationCode = random.nextInt(10000, 99999);
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

        Timer timer = new Timer();
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                // Reset confirmation code after 60 seconds
                confirmationCode = 0;
            }
        }, 60000);

        emailService.sendEmail(messagePreparator);

        return confirmationCode;
    }

    @PostMapping("/buyer-register/checkMail")
    @ResponseBody
    public boolean checkMail(@RequestParam("email") String email) {
        return Objects.nonNull(khachHangService.searchKh(email));
    }


}
