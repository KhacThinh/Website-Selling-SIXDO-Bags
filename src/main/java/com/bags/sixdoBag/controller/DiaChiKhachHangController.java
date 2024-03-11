package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.DiaChiKhachHangRequest;
import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.model.entitys.DiaChiKhachHang;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.repository.DiaChiKhachHangRepository;
import com.bags.sixdoBag.service.DiaChiKhachHangService;
import com.bags.sixdoBag.service.KhachHangService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/dia_chi_khach_hang")
public class DiaChiKhachHangController {
    public final DiaChiKhachHangService diaChiKhachHangService;
    public final KhachHangService khachHangService;
    public final DiaChiKhachHangRepository diaChiKhachHangRepository;

    @GetMapping("")
    public String getMGG(Model model, @RequestParam(name = "name", required = false) String name) {
        model.addAttribute("listColors", diaChiKhachHangService.getListDiaChiKhachHang());
        model.addAttribute("listColors1", khachHangService.getListKhachHang());
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
        KhachHang khachHang= khachHangService.getKhachHang(id);
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


    @PostMapping("/delete")
    public ResponseEntity<?> xoaDiaChiKh(@RequestParam("idKhachHang") Integer id) {
        return ResponseEntity.ok(diaChiKhachHangService.deleteDiaChiKhachHang(id));
    }
    }

