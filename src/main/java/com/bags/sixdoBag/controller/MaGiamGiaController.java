package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.MaGiamGiaDTO;
import com.bags.sixdoBag.model.entitys.DanhSachKhachHangApMgg;
import com.bags.sixdoBag.model.entitys.HoaDon;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.entitys.MaGiamGia;
import com.bags.sixdoBag.model.repository.HoaDonRepository;
import com.bags.sixdoBag.model.repository.MaGiamGiaRepository;
import com.bags.sixdoBag.service.HoaDonService;
import com.bags.sixdoBag.service.KhachHangService;
import com.bags.sixdoBag.service.MaGiamGiaService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.antlr.v4.runtime.misc.Pair;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.text.DateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;


@Controller
@RequiredArgsConstructor
@RequestMapping("/ma-giam-gia")
public class MaGiamGiaController {

    public final MaGiamGiaService maGIamGiaService;

    public final MaGiamGiaRepository maGiamGiaRepository;

    private final KhachHangService khachHangService;

    private final HttpSession session;

    private final HoaDonRepository hoaDonRepository;


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
//        MaGiamGia maGiamGia1 = maGIamGiaService.searchMaGiamGiaByMa(maGiamGia);

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

        System.out.println("maGiamGia" + maGiamGiaDTO.getMaGiamGia());
        MaGiamGia gg1 = maGiamGiaRepository.searchMaGiamGiaByMa(maGiamGiaDTO.getMaGiamGia().trim());
        MaGiamGia gg2 = maGiamGiaRepository.searchMaGiamGiaByTen(maGiamGiaDTO.getTenMaGiamGia().trim());
        if (Objects.nonNull(gg2)) {
            return ResponseEntity.ok("errorTen");
        }else if (gg1 != null) {
            return ResponseEntity.ok("errorMa");
//            (gg1 == null && gg2 == null)
        }else {
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

            int[] listIdKhachHang = null;
            listIdKhachHang = maGiamGiaDTO.getListId();
            if (listIdKhachHang.length == 0) {
                for (KhachHang o : khachHangService.getListKhachHang()) {
                    maGIamGiaService.insertKhachHangMgg(o.getId(), maGIamGiaService.top1IdMaGiamGia());
                }

            } else {
                for (int i = 0; i < listIdKhachHang.length; i++) {
                    int o = listIdKhachHang[i];
                    System.out.println("do dai " + listIdKhachHang.length);

                    System.out.println("idnay" + o);
                    maGIamGiaService.insertKhachHangMgg(o, maGIamGiaService.top1IdMaGiamGia());
                }
            }

            return ResponseEntity.ok("ok");
        }
    }

    public LocalDate formatterDate(String temp) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date = LocalDate.parse(temp);
        return date;
    }

    @PostMapping("/update")
    public ResponseEntity<?> suaMGG(@RequestBody MaGiamGiaDTO maGiamGiaDTO) {

        MaGiamGia maGiamGia1 = maGiamGiaRepository.searchMaGiamGiaByMa(maGiamGiaDTO.getMaGiamGia());
        maGiamGia1.setMaGiamGia(maGiamGiaDTO.getMaGiamGia());
        maGiamGia1.setTenMaGiamGia(maGiamGiaDTO.getTenMaGiamGia());
        maGiamGia1.setGiaTriGiam(maGiamGiaDTO.getGiaTriGiam());
        maGiamGia1.setNgayBatDau(maGiamGiaDTO.getNgayBatDau());
        maGiamGia1.setNgayKetThuc(maGiamGiaDTO.getNgayKetThuc());
        maGiamGia1.setSoLuong(maGiamGiaDTO.getSoLuong());
        maGiamGia1.setDieuKienGiam(maGiamGiaDTO.getDieuKienGiam());
        maGiamGia1.setMoTa(maGiamGiaDTO.getMoTa());
        maGiamGia1.setTrangThai(maGiamGiaDTO.isTrangThai());
        maGIamGiaService.editMaGiamGia(maGiamGia1.getId(), maGiamGia1);
        maGIamGiaService.deleteDanhSachKhMggByIdMgg(maGiamGia1.getId());

        int[] listIdKhachHang = null;
        listIdKhachHang = maGiamGiaDTO.getListId();
        if (listIdKhachHang.length == 0) {
            for (KhachHang o : khachHangService.getListKhachHang()) {
                maGIamGiaService.insertKhachHangMgg(o.getId(), maGiamGia1.getId());
            }

        } else {
            for (int i = 0; i < listIdKhachHang.length; i++) {
                int o = listIdKhachHang[i];
                System.out.println("do dai " + listIdKhachHang.length);

                System.out.println("idnay" + o);
                maGIamGiaService.insertKhachHangMgg(o, maGiamGia1.getId());
            }
        }

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
    public ResponseEntity<?> apDungMaGiamGia(@RequestParam("idKhachHang") int idKhachHang,
                                             @RequestParam("maGiamGia") String maGiamGia) {
        System.out.println("idkh" + idKhachHang);
        System.out.println("mgg" + maGiamGia);
        try {
            MaGiamGia maGiamGia1 = maGIamGiaService.searchMaGiamGiaByMa(maGiamGia.trim());
            int danhSachKhachHangApMgg = maGIamGiaService.apDungMaGiamGia(idKhachHang, maGiamGia1.getId());
            return ResponseEntity.ok(maGiamGia1);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok("error");
        }
    }


    @PostMapping("/check-ma-giam-gia")
    public ResponseEntity<?> apDungMaGiamGia(@RequestParam("maGiamGia") String maGiamGia) {
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        System.out.println("/ma-giam-gia/check-ma-giam-gia");
//        if (maGiamGia.equals("")) {
//            return ResponseEntity.ok("error");
//        }
        try {
            MaGiamGia maGiamGia1 = maGIamGiaService.searchMaGiamGiaByMa(maGiamGia.trim());
            MaGiamGia danhSachKhachHangApMgg = maGIamGiaService.getMaGiamGiaByKhachHang(khachHang.getId(), maGiamGia1.getId());
            return ResponseEntity.ok(danhSachKhachHangApMgg);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok("error");
        }
    }

    @PostMapping("/get-lishkh-by-mgg")
    public ResponseEntity<?> getListKhByMgg(@RequestParam("id") int id) {
        int[] maGiamGia = maGIamGiaService.getidKhByMgg(id);
        return ResponseEntity.ok(maGiamGia);

    }


    @PostMapping("/checkDieuKhienMaGiamGia")
    public ResponseEntity<?> checkDkMgg(@RequestParam("maHoaDon") String maHd, @RequestParam("tongTienHang") Double tongTienHang,@RequestParam("phiShip") Double phiShip) {
        HoaDon hoaDon = hoaDonRepository.getHoaDonByMaHoaDon(maHd);


        if (hoaDon.getMaGiamGia() != null) {

            int dkGiam = hoaDon.getMaGiamGia().getDieuKienGiam();
            if (tongTienHang >= dkGiam) {
                hoaDon.setGiamGia(hoaDon.getMaGiamGia().getGiaTriGiam().floatValue());
                hoaDon.setTongTien(tongTienHang-hoaDon.getMaGiamGia().getGiaTriGiam()+phiShip);
                hoaDon.setPhiVanChuyen(phiShip);
                hoaDonRepository.save(hoaDon);

                return ResponseEntity.ok(hoaDon.getMaGiamGia().getGiaTriGiam());
            } else {
                hoaDon.setGiamGia(0);
                hoaDon.setTongTien(tongTienHang);
                hoaDon.setPhiVanChuyen(phiShip);
                hoaDonRepository.save(hoaDon);

                return ResponseEntity.ok("error");
            }
        } else {
            return ResponseEntity.ok("error");
        }


    }
}
