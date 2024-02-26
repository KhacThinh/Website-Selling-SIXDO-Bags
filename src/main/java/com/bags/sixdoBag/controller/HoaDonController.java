package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.service.HoaDonService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
//@RestController
@RequestMapping("hoa-don")
@RequiredArgsConstructor
public class HoaDonController {

    private final HoaDonService hoaDonService;

    @GetMapping("lich-su")
    public String lichSuHoaDon(Model model){
        model.addAttribute("hoaDons", hoaDonService.getSortHoaDon());
        return "/hoa-don/lich-su-hoa-don";
    }

//    @GetMapping("lich-su")
//    public ResponseEntity<?> lichSuHoaDon(){
//        return new ResponseEntity<>(hoaDonService.getSortHoaDon(), HttpStatus.OK);
//    }
}
