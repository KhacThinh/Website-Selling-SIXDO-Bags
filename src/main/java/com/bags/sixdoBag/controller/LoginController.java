package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.NhanVien;
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

@RequestMapping("/login")
@Controller
@RequiredArgsConstructor
public class LoginController {
    @Autowired
    private NhanVienService nhanVienService;

    @Autowired
    private HttpServletRequest request;

    @GetMapping("/hien-thi")
    public String hienThiSanPham(Model model) {
        model.addAttribute("action","/login/dang-nhap-nhan-vien");

        return "login";
    }

    @PostMapping("/dang-nhap-nhan-vien")
    public String dangNhapNhanVien(@RequestParam("email")String email, @RequestParam("mat_khau") String mat_khau, Model model){
        NhanVien nv = nhanVienService.loginNhanVien(email, mat_khau);
        HttpSession session = request.getSession();
        if (email.isEmpty() || mat_khau.isEmpty()){
            model.addAttribute("mes","Không được bỏ trống");
            session.setAttribute("error","Không được bỏ trống");
            return "login";
        }else if (nv==null){
            session.setAttribute("error","Sai tên hoặc mk");

            return "login";
        }
        session.setAttribute("nhanVien",nv);
        return "redirect:/ban-tai-quay";
    }
}
