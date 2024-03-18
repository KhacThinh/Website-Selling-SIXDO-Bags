package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.entitys.MaGiamGia;
import com.bags.sixdoBag.model.repository.MaGiamGiaRepository;
import com.bags.sixdoBag.service.MaGiamGiaService;
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
@RequestMapping("/ma_giam_gia")
public class MaGiamGiaController {
    public final MaGiamGiaService maGIamGiaService;
    public final MaGiamGiaRepository maGiamGiaRepository;

    //    @GetMapping("")
//    public String getMGG(Model model, @RequestParam(name = "name", required = false) String name) {
//        model.addAttribute("listColors", maGIamGiaService.getListMaGiamGia());
//        return "/quan-ly/ma-giam-gia/view";
//    }
    @GetMapping("")
    public String getMGG(Model model, @RequestParam(name = "name", required = false) String name,
                         @RequestParam(defaultValue = "0", name = "page") int page,
                         @RequestParam(name = "trangThai", required = false) Boolean trangThai) {
        Pageable pageable = PageRequest.of(page, 10);
        Page<MaGiamGia> khuyenMais;

        if (name != null && !name.isEmpty()) {
            model.addAttribute("nameSearch", name);
            khuyenMais = maGIamGiaService.searchMGGTenOrMa(name, pageable);
        } else if (trangThai != null) {
            khuyenMais = maGIamGiaService.searchcbb(trangThai, pageable);
        } else {
            khuyenMais = maGiamGiaRepository.findAll(pageable);
        }

        model.addAttribute("listColors", khuyenMais);
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
                                 @RequestParam("trangThai") boolean trangThai, Model model
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

//    @PostMapping("/delete")
//    public ResponseEntity<?> xoaChucVu(@RequestParam("idMaGiamGia") Integer id) {
//        return ResponseEntity.ok(maGIamGiaService.deleteMaGiamGia(id));
//    }

    @PostMapping("/delete/{id}")
    public ResponseEntity<?> deleteKhuyenMai(@PathVariable("id") Integer id) {
        MaGiamGia khuyenMai = maGIamGiaService.getMaGiamGia(id);
        if (khuyenMai != null) {
            khuyenMai.setTrangThai(false); // Đánh dấu là không hoạt động thay vì xóa
            maGIamGiaService.editMaGiamGia(id, khuyenMai); // Cập nhật khuyến mãi
            return ResponseEntity.ok("ok");
        } else {
            return ResponseEntity.ok("error");
        }
    }
}
