package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.CuaHang;
import com.bags.sixdoBag.service.CuaHangService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Objects;
import java.util.UUID;

@Controller
@RequestMapping("/sixdo-shop/cua-hang")
@RequiredArgsConstructor
public class CuaHangController {

    private final CuaHangService cuaHangService;

    @GetMapping("manager")
    public String getChuyenTrang() {
        return "/quan-ly/cua-hang/cua-hang";
    }

    @GetMapping("show")
    @ResponseBody
    public CuaHang cuaHang() {
        return cuaHangService.getCuaHang();
    }

    @PostMapping("add")
    @ResponseBody
    public CuaHang cuaHang(@RequestParam("tenDayDuCuaHang") String tenDayDuCuaHang,
                           @RequestParam("tenCuaHang") String tenCuaHang,
                           @RequestParam("diaChi") String diaChi,
                           @RequestParam(value = "hinhAnhLogo", required = false) MultipartFile hinhAnh,
                           @RequestParam("sdt") String sdt,
                           @RequestParam("email") String email,
                           @RequestParam("toaDoMapX") String toaDoMapX,
                           @RequestParam("toaDoMapY") String toaDoMapY) {
        System.out.println("/sixdo-shop/cua-hang/add");
        CuaHang newCuaHang = cuaHangService.getCuaHang();
        newCuaHang.setTenDayDuCuaHang(tenDayDuCuaHang);
        newCuaHang.setTenCuaHang(tenCuaHang);
        newCuaHang.setDiaChi(diaChi);
        if (Objects.nonNull(hinhAnh) && !hinhAnh.isEmpty()) {
            try {
                byte[] bytes = hinhAnh.getBytes();
                String UPLOAD_DIR = "src/main/resources/static/images/cua-hang/";
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File(UPLOAD_DIR + hinhAnh.getOriginalFilename())));
                stream.write(bytes);
                System.out.println(hinhAnh.getOriginalFilename());
                newCuaHang.setHinhAnhLogo("../static/images/cua-hang/" + hinhAnh.getOriginalFilename() + "?" + UUID.randomUUID().toString());
                stream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        newCuaHang.setSdt(sdt);
        newCuaHang.setEmail(email);
        newCuaHang.setToaDoMapX(toaDoMapX);
        newCuaHang.setToaDoMapY(toaDoMapY);

        return cuaHangService.addEditCuaHang(newCuaHang);
    }

}
