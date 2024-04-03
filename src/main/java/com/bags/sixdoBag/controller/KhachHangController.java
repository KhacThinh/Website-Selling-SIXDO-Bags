package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.repository.KhachHangRepository;
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

import java.util.Objects;

@Controller
@RequiredArgsConstructor
@RequestMapping("/khach_hang")
public class KhachHangController {
    public final KhachHangService khachHangService;
    public final KhachHangRepository khachHangRepository;
    public final TaiKhoanService taiKhoanService;


    //    @GetMapping("")
//    public String getMGG(Model model, @RequestParam(name = "name", required = false) String name) {
////            List<TaiKhoan> accountList = taiKhoanService.getTaiKhoans(); // Example method, you should replace it with your actual method
////            model.addAttribute("accountList", accountList);
//        model.addAttribute("listColors", khachHangService.getListKhachHang());
//        model.addAttribute("listColors1", taiKhoanService.getTaiKhoans());
//        return "/quan-ly/khach-hang/view";
//    }
    @GetMapping("")
    public String getMGG(Model model, @RequestParam(name = "name", required = false) String name,
                         @RequestParam(defaultValue = "0", name = "page") int page,
                         @RequestParam(name = "trangThai", required = false) Integer trangThai) {
        Pageable pageable = PageRequest.of(page, 10);
        Page<KhachHang> khuyenMais;

        if (name != null && !name.isEmpty()) {
            model.addAttribute("nameSearch", name);
            khuyenMais = khachHangService.searchKhachHangTenOrMa(name, pageable);
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

            @RequestParam("tenKhachHang") String tenKhachHang,
            @RequestParam("gioiTinh") Integer gioiTinh,
            @RequestParam("ngaySinh") String ngaySinh,
            @RequestParam("sdt") String sdt,
            @RequestParam("email") String email,
            @RequestParam("matKhau") String matKhau,
            @RequestParam("trangThai") Integer trangThai,
            Model model
    ) {
        System.out.println(sdt);
        System.out.println(email);
//        model.addAttribute("listColors1", taiKhoanService.getTaiKhoans());
//        KhachHang gg1 = khachHangRepository.searchKhBySdt(sdt);
//        KhachHang gg2 = khachHangRepository.searchKhByGM(email);
//
//        System.out.println(gg1);
//        System.out.println(gg2);

//        System.out.println(trangThai);
//        if (gg1 == null || gg2 == null) {
        KhachHang khachhang1 = new KhachHang();
        khachhang1.setTenKhachHang(tenKhachHang);
        khachhang1.setGioiTinh(gioiTinh);
        khachhang1.setNgaySinh(ngaySinh);
        khachhang1.setSdt(sdt);
        khachhang1.setEmail(email);
        khachhang1.setMatKhau(matKhau);
        khachhang1.setTrangThai(trangThai);
        khachHangService.addKhachHang(khachhang1);
        return ResponseEntity.ok("ok");
//        }
//        else if ( gg1 == null || gg2 != null) {
//            return ResponseEntity.ok("errorEmail");
//        } else {
//            return ResponseEntity.ok("error");
//        }
    }


    @PostMapping("/update")
    public ResponseEntity<?> suaMGG(@RequestParam("id") Integer id,
                                    @RequestParam("tenKhachHang") String tenKhachHang,
                                    @RequestParam("gioiTinh") Integer gioiTinh,
                                    @RequestParam("ngaySinh") String ngaySinh,
                                    @RequestParam("sdt") String sdt,
                                    @RequestParam("email") String email,
                                    @RequestParam("matKhau") String matKhau,
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
        khachHang.setMatKhau(matKhau);
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

}
