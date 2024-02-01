package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.NhanVienRequest;
import com.bags.sixdoBag.model.dto.request.SanPhamRequest;
import com.bags.sixdoBag.model.entitys.NhanVien;
import com.bags.sixdoBag.service.NhanVienService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("nhan-vien")
@RequiredArgsConstructor
public class NhanVienController {

    private final NhanVienService nhanVienService;

    @GetMapping("")
    public ResponseEntity<?> getKhuyenMai() {
        return new ResponseEntity<>(nhanVienService.getNhanViens(), HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity<?> addKhuyenMai(@RequestBody @Valid NhanVienRequest nhanVien) {
        return new ResponseEntity<>(nhanVienService.addNhanVien(nhanVien), HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> addKhuyenMai(@PathVariable int id, @RequestBody @Valid NhanVienRequest nhanVien) {
        return new ResponseEntity<>(nhanVienService.editNhanVien(id, nhanVien), HttpStatus.OK);
    }
}
