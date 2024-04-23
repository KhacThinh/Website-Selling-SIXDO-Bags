package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.CuaHang;
import com.bags.sixdoBag.service.CuaHangService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("cua-hang")
@RequiredArgsConstructor
public class CuaHangController {

    private final CuaHangService cuaHangService;

    @GetMapping("")
    @ResponseBody
    public CuaHang cuaHang(){
        return cuaHangService.getCuaHang();
    }

    @PostMapping("")
    @ResponseBody
    public CuaHang cuaHang(@RequestBody CuaHang cuaHang){
        return cuaHangService.addEditCuaHang(cuaHang);
    }
}
