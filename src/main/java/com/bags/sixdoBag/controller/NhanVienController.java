package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.NhanVienRequest;
import com.bags.sixdoBag.model.dto.request.SanPhamRequest;
import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.model.entitys.DiaChiKhachHang;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.entitys.NhanVien;
import com.bags.sixdoBag.model.entitys.TaiKhoan;
import com.bags.sixdoBag.model.repository.NhanVienRepository;
import com.bags.sixdoBag.service.ChucVuService;
import com.bags.sixdoBag.service.NhanVienService;
import com.bags.sixdoBag.service.TaiKhoanService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Controller
@RequestMapping("nhan-vien")
@RequiredArgsConstructor
public class NhanVienController {

    private final NhanVienService nhanVienService;
    private final TaiKhoanService taiKhoanService;
    private final ChucVuService chucVuService;
    private final NhanVienRepository nhanVienRepository;

    //    @GetMapping("")
//    public String getMGG(Model model, @RequestParam(name = "name", required = false) String name) {
//        model.addAttribute("listColors", nhanVienService.getNhanViens());
//        model.addAttribute("listColors1", taiKhoanService.getTaiKhoans());
//        model.addAttribute("listColors2", chucVuService.getListChucVu());
//        return "/quan-ly/nhan-vien/view";
//    }
    @GetMapping("")
    public String getMGG(Model model, @RequestParam(name = "name", required = false) String name,
                         @RequestParam(defaultValue = "0", name = "page") int page,
                         @RequestParam(name = "trangThai", required = false) Integer trangThai,
                         @RequestParam(name = "chucVu", required = false) String chucVu,
                         @RequestParam(name = "chucVuId", required = false) Long chucVuId) {
        Pageable pageable = PageRequest.of(page, 10);
        Page<NhanVien> khuyenMais;

        if (chucVuId != null) {
            khuyenMais = nhanVienService.searchDCKHByChucVuId(chucVuId, pageable);
        } else if (name != null && !name.isEmpty()) {
            model.addAttribute("nameSearch", name);
            khuyenMais = nhanVienService.searchNhanVienTenOrMa(name.trim(), pageable);
        } else if (trangThai != null) {
            khuyenMais = nhanVienService.searchcbb(trangThai, pageable);
        } else if (chucVu != null) {
            khuyenMais = nhanVienService.searchcbb1(chucVu, pageable);
        } else {
            khuyenMais = nhanVienRepository.findAll(pageable);
        }

        model.addAttribute("listColors", khuyenMais);
        model.addAttribute("listColors1", taiKhoanService.getTaiKhoans());
        model.addAttribute("listColors2", chucVuService.getListChucVu());
        return "/quan-ly/nhan-vien/view";
    }

    @PostMapping("/add")
    public ResponseEntity<?> add(
            @RequestParam(value = "maNhanVien", required = false) String maNhanVien,
            @RequestParam("hoTen") String hoTen,
            @RequestParam("ngaySinh") String ngaySinh,
            @RequestParam("sdt") String sdt,
            @RequestParam("email") String email,
            @RequestParam("matKhau") String matKhau,
            @RequestParam("queQuan") String queQuan,
            @RequestParam("cccd") String cccd,
            @RequestParam("thoiGianVao") String thoiGianVao,
            @RequestParam("gioiTinh") Integer gioiTinh,
            @RequestParam("trangThai") Integer trangThai,
            @RequestParam("id") Integer id,
            Model model
    ) {

        String temp;
        System.out.println(id);
        ChucVu chucVu = chucVuService.getChucVu(id);
        System.out.println(chucVu);
        NhanVien gg = nhanVienRepository.searchNhanVienByMa(maNhanVien.trim());
        if (gg != null) {
            return ResponseEntity.ok("errorMa");
        } else {
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
            nhanVien1.setGioiTinh(gioiTinh);
            nhanVien1.setTrangThai(trangThai);
            nhanVien1 = nhanVienService.addNhanVien(nhanVien1);
            if (maNhanVien == null || maNhanVien.isEmpty()) {
                nhanVien1.setMaNhanVien("NV0" + nhanVien1.getId());
                nhanVienService.editNhanVien(nhanVien1.getId(), nhanVien1);

            }
            return ResponseEntity.ok("ok");

        }
    }
    private String generateRandomMaNhanVien() {
        // Tạo chuỗi ngẫu nhiên gồm "NV" và hai số ngẫu nhiên
        String randomNumbers = String.format("%02d", new Random().nextInt(100));
        return "NV" + randomNumbers;
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
                                    @RequestParam("thoiGianVao") String thoiGianVao,
                                    @RequestParam("trangThai") Integer trangThai,
                                    @RequestParam("idCV") Integer idCV

    ) {

        ChucVu chucVu = chucVuService.getChucVu(idCV);

        NhanVien nhanVien = nhanVienService.getidNhanVien(id);
        TaiKhoan taiKhoan = nhanVien.getTaiKhoan();
        if(taiKhoan == null){
            TaiKhoan taiKhoan1 = new TaiKhoan();
            taiKhoan1.setTenDangNhap(email);
            taiKhoan1.setMatKhau(matKhau);
            nhanVien.setTaiKhoan(taiKhoan1);
        }else {
            taiKhoan.setTenDangNhap(email);
            taiKhoan.setMatKhau(matKhau);
            nhanVien.setTaiKhoan(taiKhoan);
        }
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
        nhanVien.setQueQuan(queQuan);
        nhanVien.setThoiGianVao(thoiGianVao);
        nhanVien.setChucVu(chucVu);

        nhanVienService.editNhanVien(id, nhanVien);
        return ResponseEntity.ok("ok");
    }

