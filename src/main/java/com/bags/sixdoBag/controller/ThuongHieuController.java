package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.ThuongHieu;
import com.bags.sixdoBag.service.ThuongHieuService;
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
@RequestMapping("/thuonghieu")
public class ThuongHieuController {
    public final ThuongHieuService thuongHieuService;

    @GetMapping("")
    public ResponseEntity<?> getAll() {
        return ResponseEntity.ok(thuongHieuService.getThuongHieus());
    }
    @PostMapping("")
    public ResponseEntity<?>add(@RequestBody @Valid ThuongHieu th ){
        return ResponseEntity.ok(thuongHieuService.addThuongHieu(th));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?>edit(@RequestBody @Valid ThuongHieu th, @PathVariable int id){
        return ResponseEntity.ok(thuongHieuService.editThuongHieu(id,th));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?>delete(@PathVariable int id){
        return ResponseEntity.ok(thuongHieuService.deleteThuongHieu(id));
    }
}
