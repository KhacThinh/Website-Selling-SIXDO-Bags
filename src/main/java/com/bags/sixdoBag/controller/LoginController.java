package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.config.UserLoginKhachHang;
import com.bags.sixdoBag.controller.Online.ProductFavoriteController;
import com.bags.sixdoBag.model.dto.request.GioHangRequest;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.entitys.NhanVien;
import com.bags.sixdoBag.service.GioHangService;
import com.bags.sixdoBag.service.KhachHangService;
import com.bags.sixdoBag.service.NhanVienService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

@Controller
@RequiredArgsConstructor
public class LoginController {
    @Autowired
    private NhanVienService nhanVienService;

    @Autowired
    private KhachHangService khachHangService;

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
                   @RequestParam("email") String userName,
                   @RequestParam("password") String passWord) {
        if (passWord.trim().equals("")) {
            throw new IllegalArgumentException("Không được để trống mật khẩu");
        } else if (passWord.trim().length() < 6) {
            throw new IllegalArgumentException("Mật khẩu lớn hơn 6 ký tự");
        }
        KhachHang khachHang = new KhachHang();
        khachHang.setTenKhachHang(ten.trim());
        khachHang.setEmail(userName.trim());
        khachHang.setMatKhau(passWord);
        if (Objects.nonNull(khachHangService.addKhachHang(khachHang))) {
            return true;
        } else {
            return false;
        }
    }
}
