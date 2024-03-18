package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.DiaChiKhachHang;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.entitys.MaGiamGia;
import com.bags.sixdoBag.model.repository.DiaChiKhachHangRepository;
import com.bags.sixdoBag.service.DiaChiKhachHangService;
import com.bags.sixdoBag.service.KhachHangService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/dia_chi_khach_hang")
public class DiaChiKhachHangController {
    public final DiaChiKhachHangService diaChiKhachHangService;
    public final KhachHangService khachHangService;
    public final DiaChiKhachHangRepository diaChiKhachHangRepository;


    @GetMapping("")
    public String getMGG(Model model, @RequestParam(name = "name", required = false) String name,
                         @RequestParam(defaultValue = "0", name = "page") int page,
                         @RequestParam(name = "trangThai", required = false) Boolean trangThai,
                         @RequestParam(name = "tenKhachHang", required = false) String tenKhachHang,
                         @RequestParam(name = "khachHangId", required = false) Long khachHangId) {
        Pageable pageable = PageRequest.of(page, 10);
        Page<DiaChiKhachHang> khuyenMais;
        model.addAttribute("listColors1", khachHangService.getListKhachHang());
        if (khachHangId != null) {
            khuyenMais = diaChiKhachHangService.searchDCKHByKhachHangId(khachHangId, pageable);
        } else if (name != null && !name.isEmpty()) {
            model.addAttribute("nameSearch", name);
            khuyenMais = diaChiKhachHangService.searchDCKHTenOrMa(name, pageable);
        } else if (trangThai != null) {
            khuyenMais = diaChiKhachHangService.searchcbb(trangThai, pageable);
        } else if (tenKhachHang != null) {
            khuyenMais = diaChiKhachHangService.searchcbb1(tenKhachHang, pageable);
        } else {
            khuyenMais = diaChiKhachHangRepository.findAll(pageable);
        }

        model.addAttribute("listColors", khuyenMais);
        return "/quan-ly/dia-chi-khach-hang/view";
    }
    @PostMapping("/add")
    public ResponseEntity<?> add(

            @RequestParam("tenDiaChi") String tenDiaChi,
            @RequestParam("moTa") String moTa,
            @RequestParam("trangThai") boolean trangThai,
            @RequestParam("id") Integer id,
            Model model
    ) {
        System.out.println(id);
        KhachHang khachHang = khachHangService.getKhachHang(id);
        System.out.println(khachHang);
        DiaChiKhachHang gg = diaChiKhachHangRepository.searchDiaChiKhachHangByTen(tenDiaChi);

//        if (gg == null) {
        DiaChiKhachHang dckh = new DiaChiKhachHang();
        dckh.setKhachHang(khachHang);
        dckh.setTenDiaChi(tenDiaChi);
        dckh.setMoTa(moTa);
        dckh.setTrangThai(trangThai);
        diaChiKhachHangService.addDiaChiKhachHang(dckh);
        return ResponseEntity.ok("ok");
//        } else{
//            return ResponseEntity.ok("errorTen");
//        }
    }

    @PostMapping("/update")
    public ResponseEntity<?> suaMauSac(@RequestParam("id") Integer id,
                                       @RequestParam("tenDiaChi") String tenDiaChi,
                                       @RequestParam("moTa") String moTa,
                                       @RequestParam("trangThai") boolean trangThai) {


        DiaChiKhachHang diaChiKhachHang = diaChiKhachHangService.getidDCKH(id);
        diaChiKhachHang.setTenDiaChi(tenDiaChi);
        diaChiKhachHang.setMoTa(moTa);
        diaChiKhachHang.setTrangThai(trangThai);
        diaChiKhachHangService.editDiaChiKhachHang(id, diaChiKhachHang);
        return ResponseEntity.ok("ok");
    }


//    @PostMapping("/delete")
//    public ResponseEntity<?> xoaDiaChiKh(@RequestParam("idKhachHang") Integer id) {
//        return ResponseEntity.ok(diaChiKhachHangService.deleteDiaChiKhachHang(id));
//    }

    @PostMapping("/delete/{id}")
    public ResponseEntity<?> deleteKhuyenMai(@PathVariable("id") Integer id) {
        DiaChiKhachHang khuyenMai = diaChiKhachHangService.getidDCKH(id);
        if (khuyenMai != null) {
            khuyenMai.setTrangThai(false); // Đánh dấu là không hoạt động thay vì xóa
            diaChiKhachHangService.editDiaChiKhachHang(id, khuyenMai); // Cập nhật khuyến mãi
            return ResponseEntity.ok("ok");
        } else {
            return ResponseEntity.ok("error");
        }
    }
}

