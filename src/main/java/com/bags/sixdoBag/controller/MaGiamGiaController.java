package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.MaGiamGia;
import com.bags.sixdoBag.service.MaGiamGiaService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/ma_giam_gia")
public class MaGiamGiaController {

    public final MaGiamGiaService maGIamGiaService;
    @GetMapping("")
    public ResponseEntity<?> getAll() {
        return ResponseEntity.ok(maGIamGiaService.getListMaGiamGia());
    }

    @PostMapping("")
    public ResponseEntity<?> add(@RequestBody @Valid MaGiamGia maGiamGia) {
        return ResponseEntity.ok(maGIamGiaService.addMaGiamGia(maGiamGia));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> edit(@RequestBody @Valid MaGiamGia maGiamGia, @PathVariable int id) {
        return ResponseEntity.ok(maGIamGiaService.editMaGiamGia(id, maGiamGia));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable int id) {
        return ResponseEntity.ok(maGIamGiaService.deleteMaGiamGia(id));
    }
}
