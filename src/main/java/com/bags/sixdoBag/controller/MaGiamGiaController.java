package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.model.entitys.MaGiamGia;
import com.bags.sixdoBag.model.repository.MaGiamGiaRepository;
import com.bags.sixdoBag.model.repository.MauSacRepository;
import com.bags.sixdoBag.service.MaGiamGiaService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.logging.SimpleFormatter;

@Controller
@RequiredArgsConstructor
@RequestMapping("/ma_giam_gia")
public class MaGiamGiaController {
    public final MaGiamGiaService maGIamGiaService;
    public final MaGiamGiaRepository maGiamGiaRepository;
    @GetMapping("")
    public String getMGG(Model model, @RequestParam(name = "name", required = false) String name) {
        model.addAttribute("listColors", maGIamGiaService.getListMaGiamGia());
        return "/quan-ly/ma-giam-gia/view";
    }

    @PostMapping("/add")
    public ResponseEntity<?> add(@RequestParam("maGiamGia") String maGiamGia,
                                 @RequestParam("tenMaGiamGia") String tenMaGiamGia,
                                 @RequestParam("giaTriGiam") double giaTriGiam,
                                 @RequestParam("ngayBatDau") String ngayBatDau,
                                 @RequestParam("soLuong") Integer soLuong,
                                 @RequestParam("dieuKienGiam") Integer dieuKienGiam,
                                 @RequestParam("ngayKetThuc") String ngayKetThuc,
                                 @RequestParam("moTa") String moTa,
                                 @RequestParam("trangThai") boolean trangThai,Model model
    ) {
        System.out.println(maGiamGia);
        MaGiamGia gg1 = maGiamGiaRepository.searchMaGiamGiaByMa(maGiamGia);
        MaGiamGia gg2 = maGiamGiaRepository.searchMaGiamGiaByTen(tenMaGiamGia);
        System.out.println(gg1);
        System.out.println(gg2);
        System.out.println(trangThai);

        if (gg1 == null && gg2 == null) {
            MaGiamGia maGiamGia1 = new MaGiamGia();
            maGiamGia1.setMaGiamGia(maGiamGia);
            maGiamGia1.setTenMaGiamGia(tenMaGiamGia);
            maGiamGia1.setGiaTriGiam(giaTriGiam);
            maGiamGia1.setNgayBatDau(ngayBatDau);
            maGiamGia1.setNgayKetThuc(ngayKetThuc);
            maGiamGia1.setSoLuong(soLuong);
            maGiamGia1.setDieuKienGiam(dieuKienGiam);
            maGiamGia1.setMoTa(moTa);
            maGiamGia1.setTrangThai(trangThai);
            maGIamGiaService.addMaGiamGia(maGiamGia1);
            return ResponseEntity.ok("ok");
        } else if (gg1 != null && gg2 == null) {
            return ResponseEntity.ok("errorMa");
        } else {
            return ResponseEntity.ok("errorTen");
        }
    }

    @PostMapping("/update")
    public ResponseEntity<?> suaMGG(@RequestParam("id") Integer id,
                                       @RequestParam("maGiamGia") String maGiamGia,
                                       @RequestParam("tenMaGiamGia") String tenMaGiamGia,
                                       @RequestParam("giaTriGiam") double giaTriGiam,
                                       @RequestParam("ngayBatDau") String ngayBatDau,
                                       @RequestParam("soLuong") Integer soLuong,
                                       @RequestParam("dieuKienGiam") Integer dieuKienGiam,
                                       @RequestParam("ngayKetThuc") String ngayKetThuc,
                                       @RequestParam("moTa") String moTa,
                                       @RequestParam("trangThai") boolean trangThai) {


        MaGiamGia maGiamGia1 = maGIamGiaService.getidMaGiamGia(id);
//        System.out.println(maChucVu);
        maGiamGia1.setMaGiamGia(maGiamGia);
        maGiamGia1.setTenMaGiamGia(tenMaGiamGia);
        maGiamGia1.setGiaTriGiam(giaTriGiam);
        maGiamGia1.setNgayBatDau(ngayBatDau);
        maGiamGia1.setNgayKetThuc(ngayKetThuc);
        maGiamGia1.setSoLuong(soLuong);
        maGiamGia1.setDieuKienGiam(dieuKienGiam);
        maGiamGia1.setMoTa(moTa);
        maGiamGia1.setTrangThai(trangThai);

        maGIamGiaService.editMaGiamGia(id, maGiamGia1);
        return ResponseEntity.ok("ok");
    }

    @PostMapping("/delete")
    public ResponseEntity<?> xoaChucVu(@RequestParam("idMaGiamGia") Integer id) {
        return ResponseEntity.ok(maGIamGiaService.deleteMaGiamGia(id));
    }
}
