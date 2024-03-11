package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.NhanVienRequest;
import com.bags.sixdoBag.model.dto.request.SanPhamRequest;
import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.model.entitys.DiaChiKhachHang;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.entitys.NhanVien;
import com.bags.sixdoBag.model.repository.NhanVienRepository;
import com.bags.sixdoBag.service.ChucVuService;
import com.bags.sixdoBag.service.NhanVienService;
import com.bags.sixdoBag.service.TaiKhoanService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;

@Controller
@RequestMapping("nhan-vien")
@RequiredArgsConstructor
public class NhanVienController {

    private final NhanVienService nhanVienService;
    private final TaiKhoanService taiKhoanService;
    private final ChucVuService chucVuService;
    private final NhanVienRepository nhanVienRepository;
    @GetMapping("")
    public String getMGG(Model model, @RequestParam(name = "name", required = false) String name) {
        model.addAttribute("listColors", nhanVienService.getNhanViens());
        model.addAttribute("listColors1", taiKhoanService.getTaiKhoans());
        model.addAttribute("listColors2", chucVuService.getListChucVu());
        return "/quan-ly/nhan-vien/view";
    }

    @PostMapping("/add")
    public ResponseEntity<?> add(

            @RequestParam("maNhanVien") String maNhanVien,
            @RequestParam("hoTen") String hoTen,
            @RequestParam("ngaySinh") String ngaySinh,
            @RequestParam("sdt") String sdt,
            @RequestParam("email") String email,
            @RequestParam("matKhau") String matKhau,
            @RequestParam("queQuan") String queQuan,
            @RequestParam("cccd") String cccd,
            @RequestParam("thoiGianVao") LocalDateTime thoiGianVao,
            @RequestParam("thoiGianRa") LocalDateTime thoiGianRa,
            @RequestParam("gioiTinh") Integer gioiTinh,
            @RequestParam("trangThai") Integer trangThai,
            @RequestParam("id") Integer id,
            Model model
    ) {
        System.out.println(id);
        ChucVu chucVu= chucVuService.getChucVu(id);
        System.out.println(chucVu);
        NhanVien gg = nhanVienRepository.searchNhanVienByMa(maNhanVien);

        if (gg == null) {
            NhanVien nhanVien1 = new NhanVien();
            nhanVien1.setChucVu(chucVu);
            nhanVien1.setMaNhanVien(maNhanVien);
            nhanVien1.setHoTen(hoTen);
            nhanVien1.setNgaySinh(ngaySinh);
            nhanVien1.setSdt(sdt);
            nhanVien1.setEmail(email);
            nhanVien1.setMatKhau(matKhau);
            nhanVien1.setQueQuan(queQuan);
            nhanVien1.setCccd(cccd);
            nhanVien1.setThoiGianVao(thoiGianVao);
            nhanVien1.setThoiGianRa(thoiGianRa);
            nhanVien1.setGioiTinh(gioiTinh);
            nhanVien1.setTrangThai(trangThai);
            nhanVienService.addNhanVien(nhanVien1);
            return ResponseEntity.ok("ok");
        } else{
            return ResponseEntity.ok("errorTen");
        }
    }

    @PostMapping("/update")
    public ResponseEntity<?> suaMGG(@RequestParam("id") Integer id,
                                    @RequestParam("maNhanVien") String maNhanVien,
                                    @RequestParam("hoTen") String hoTen,
                                    @RequestParam("gioiTinh") Integer gioiTinh,
                                    @RequestParam("ngaySinh") String ngaySinh,
                                    @RequestParam("sdt") String sdt,
                                    @RequestParam("email") String email,
                                    @RequestParam("matKhau") String matKhau,
                                    @RequestParam("queQuan") String queQuan,
                                    @RequestParam("cccd") String cccd,
                                    @RequestParam("thoiGianVao") LocalDateTime thoiGianVao,
                                    @RequestParam("thoiGianRa") LocalDateTime thoiGianRa,
                                    @RequestParam("trangThai") Integer trangThai,
                                    @RequestParam("idCV") Integer idCV

    ) {

        ChucVu chucVu= chucVuService.getChucVu(idCV);

        NhanVien nhanVien = nhanVienService.getidNhanVien(id);
//        System.out.println(maChucVu);
        nhanVien.setChucVu(chucVu);
        nhanVien.setMaNhanVien(maNhanVien);
        nhanVien.setHoTen(hoTen);
        nhanVien.setGioiTinh(gioiTinh);
        nhanVien.setNgaySinh(ngaySinh);
        nhanVien.setSdt(sdt);
        nhanVien.setEmail(email);
        nhanVien.setMatKhau(matKhau);
        nhanVien.setTrangThai(trangThai);
        nhanVien.setCccd(cccd);
        nhanVien.setQueQuan(queQuan);
        nhanVien.setThoiGianVao(thoiGianVao);
        nhanVien.setThoiGianRa(thoiGianRa);
        nhanVien.setChucVu(chucVu);

        nhanVienService.editNhanVien(id, nhanVien);
        return ResponseEntity.ok("ok");
    }

    @PostMapping("/delete")
    public ResponseEntity<?> xoaChucVu(@RequestParam("idNhanVien") Integer id) {
        return ResponseEntity.ok(nhanVienService.deleteNhanVien(id));
    }

}
