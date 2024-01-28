package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.SanPhamRequest;
import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.service.KhuyenMaiService;
import com.bags.sixdoBag.service.SanPhamService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("san-pham")
@RequiredArgsConstructor
public class SanPhamController {
    private final SanPhamService sanPhamService;

    @GetMapping("")
    public ResponseEntity<?> getKhuyenMai() {
        return new ResponseEntity<>(sanPhamService.getSanPhams(), HttpStatus.OK);
    }

    @GetMapping("/search")
    public ResponseEntity<?> getKhuyenMai(
            @RequestParam String tenMa
    ) {
        return new ResponseEntity<>(sanPhamService.searchSanPhamTenOrMa(tenMa), HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity<?> addKhuyenMai(@RequestBody @Valid SanPhamRequest khuyenMai) {
        return new ResponseEntity<>(sanPhamService.addSanPham(khuyenMai), HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> editKhuyenMai(@PathVariable int id, @RequestBody @Valid SanPhamRequest khuyenMai) {
        return new ResponseEntity<>(sanPhamService.editSanPham(id, khuyenMai), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteKhuyeMai(@PathVariable int id) {
        return new ResponseEntity<>(sanPhamService.deleteSanPham(id), HttpStatus.OK);
    }
}
