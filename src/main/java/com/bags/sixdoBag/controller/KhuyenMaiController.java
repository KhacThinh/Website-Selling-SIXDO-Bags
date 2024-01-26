package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.service.KhuyenMaiService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("khuyen-mai")
@RequiredArgsConstructor
public class KhuyenMaiController {
    private final KhuyenMaiService khuyenMaiService;

    @GetMapping("")
    public ResponseEntity<?> getKhuyenMai() {
        return new ResponseEntity<>(khuyenMaiService.getKhuyenMais(), HttpStatus.OK);
    }

    @GetMapping("/search")
    public ResponseEntity<?> getKhuyenMai(
            @RequestParam String tenMa
    ) {
        return new ResponseEntity<>(khuyenMaiService.searchKhuyenMaiTenOrMa(tenMa), HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity<?> addKhuyenMai(@RequestBody @Valid KhuyenMai khuyenMai) {
        return new ResponseEntity<>(khuyenMaiService.addKhuyenMai(khuyenMai), HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> editKhuyenMai(@PathVariable int id, @RequestBody @Valid KhuyenMai khuyenMai) {
        return new ResponseEntity<>(khuyenMaiService.editKhuyenMai(id, khuyenMai), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteKhuyeMai(@PathVariable int id) {
        return new ResponseEntity<>(khuyenMaiService.deleteKhuyenMai(id), HttpStatus.OK);
    }
}
