package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.CuaHang;
import com.bags.sixdoBag.service.CuaHangService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/sixdo-shop/cua-hang")
@RequiredArgsConstructor
public class CuaHangController {

    private final CuaHangService cuaHangService;

    @GetMapping("manager")
    public String getChuyenTrang() {
        return "/quan-ly/cua-hang/cua-hang";
    }

    @GetMapping("")
    @ResponseBody
    public CuaHang cuaHang() {
        return cuaHangService.getCuaHang();
    }

    @PostMapping("")
    @ResponseBody
    public CuaHang cuaHang(@RequestBody CuaHang cuaHang) {
        return cuaHangService.addEditCuaHang(cuaHang);
    }
}