    @PostMapping("/delete/{id}")
    public ResponseEntity<?> deleteKhuyenMai(@PathVariable("id") Integer id) {
        NhanVien khuyenMai = nhanVienService.getidNhanVien(id);
        if (khuyenMai != null) {
            khuyenMai.setTrangThai(0); // Đánh dấu là không hoạt động thay vì xóa

            nhanVienService.editNhanVien(id, khuyenMai); // Cập nhật khuyến mãi
            return ResponseEntity.ok("ok");
        } else {
            return ResponseEntity.ok("error");
        }
    }


    @GetMapping("/checkMail-update")
    public @ResponseBody
    boolean checkMailUpdate(@RequestParam("email") String email, @RequestParam("idNv") int id) {
        NhanVien nhanVien1 = nhanVienService.getNhanVien(id);
        NhanVien nhanVien2 = nhanVienService.getNhanVienByEmail(email);

        String email1 = nhanVien1.getEmail();
        if(email1.equals(email) || nhanVien2==null){
            return false;
        }
        else{
            return true;
        }
    }

    @GetMapping("/checkSDT-update")
    public @ResponseBody
    boolean checkSDTUpdate(@RequestParam("sdt") String sdt, @RequestParam("idNv") int id) {
        NhanVien nhanVien1 = nhanVienService.getNhanVien(id);
        NhanVien nhanVien2 = nhanVienService.getNhanVienBySDT(sdt);
        if(nhanVien1.getSdt().equals(sdt) || nhanVien2==null){
            return false;
        }
        else{
            return true;
        }
    }


    @GetMapping("/checkMail")
    public @ResponseBody
    boolean checkMail(@RequestParam("email") String email) {
        NhanVien nhanVien2 = nhanVienService.getNhanVienByEmail(email);
        if (nhanVien2 != null) {
            return true; // Email đã tồn tại
        }
        return false; // Email không tồn tại
    }

    @GetMapping("/checkSDT")
    public @ResponseBody
    boolean checkSDT(@RequestParam("sdt") String sdt) {
        NhanVien nhanVien = nhanVienService.getNhanVienBySDT(sdt);
        return nhanVien != null;
    }

    @GetMapping("/checkCCCD")
    public @ResponseBody
    boolean checkCCCD(@RequestParam("cccd") String cccd) {
        NhanVien nhanVien = nhanVienService.getNhanVienByCCCD(cccd);
        return nhanVien != null;
    }

    @GetMapping("/checkInfo")
    public @ResponseBody
    Map<String, Boolean> checkInfo(
            @RequestParam("sdt") String sdt,
            @RequestParam("cccd") String cccd) {

        Map<String, Boolean> result = new HashMap<>();

        // Kiểm tra số điện thoại
        NhanVien nhanVienBySDT = nhanVienService.getNhanVienBySDT(sdt);
        result.put("sdtExist", nhanVienBySDT != null);

        // Kiểm tra số căn cước
        NhanVien nhanVienByCCCD = nhanVienService.getNhanVienByCCCD(cccd);
        result.put("cccdExist", nhanVienByCCCD != null);

        return result;
    }
}

// Kiểm tra email
//        NhanVien nhanVienByEmail = nhanVienService.getNhanVienByEmail(email);
//        result.put("emailExist", nhanVienByEmail != null);