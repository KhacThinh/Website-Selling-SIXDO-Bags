package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.*;
import com.bags.sixdoBag.model.repository.KhachHangRepository;
import com.bags.sixdoBag.service.HoaDonService;
import com.bags.sixdoBag.service.KhachHangService;
import com.bags.sixdoBag.service.TaiKhoanService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;
import java.util.Random;

@Controller
@RequiredArgsConstructor
@RequestMapping("/khach_hang")
public class KhachHangController {
    public final KhachHangService khachHangService;
    public final KhachHangRepository khachHangRepository;
    public final TaiKhoanService taiKhoanService;
    public final HoaDonService hoaDonService;



    @GetMapping("")
    public String getMGG(Model model, @RequestParam(name = "name", required = false) String name,
                         @RequestParam(defaultValue = "0", name = "page") int page,
                         @RequestParam(name = "trangThai", required = false) Integer trangThai) {
        Pageable pageable = PageRequest.of(page, 10);
        Page<KhachHang> khuyenMais;

        if (name != null && !name.isEmpty()) {
            model.addAttribute("nameSearch", name);
            khuyenMais = khachHangService.searchKhachHangTenOrMa(name.trim(), pageable);
        } else if (trangThai != null) {
            khuyenMais = khachHangService.searchcbb(trangThai, pageable);
        } else {
            khuyenMais = khachHangRepository.findAll(pageable);
        }

        model.addAttribute("listColors", khuyenMais);
        model.addAttribute("listColors1", taiKhoanService.getTaiKhoans());
        return "/quan-ly/khach-hang/view";

    }

    @PostMapping("/add")
    public ResponseEntity<?> add(
            @RequestParam(value = "maKhachHang", required = false) String maKhachHang,
            @RequestParam("tenKhachHang") String tenKhachHang,
            @RequestParam("gioiTinh") Integer gioiTinh,
            @RequestParam("ngaySinh") String ngaySinh,
            @RequestParam("sdt") String sdt,
            @RequestParam("email") String email,
            @RequestParam("trangThai") Integer trangThai,
            Model model
    ) {

        KhachHang gg1 = khachHangRepository.searchKhachHangByMa(maKhachHang.trim());
        if (gg1 != null) {
            return ResponseEntity.ok("errorMa");
        } else {
            String temp;
            KhachHang khachhang1 = new KhachHang();
            khachhang1.setMaKhachHang(maKhachHang);
            khachhang1.setTenKhachHang(tenKhachHang);
            khachhang1.setGioiTinh(gioiTinh);
            khachhang1.setNgaySinh(ngaySinh);
            khachhang1.setSdt(sdt);
            khachhang1.setEmail(email);
            khachhang1.setTrangThai(trangThai);
            khachhang1 = khachHangService.addKhachHang1(khachhang1);
            if (maKhachHang == null || maKhachHang.isEmpty()) {
                khachhang1.setMaKhachHang("KH0" + khachhang1.getId());
                khachHangService.editKhachHang(khachhang1.getId(), khachhang1);

            } else {
                temp = maKhachHang;
            }
            return ResponseEntity.ok("ok");
        }
    }


    private String generateRandomMaNhanVien() {
        // Tạo chuỗi ngẫu nhiên gồm "NV" và hai số ngẫu nhiên
        String randomNumbers = String.format("%02d", new Random().nextInt(1000));
        return "KHR" + randomNumbers;
    }

    @PostMapping("/update")
    public ResponseEntity<?> suaMGG(@RequestParam("id") Integer id,
                                    @RequestParam("tenKhachHang") String tenKhachHang,
                                    @RequestParam("gioiTinh") Integer gioiTinh,
                                    @RequestParam("ngaySinh") String ngaySinh,
                                    @RequestParam("sdt") String sdt,
                                    @RequestParam("email") String email,

                                    @RequestParam("trangThai") Integer trangThai) {

//        KhachHang gg1 = khachHangRepository.searchKhachHangBySdt(sdt);
//        KhachHang gg2 = khachHangRepository.searchKhachHangByGM(email);
//
//        System.out.println(gg1);
//        System.out.println(gg2);
//
//        System.out.println(trangThai);
//        if (gg1 == null || gg2 == null) {
        KhachHang khachHang = khachHangService.getidKhachHang(id);
//        System.out.println(maChucVu);
        khachHang.setTenKhachHang(tenKhachHang);
        khachHang.setGioiTinh(gioiTinh);
        khachHang.setNgaySinh(ngaySinh);
        khachHang.setSdt(sdt);
        khachHang.setEmail(email);

        khachHang.setTrangThai(trangThai);
        khachHangService.editKhachHang(id, khachHang);
        return ResponseEntity.ok("ok");
    }
//        else if ( gg1 == null || gg2 != null) {
//            return ResponseEntity.ok("errorEmail");
//        } else {
//            return ResponseEntity.ok("error");
//        }
//    }


    @PostMapping("/delete/{id}")
    public ResponseEntity<?> deleteKhuyenMai(@PathVariable("id") Integer id) {
        KhachHang khuyenMai = khachHangService.getidKhachHang(id);
        if (khuyenMai != null) {
            khuyenMai.setTrangThai(0); // Đánh dấu là không hoạt động thay vì xóa
            khachHangService.editKhachHang(id, khuyenMai); // Cập nhật khuyến mãi
            return ResponseEntity.ok("ok");
        } else {
            return ResponseEntity.ok("error");
        }
    }

    @GetMapping("/getHoaDonByKhachHang")
    public ResponseEntity<?> getHoaDonByKhachHang(@RequestParam("id") int idKh,Model model){
        List<HoaDon> listHd= hoaDonService.getListSortHoaDonByKhachHang(idKh);
        return ResponseEntity.ok(listHd);

    }


    @GetMapping("/checkMail")
    public @ResponseBody
    boolean checkMail(@RequestParam("mail") String mail) {
        KhachHang khachHang = khachHangService.getKhachHangByEmail(mail);
        return khachHang != null;
    }

    @GetMapping("/checkSDT")
    public @ResponseBody
    boolean checkSDT(@RequestParam("sdt") String sdt) {
        KhachHang khachHang = khachHangService.getKhachHangBySDT(sdt);
        return khachHang != null;
    }
}
