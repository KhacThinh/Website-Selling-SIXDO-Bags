package com.bags.sixdoBag.controller;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
        session.removeAttribute("quanLy");

        model.addAttribute("action","/login/dang-nhap-nhan-vien");

        return "login";
    }


    @PostMapping("/buyer-login/check")
    public String loginByBuyer(@RequestParam("username-login")String userName,
                               @RequestParam("password-login") String passWord, Model model){
        GioHangRequest gioHangRequest = new GioHangRequest();

        KhachHang khachHang = khachHangService.getKhachHangByUserNameAndPassword(userName,passWord);
        if (khachHang!=null ){
                gioHangRequest.setIdKhachHang(khachHang.getId());
                gioHangService.addGioHang(gioHangRequest);
            session.setAttribute("buyer",khachHang);
            return "redirect:/sixdo-shop";
        }else{
            return "ban-hang-online/home/buyer-login";
        }



    }

    @PostMapping("/login/dang-nhap-nhan-vien")
    public String dangNhapNhanVien(@RequestParam("email")String email, @RequestParam("mat_khau") String mat_khau, Model model){
        NhanVien nv = nhanVienService.loginNhanVien(email, mat_khau);
        session.removeAttribute("nhanVien");
        session.removeAttribute("quanLy");
        if (email.isEmpty() || mat_khau.isEmpty()){
            model.addAttribute("mes","Không được bỏ trống");
            session.setAttribute("error","Không được bỏ trống");
            return "login";
        }else if (nv==null){
            session.setAttribute("error","Sai tên hoặc mk");

            return "login";
        }else if (nv.getChucVu().getId()==1){
            session.setAttribute("quanLy",nv);
            return "redirect:/san-pham";
        }
        session.setAttribute("nhanVien",nv);
        return "redirect:/ban-tai-quay";
    }
}
