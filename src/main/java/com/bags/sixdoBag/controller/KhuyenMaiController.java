//package com.bags.sixdoBag.controller;
//
//import com.bags.sixdoBag.model.entitys.DanhMuc;
//import com.bags.sixdoBag.model.entitys.ThuongHieu;
//import com.bags.sixdoBag.model.repository.DanhMucRepository;
//import com.bags.sixdoBag.model.repository.ThuongHieuRepository;
//import com.bags.sixdoBag.service.*;
//import jakarta.validation.Valid;
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.multipart.MultipartFile;
//
//import java.io.BufferedOutputStream;
//import java.io.File;
//import java.io.FileOutputStream;
//import java.io.IOException;
//
//@Controller
//@RequestMapping("danh-muc")
//@RequiredArgsConstructor
//public class DanhMucController {
//    private final DanhMucService danhMucService;
//    private final DanhMucRepository danhMucRepository;
////    private ThuongHieuRequest rq = new ThuongHieuRequest();
//
//    @GetMapping("")
//    public String getDanhMuc(Model model, @RequestParam(name = "name", required = false) String name) {
//        model.addAttribute("DM", new DanhMuc());
//        model.addAttribute("listDanhMuc", danhMucService.getDanhMucs());
//        return "/quan-ly/danh-muc/view";
//    }
//
//    @PostMapping("")
//    public String add(@Valid @ModelAttribute("DM") DanhMuc danhMucRequest , BindingResult bindingResult, Model model) {
////        if (bindingResult.hasErrors()) {
////            System.out.println("Lỗi");
////        }
//        danhMucService.addDanhMuc(danhMucRequest);
//        model.addAttribute("DM", new DanhMuc());
//        model.addAttribute("listDanhMuc", danhMucService.getDanhMucs());
//        return "redirect:/danh-muc";
//    }
//
//    @GetMapping("delete/{id}")
//    public String delete(@PathVariable("id") DanhMuc danhMuc)
//    {
//        this.danhMucService.deleteDanhMuc(danhMuc.getId());
////        return "redirect:/thuong-hieu/view";
//        return "redirect:/danh-muc";
//
//    }
//
//}

package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.DanhMuc;
import com.bags.sixdoBag.model.entitys.DoiTuongSuDung;
import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.repository.DoiTuongSuDungRepository;
import com.bags.sixdoBag.model.repository.KhuyenMaiRepository;
import com.bags.sixdoBag.service.DoiTuongSuDungService;
import com.bags.sixdoBag.service.KhuyenMaiService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.time.DateTimeException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/khuyen-mai")
public class KhuyenMaiController {
    public final KhuyenMaiService khuyenMaiService;
    public final KhuyenMaiRepository khuyenMaiRepository;

    @GetMapping("")
    public String getKhuyenMai(Model model, @RequestParam(name = "name", required = false) String name) {
        model.addAttribute("listKhuyenMai", khuyenMaiService.getKhuyenMais());
        return "/quan-ly/khuyen-mai/view";
    }

    @PostMapping("/add")
    public ResponseEntity<?> add(@RequestParam("maKhuyenMai") String maKhuyenMai,
                                 @RequestParam("ten") String ten,
                                 @RequestParam("giaTriGiam") double giaTriGiam,
                                 @RequestParam("ngayBatDau") LocalDateTime ngayBatDau,
                                 @RequestParam("ngayKetThuc") LocalDateTime ngayKetThuc,
                                 @RequestParam("moTa") String moTa,
                                 @RequestParam("trangThai") boolean trangThai, Model model
    ) {
        System.out.println(maKhuyenMai);
        KhuyenMai km1 = khuyenMaiRepository.searchKhuyenMaiByMa(maKhuyenMai);
        KhuyenMai km2 = khuyenMaiRepository.searchKhuyenMaiByTen(ten);
//        KhuyenMai km3 = khuyenMaiRepository.searchNgayBD(ngayBatDau);
//        KhuyenMai km4 = khuyenMaiRepository.searchNgayKT(ngayKetThuc);
        System.out.println(km1);
        System.out.println(km2);
        System.out.println(trangThai);
        LocalDateTime currentTime = LocalDateTime.now();

        if(ngayKetThuc.isBefore(currentTime)){
            return ResponseEntity.ok("errorNgayKT");
        }
        if (km1 == null && km2 == null) {
            KhuyenMai khuyenMai = new KhuyenMai();
            khuyenMai.setMaKhuyenMai(maKhuyenMai);
            khuyenMai.setTen(ten);
            khuyenMai.setGiaTriGiam(giaTriGiam);
            khuyenMai.setNgayBatDau(ngayBatDau);
            khuyenMai.setNgayKetThuc(ngayKetThuc);
            khuyenMai.setMoTa(moTa);
            khuyenMai.setTrangThai(trangThai);
            khuyenMaiService.addKhuyenMai(khuyenMai);
            return ResponseEntity.ok("ok");
        } else if (km1 != null && km2 == null) {
            return ResponseEntity.ok("errorMa");
        } else {
            return ResponseEntity.ok("errorTen");
        }
    }

    @PostMapping("/update")
    public ResponseEntity<?> suaThuongHieu(@RequestParam("id") Integer id,
                                           @RequestParam("maKhuyenMai") String maKhuyenMai,
                                           @RequestParam("ten") String ten,
                                           @RequestParam("giaTriGiam") double giaTriGiam,
                                           @RequestParam("ngayBatDau") LocalDateTime ngayBatDau,
                                           @RequestParam("ngayKetThuc") LocalDateTime ngayKetThuc,
                                           @RequestParam("moTa") String moTa,
                                           @RequestParam("trangThai") boolean trangThai, Model model) {

        KhuyenMai khuyenMai = khuyenMaiService.getKhuyenMai(id);

        khuyenMai.setMaKhuyenMai(maKhuyenMai);
        khuyenMai.setTen(ten);
        khuyenMai.setGiaTriGiam(giaTriGiam);
        khuyenMai.setNgayBatDau(ngayBatDau);
        khuyenMai.setNgayKetThuc(ngayKetThuc);
        khuyenMai.setTen(moTa);
        khuyenMai.setTrangThai(trangThai);

        khuyenMaiService.editKhuyenMai(id, khuyenMai);

        return ResponseEntity.ok("ok");
    }

    @PostMapping("/xoa-khuyen-mai")
    public ResponseEntity<?> xoaKhuyenMai(@RequestBody Map<String, Object> requestBody) {
        Integer idKhuyenMai = (Integer) requestBody.get("idKhuyenMai");
        khuyenMaiService.deleteKhuyenMai(idKhuyenMai);
        List<KhuyenMai> danhSachKhuyenMai = khuyenMaiService.getKhuyenMais();
        return ResponseEntity.ok(danhSachKhuyenMai);
    }
}