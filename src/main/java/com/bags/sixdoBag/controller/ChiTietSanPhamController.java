package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.ChiTietSanPhamRequest;
import com.bags.sixdoBag.service.ChiTietSanPhamServivce;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("chi-tiet-san-pham")
@RequiredArgsConstructor
public class ChiTietSanPhamController {
    private final ChiTietSanPhamServivce chiTietSanPhamServivce;

    @GetMapping("")
    public ResponseEntity<?> getKhuyenMai() {
        return new ResponseEntity<>(chiTietSanPhamServivce.getChiTietSanPhams(), HttpStatus.OK);
    }

//    @GetMapping("/search")
//    public ResponseEntity<?> getKhuyenMai(
//            @RequestParam String tenMa
//    ) {
//        return new ResponseEntity<>(chiTietSanPhamServivce.searchSanPhamTenOrMa(tenMa), HttpStatus.OK);
//    }

    @PostMapping("")
    public ResponseEntity<?> addKhuyenMai(@RequestBody ChiTietSanPhamRequest khuyenMai) {
        return new ResponseEntity<>(chiTietSanPhamServivce.addChiTietSanPham(khuyenMai), HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> editKhuyenMai(@PathVariable int id, @RequestBody @Valid ChiTietSanPhamRequest khuyenMai) {
        return new ResponseEntity<>(chiTietSanPhamServivce.editChiTietSanPham(id, khuyenMai), HttpStatus.OK);
    }

//    @DeleteMapping("/{id}")
//    public ResponseEntity<?> deleteKhuyeMai(@PathVariable int id) {
//        return new ResponseEntity<>(sanPhamService.deleteSanPham(id), HttpStatus.OK);
//    }
}
