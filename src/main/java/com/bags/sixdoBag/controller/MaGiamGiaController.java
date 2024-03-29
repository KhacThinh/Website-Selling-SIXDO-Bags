package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.MaGiamGiaDTO;
import com.bags.sixdoBag.model.entitys.DanhSachKhachHangApMgg;
import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.entitys.MaGiamGia;
import com.bags.sixdoBag.model.repository.MaGiamGiaRepository;
import com.bags.sixdoBag.service.KhachHangService;
import com.bags.sixdoBag.service.MaGiamGiaService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/ma-giam-gia")
public class MaGiamGiaController {
    public final MaGiamGiaService maGIamGiaService;
    public final MaGiamGiaRepository maGiamGiaRepository;
    private  final KhachHangService khachHangService;


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

        model.addAttribute("listsKhachHang", khachHangService.getListKhachHang());
        return "/quan-ly/ma-giam-gia/view";
    }


    @PostMapping("/add")
    public ResponseEntity<?> add(Model model, @RequestBody MaGiamGiaDTO maGiamGiaDTO
                                 ) {
        System.out.println("maGiamGia"+maGiamGiaDTO.getMaGiamGia());
        MaGiamGia gg1 = maGiamGiaRepository.searchMaGiamGiaByMa(maGiamGiaDTO.getMaGiamGia());
        MaGiamGia gg2 = maGiamGiaRepository.searchMaGiamGiaByTen(maGiamGiaDTO.getTenMaGiamGia());

        if (gg1 == null && gg2 == null) {
            MaGiamGia maGiamGia1 = new MaGiamGia();
            maGiamGia1.setMaGiamGia(maGiamGiaDTO.getMaGiamGia());
            maGiamGia1.setTenMaGiamGia(maGiamGiaDTO.getTenMaGiamGia());
            maGiamGia1.setGiaTriGiam(maGiamGiaDTO.getGiaTriGiam());
            maGiamGia1.setNgayBatDau(maGiamGiaDTO.getNgayBatDau());
            maGiamGia1.setNgayKetThuc(maGiamGiaDTO.getNgayKetThuc());
            maGiamGia1.setSoLuong(maGiamGiaDTO.getSoLuong());
            maGiamGia1.setDieuKienGiam(maGiamGiaDTO.getDieuKienGiam());
            maGiamGia1.setMoTa(maGiamGiaDTO.getMoTa());
            maGiamGia1.setTrangThai(true);

            maGIamGiaService.addMaGiamGia(maGiamGia1);
            for (Integer o : maGiamGiaDTO.getListId()){
                System.out.println("iddd" + o);
                maGIamGiaService.insertKhachHangMgg(o,maGIamGiaService.top1IdMaGiamGia());
            }
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

    @PostMapping("/ap-dung-ma-giam-gia")
    public ResponseEntity<?> apDungMaGiamGia( @RequestParam("idKhachHang") int idKhachHang ,
                                              @RequestParam("maGiamGia") String maGiamGia) {
        System.out.println("idkh"+idKhachHang);
        System.out.println("mgg"+maGiamGia);

        MaGiamGia maGiamGia1 = maGIamGiaService.searchMaGiamGiaByMa(maGiamGia);
        System.out.println("gai tri giam" + maGiamGia1.getGiaTriGiam());
        int danhSachKhachHangApMgg = maGIamGiaService.apDungMaGiamGia(idKhachHang,maGiamGia1.getId());
        if (danhSachKhachHangApMgg >0) {
            double giaTriGiam = maGiamGia1.getGiaTriGiam();
            return ResponseEntity.ok(giaTriGiam);
        } else {
            return ResponseEntity.ok("error");
        }
    }
}
