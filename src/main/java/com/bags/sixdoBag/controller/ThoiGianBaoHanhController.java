package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.ThoiGianBaoHanh;
import com.bags.sixdoBag.service.ThoiGianBaoHanhService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/thoigianbaohanh")
public class ThoiGianBaoHanhController {
    public final ThoiGianBaoHanhService thoiGianBaoHanhService;

    @GetMapping("")
    public ResponseEntity<?> getAll() {
        return ResponseEntity.ok(thoiGianBaoHanhService.getThoiGianBaoHanhs());
    }

    @PostMapping("")
    public ResponseEntity<?> add(@RequestBody @Valid ThoiGianBaoHanh thoiGianBaoHanh) {
        return ResponseEntity.ok(thoiGianBaoHanhService.addThoiGianBaoHanh(thoiGianBaoHanh));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> edit(@RequestBody @Valid ThoiGianBaoHanh thoiGianBaoHanh, @PathVariable Integer id) {
        return ResponseEntity.ok(thoiGianBaoHanhService.editThoiGianBaoHanh(id, thoiGianBaoHanh));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable Integer id) {
        return ResponseEntity.ok(thoiGianBaoHanhService.deleteThoiGianBaoHanh(id));
    }
    @GetMapping("/searchMa")
    public ResponseEntity<?>searchMa(@RequestParam String tenMa){
        return ResponseEntity.ok(thoiGianBaoHanhService.searchMa(tenMa));
    }
    @GetMapping("/searchTime")
    public ResponseEntity<?>searchTime(@RequestParam Integer time){
        return ResponseEntity.ok(thoiGianBaoHanhService.searchTime(time));
    }
}
