package com.bags.sixdoBag.user;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dang-ky")
@RequiredArgsConstructor
public class SignInController {
    @GetMapping("")
    public String giaoDien(){
        return "/user/login_sign";
    }
}
