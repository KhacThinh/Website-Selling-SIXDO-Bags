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
        model.addAttribute("chatLieus", chatLieus);
        model.addAttribute("doiTuongSuDungs", doiTuongSuDungs);
        model.addAttribute("mauSacs", mauSacs);
        List<HoaDon> listTab = hoaDonService.getTabHoaDon();
        List<HoaDon> danhSachTab = new ArrayList<>();
        for (HoaDon o : listTab) {
            if (o.getTrangThai() == 1) {
                danhSachTab.add(o);
            }

        }
        model.addAttribute("tabs", danhSachTab);
    }


    @PostMapping("/them-hoa-don")
    public ResponseEntity<?> themHoaDon(Model model) {
        hoaDonService.themHoaDon();
        List<HoaDon> listTab = hoaDonService.getTabHoaDon();
        List<HoaDon> danhSachTab = new ArrayList<>();
        for (HoaDon o : listTab) {
            if (o.getTrangThai() == 1) {
                danhSachTab.add(o);
            }

        }
        return ResponseEntity.ok(danhSachTab);
    }

    @PostMapping("/them-gio-hang")
    public ResponseEntity<?> themGioHang(@RequestBody Map<String, Object> requestBody) {
        String productId = String.valueOf(requestBody.get("productId"));
        String idTabString = String.valueOf(requestBody.get("tabActive"));
        String giaBanString = String.valueOf(requestBody.get("giaBan"));

        int idTab = Integer.parseInt(idTabString.substring(2));
        System.out.println("tabsstring" + idTab);
        ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
        chiTietHoaDon.setIdCtSanPham(Integer.valueOf(productId));
        chiTietHoaDon.setSoLuong(1);
        chiTietHoaDon.setGia((double) Integer.valueOf(giaBanString));
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
        model.addAttribute("listSp", listSearchCTSP);
        model.addAttribute("mauSac", mauSac);
        model.addAttribute("doiTuongSuDung", doiTuongSuDung);
        model.addAttribute("chatLieu", chatLieu);
        List<HoaDon> listTab = hoaDonService.getTabHoaDon();
        List<HoaDon> danhSachTab = new ArrayList<>();
        for (HoaDon o : listTab) {
            if (o.getTrangThai() == 1) {
                danhSachTab.add(o);
            }

        }
        model.addAttribute("tabs", danhSachTab);

        return "ban-hang-tai-quay/home";
    }

    @PostMapping("/update-so-luong-san-pham")
    public ResponseEntity<?> updateSoLuongSanPham(@RequestBody Map<String, Object> requestBody) {
        String idTabString = String.valueOf(requestBody.get("maHoaDon"));
        String idCtSanPhamString = String.valueOf(requestBody.get("idChiTietSanPham"));
        String soLuongString = String.valueOf(requestBody.get("soLuong"));
        String tongGiaSanPhamString = String.valueOf(requestBody.get("giaSanPham"));
        ///////
        int idTab = Integer.parseInt(idTabString.substring(2));
        ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
        chiTietHoaDon.setSoLuong(Integer.valueOf(soLuongString));
        chiTietHoaDon.setGia(Double.valueOf(tongGiaSanPhamString));
        hoaDonChiTietService.updateChiTietHoaDon(idTab, Integer.valueOf(idCtSanPhamString), chiTietHoaDon);


        return ResponseEntity.ok().build();
    }


    @PostMapping("/thanh-toan")
    public ResponseEntity<?> thanhToan(@RequestBody Map<String, Object> requestBody) {
        String idTabString = String.valueOf(requestBody.get("maHoaDon"));
        String tenKhachHang = String.valueOf(requestBody.get("tenKhachHang"));
        String soDienThoai = String.valueOf(requestBody.get("soDienThoai"));
        String tongDonHangString = String.valueOf(requestBody.get("tongGiaTri"));
        ///////
        int idTab = Integer.parseInt(idTabString.substring(2));

        HoaDon hoaDon = new HoaDon();
        hoaDon.setTrangThai(0);
        hoaDon.setSdtNguoiNhan(soDienThoai);
        hoaDon.setTenNguoiNhan(tenKhachHang);
        hoaDon.setTongTien((double) Integer.valueOf(tongDonHangString));

        hoaDonService.updateHoaDon(idTab, hoaDon);

        List<HoaDon> listTab = hoaDonService.getTabHoaDon();
        List<HoaDon> danhSachTab = new ArrayList<>();
        for (HoaDon o : listTab) {
            if (o.getTrangThai() == 1) {
                danhSachTab.add(o);
            }

        }

        return ResponseEntity.ok(danhSachTab);
    }

    @PostMapping("/xoa-hoa-don")
    public ResponseEntity<?> xoaHoaDon(@RequestBody Map<String, Object> requestBody) {
        String idTabString = String.valueOf(requestBody.get("maHoaDon"));
        int idTab = Integer.parseInt(idTabString.substring(2));


        hoaDonChiTietService.deleteHoaDonChiTietById(idTab);
        hoaDonService.deleteHoaDonById(idTab);
        List<HoaDon> listTab = hoaDonService.getTabHoaDon();
        List<HoaDon> danhSachTab = new ArrayList<>();
        for (HoaDon o : listTab) {
            if (o.getTrangThai() == 1) {
                danhSachTab.add(o);
            }

        }

        return ResponseEntity.ok(danhSachTab);
    }

}