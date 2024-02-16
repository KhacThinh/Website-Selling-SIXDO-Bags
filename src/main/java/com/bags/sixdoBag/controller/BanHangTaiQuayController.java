package com.bags.sixdoBag.controller;


import com.bags.sixdoBag.model.entitys.ChiTietHoaDon;
import com.bags.sixdoBag.model.entitys.ChiTietSanPham;
import com.bags.sixdoBag.model.entitys.HoaDon;
import com.bags.sixdoBag.model.entitys.SanPham;
import com.bags.sixdoBag.service.ChiTietSanPhamServivce;
import com.bags.sixdoBag.service.HoaDonChiTietService;
import com.bags.sixdoBag.service.HoaDonService;
import com.bags.sixdoBag.service.SanPhamService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("ban-tai-quay")
@RequiredArgsConstructor
public class BanHangTaiQuayController {

    private final SanPhamService sanPhamService;
    @Autowired
    ChiTietSanPhamServivce chiTietSanPham;
    @Autowired
    HoaDonService hoaDonService;

    @Autowired
    HoaDonChiTietService hoaDonChiTietService;

    @GetMapping("")
    public String hienThiSanPham(Model model) {
        List<ChiTietSanPham> list = chiTietSanPham.getChiTietSanPhams();
        List<HoaDon> danhSachTab = hoaDonService.getTabHoaDon();
        System.out.println("do daiiiiiiii" + list.size());
        model.addAttribute("listSp", list);
        model.addAttribute("tabs", danhSachTab);
        return "ban-hang-tai-quay/home";
    }


    @PostMapping("/them-hoa-don")
    public ResponseEntity<?> themHoaDon(Model model) {
        hoaDonService.themHoaDon();
        List<HoaDon> danhSachTab = hoaDonService.getTabHoaDon();
        return ResponseEntity.ok(danhSachTab);
    }

    @PostMapping("/them-gio-hang")
    public ResponseEntity<?> themGioHang(@RequestBody Map<String, Object> requestBody) {
        String productId = String.valueOf(requestBody.get("productId"));
        String idTabString = String.valueOf(requestBody.get("tabActive"));
        int idTab = Integer.parseInt(idTabString.substring(2));
        System.out.println("tabsstring" + idTab);
        ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
        chiTietHoaDon.setIdCtSanPham(Integer.valueOf(productId));
        chiTietHoaDon.setSoLuong(1);
        chiTietHoaDon.setGia((double) 200000);
        chiTietHoaDon.setIdHoaDon(idTab);
        hoaDonChiTietService.addGioHang(chiTietHoaDon);
        return ResponseEntity.ok().build();

    }

    @PostMapping("/get-gio-hang")
    public ResponseEntity<?> getGioHang(@RequestBody Map<String, Object> requestBody) {
        String idTabString = String.valueOf(requestBody.get("maHoaDon"));
        int idTab = Integer.parseInt(idTabString.substring(2));
        System.out.println("idddđ tab là :  " + idTab);
        List<ChiTietHoaDon> listHoaDonChiTiet = hoaDonChiTietService.getGioHangTaiQuay(idTab);
        System.out.println("listHoaDonchi = "+listHoaDonChiTiet.size());
        return ResponseEntity.ok(listHoaDonChiTiet);

    }


}
