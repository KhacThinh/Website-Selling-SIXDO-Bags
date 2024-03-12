package com.bags.sixdoBag.model.user;

import com.bags.sixdoBag.model.repository.KhachHangRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.entitys.TaiKhoan;
import com.bags.sixdoBag.service.KhachHangService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class SignInController {
    public final KhachHangRepository khachHangRepository;
    public final KhachHangService khachHangService;



    @GetMapping("")
    public String giaoDien(){
        return "/user/login_sign";

    }

    @PostMapping("")
    public String dangKi(@RequestParam("ten") String ten, @RequestParam("email") String email,
                         @RequestParam("diaChi") String diaChi, @RequestParam("pass") String pass,
                         @RequestParam("confirm") String confirm, Model model,
                         RedirectAttributes redirectAttributes){
        List<KhachHang>listkh=khachHangRepository.findAll();
        int size = listkh.size()+1;
        String maKH= "KH" +size;
        KhachHang khachHang = new KhachHang();

        khachHang.setTenKhachHang(ten);
        khachHang.setEmail(email);
        khachHang.setMatKhau(pass);
        khachHang.setMaKhachHang(maKH);
        TaiKhoan taiKhoan= new TaiKhoan();
        taiKhoan.setMatKhau(pass);
        taiKhoan.setTenDangNhap(email);
        khachHang.setTaiKhoan(taiKhoan);

        try {
            khachHangService.addKhachHang(khachHang);
            model.addAttribute("tb","Đăng Ký Tài Khoản Thành Công!");
            return "/user/login_sign";


        }catch (Exception e){
           String loi= e.getMessage();
           if(loi.contains("duplicate key value")){
               redirectAttributes.addFlashAttribute("tbtb","Email này đã tồn tại");
               redirectAttributes.addFlashAttribute("ten",ten);
               redirectAttributes.addFlashAttribute("diaChi",diaChi);

               redirectAttributes.addFlashAttribute("email",email);


               return "redirect:/user";

           }

        }


        return "/user/login_sign";
    }

}
