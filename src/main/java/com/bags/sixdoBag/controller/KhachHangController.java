package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.SanPhamRequest;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.service.KhachHangService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/khach_hang")
public class KhachHangController {
    public final KhachHangService khachHangService;
    @GetMapping("")
    public ResponseEntity<?> getAll() {
        return new ResponseEntity<>(khachHangService.getListKhachHang(), HttpStatus.OK);
    }


    @PostMapping("")
    public ResponseEntity<?> addKhachHang(@RequestBody @Valid KhachHang khachHang) {
        return new ResponseEntity<>(khachHangService.addKhachHang(khachHang), HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> editKhuyenMai(@PathVariable int id, @RequestBody @Valid KhachHang khachHang) {
        return new ResponseEntity<>(khachHangService.editKhachHang(id,khachHang), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteKhuyeMai(@PathVariable int id) {
        return new ResponseEntity<>(khachHangService.deleteKhachHang(id), HttpStatus.OK);
    }

}
