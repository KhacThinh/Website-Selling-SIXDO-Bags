package com.bags.sixdoBag.controller.Online;

import com.bags.sixdoBag.model.entitys.CuaHang;
import com.bags.sixdoBag.service.CuaHangService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
@RequestMapping("lien-he")
public class ContactController {

    private final CuaHangService cuaHangService;

    @GetMapping("thong-tin-cua-hang")
    public @ResponseBody
    CuaHang getThongTinCuaHang() {
        System.out.println("Đã vô đây");
        return cuaHangService.getCuaHang();
    }
}
