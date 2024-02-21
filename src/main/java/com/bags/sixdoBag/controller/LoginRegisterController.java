package com.bags.sixdoBag.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("login-register")
public class LoginRegisterController {

    @GetMapping("")
    public String login(){
        return "login-register/login-register";
    }
}
