package com.bags.sixdoBag.controller;


import com.bags.sixdoBag.model.entitys.*;
import com.bags.sixdoBag.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("ban-tai-quay")
@RequiredArgsConstructor
public class BanHangTaiQuayController {

    private final SanPhamService sanPhamService;

    private final ChiTietSanPhamServivce chiTietSanPhamServivce;

    private final DoiTuongSuDungService doiTuongSuDungService;

    private final MauSacService mauSacService;

    private final HoaDonService hoaDonService;

    private final HoaDonChiTietService hoaDonChiTietService;

    @GetMapping("")
    public String hienThiSanPham(Model model, @RequestParam(value = "name", required = false) String name) {
        extracted(model);

        List<ChiTietSanPham> list = new ArrayList<>();
        if (Objects.isNull(name)) {
            list = chiTietSanPhamServivce.getChiTietSanPhams();
        } else {
            list = chiTietSanPhamServivce.searchChiTietSanPhams(name);
            model.addAttribute("nameSearch", name);
        }
        model.addAttribute("listSp", list);
        return "ban-hang-tai-quay/home";
    }

    private void extracted(Model model) {
        Set<String> chatLieus = sanPhamService.getSanPhams().stream().map(SanPham::getChatLieu).collect(Collectors.toSet());
        List<String> doiTuongSuDungs = doiTuongSuDungService.getListDoiTuongSuDung().stream().map(DoiTuongSuDung::getTenDoiTuongSuDung).collect(Collectors.toList());
        List<String> mauSacs = mauSacService.getMauSacs().stream().map(MauSac::getTenMauSac).toList();
        List<HoaDon> danhSachTab = hoaDonService.getTabHoaDon();
        model.addAttribute("tabs", danhSachTab);
        model.addAttribute("chatLieus", chatLieus);
        model.addAttribute("doiTuongSuDungs", doiTuongSuDungs);
        model.addAttribute("mauSacs", mauSacs);
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
        System.out.println("listHoaDonchi = " + listHoaDonChiTiet.size());
        return ResponseEntity.ok(listHoaDonChiTiet);
    }


    @PostMapping("filter")
    public String filter(
            Model model,
            @RequestParam("mauSac") String mauSac,
            @RequestParam("doiTuongSuDung") String doiTuongSuDung,
            @RequestParam("chatLieu") String chatLieu
    ) {
        extracted(model);
        List<ChiTietSanPham> listSearchCTSP = chiTietSanPhamServivce.filterTaiQuay(chatLieu, mauSac, doiTuongSuDung);
        System.out.println(mauSac + "   " + doiTuongSuDung + "   " + chatLieu);
        List<HoaDon> danhSachTab = hoaDonService.getTabHoaDon();
        model.addAttribute("listSp", listSearchCTSP);
        model.addAttribute("tabs", danhSachTab);
        model.addAttribute("mauSac", mauSac);
        model.addAttribute("doiTuongSuDung", doiTuongSuDung);
        model.addAttribute("chatLieu", chatLieu);
        return "ban-hang-tai-quay/home";
    }

}
