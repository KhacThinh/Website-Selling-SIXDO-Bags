package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.service.ChucVuService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/chucvu")
public class ChucVuController {
    public final ChucVuService chucVuService;

    @GetMapping("")
    public ResponseEntity<?> getAll() {
        return ResponseEntity.ok(chucVuService.getListChucVu());
    }

    @PostMapping("")
    public ResponseEntity<?> add(@RequestBody @Valid ChucVu cv) {
        return ResponseEntity.ok(chucVuService.addChucVu(cv));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> edit(@RequestBody @Valid ChucVu cv, @PathVariable int id) {
        return ResponseEntity.ok(chucVuService.editChucVu(id, cv));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable int id) {
        return ResponseEntity.ok(chucVuService.deleteChucVu(id));
    }
}
