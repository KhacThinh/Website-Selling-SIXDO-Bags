package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.entitys.MaGiamGia;
import com.bags.sixdoBag.model.repository.KhuyenMaiRepository;
import com.bags.sixdoBag.service.KhuyenMaiService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Objects;

@Controller
@RequestMapping("khuyen-mai")
@RequiredArgsConstructor
public class KhuyenMaiController {
    private final KhuyenMaiService khuyenMaiService;
    private final KhuyenMaiRepository khuyenMaiRepository;


    @GetMapping("")
    public String getMGG(Model model, @RequestParam(name = "name", required = false) String name,
                         @RequestParam(defaultValue = "0", name = "page") int page,
                         @RequestParam(name = "trangThai", required = false) Boolean trangThai) {
        Pageable pageable = PageRequest.of(page, 10);
        Page<KhuyenMai> khuyenMais;

        if (name != null && !name.isEmpty()) {
            model.addAttribute("nameSearch", name);
            khuyenMais = khuyenMaiService.searchKhuyenMaiTenOrMa(name, pageable);
        } else if (trangThai != null) {
            khuyenMais = khuyenMaiService.searchcbb(trangThai, pageable);
        } else {
            khuyenMais = khuyenMaiRepository.findAll(pageable);
        }

        model.addAttribute("listColors", khuyenMais);
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

        KhuyenMai gg1 = khuyenMaiRepository.searchKhuyenMaiByMa(maKhuyenMai);
        KhuyenMai gg2 = khuyenMaiRepository.searchKhuyenMaiByTen(ten);


        if (gg1 == null && gg2 == null) {
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
        } else if (gg1 != null && gg2 == null) {
            return ResponseEntity.ok("errorMa");
        } else {
            return ResponseEntity.ok("errorTen");
        }
    }

    @PostMapping("/update")
    public ResponseEntity<?> suaMGG(@RequestParam("id") Integer id,
                                    @RequestParam("maKhuyenMai") String maKhuyenMai,
                                    @RequestParam("ten") String ten,
                                    @RequestParam("giaTriGiam") double giaTriGiam,
                                    @RequestParam("ngayBatDau") LocalDateTime ngayBatDau,
                                    @RequestParam("ngayKetThuc") LocalDateTime ngayKetThuc,
                                    @RequestParam("moTa") String moTa,
                                    @RequestParam("trangThai") boolean trangThai) {


        KhuyenMai khuyenMai = khuyenMaiService.getidKhuyenMai(id);

        khuyenMai.setMaKhuyenMai(maKhuyenMai);
        khuyenMai.setTen(ten);
        khuyenMai.setGiaTriGiam(giaTriGiam);
        khuyenMai.setNgayBatDau(ngayBatDau);
        khuyenMai.setNgayKetThuc(ngayKetThuc);
        khuyenMai.setMoTa(moTa);
        khuyenMai.setTrangThai(trangThai);

        khuyenMaiService.editKhuyenMai(id, khuyenMai);
        return ResponseEntity.ok("ok");
    }

//    @PostMapping("/delete")
//    public ResponseEntity<?> xoaChucVu(@RequestParam("idKhuyenMai") Integer id) {
//        return ResponseEntity.ok(khuyenMaiService.deleteKhuyenMai(id));
//    }

    @PostMapping("/delete/{id}")
    public ResponseEntity<?> deleteKhuyenMai(@PathVariable("id") Integer id) {
        KhuyenMai khuyenMai = khuyenMaiService.getKhuyenMai(id);
        if (khuyenMai != null) {
            khuyenMai.setTrangThai(false); // Đánh dấu là không hoạt động thay vì xóa
            khuyenMaiService.editKhuyenMai(id, khuyenMai); // Cập nhật khuyến mãi
            return ResponseEntity.ok("ok");
        } else {
            return ResponseEntity.ok("error");
        }
    }
}
