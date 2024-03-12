package com.bags.sixdoBag.model.user;

import com.bags.sixdoBag.model.repository.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.service.KhachHangService;

@Controller
@RequestMapping("/lay-mk")
public class ReSetPassController {
    @Autowired
    private KhachHangRepository khachHangRepository;
    @Autowired
    private KhachHangService khachHangService;
    @GetMapping("")
    public String formEmail(Model model){
        return "/user/laylaipass/form_email";
    }

    @GetMapping("/Reset/{email}")
    public String formReset(@PathVariable("email") String email,Model model){
        KhachHang khachHang = khachHangService.searchKh(email);
        if(khachHang != null){
            System.out.println(email);
            model.addAttribute("email",email);

            return "/user/laylaipass/form_reset_pass";
        }else{
            return "redirect:/user";
        }


    }
    @PostMapping("/config")
    public String updatePass(@RequestParam("email") String email,@RequestParam("pass") String pass){
        KhachHang khachHang = khachHangService.searchKh(email);

        khachHang.setMatKhau(pass);
        khachHangService.editKhachHang(khachHang.getId(),khachHang);



        return "/user/laylaipass/form_reset_tc";
    }
}
