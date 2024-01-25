package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.DanhMuc;
import com.bags.sixdoBag.service.DanhMucService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("danh-muc")
public class DanhMucController {
    private final DanhMucService danhMucService;

    @GetMapping("")
    public ResponseEntity<?> getObject() {
        return new ResponseEntity<>(danhMucService.getDanhMucs(), HttpStatus.OK);
    }

    @GetMapping("/search")
    public ResponseEntity<?> getSearch(@RequestParam String tenMa) {
        return new ResponseEntity<>(danhMucService.searchDanhMuc(tenMa), HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity<?> addObject(@RequestBody @Valid DanhMuc danhMuc) {
        return new ResponseEntity<>(danhMucService.addDanhMuc(danhMuc), HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> addObject(@PathVariable Integer id, @RequestBody @Valid DanhMuc danhMuc) {
        return new ResponseEntity<>(danhMucService.editDanhMuc(id, danhMuc), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> addObject(@PathVariable Integer id) {
        return new ResponseEntity<>(danhMucService.deleteDanhMuc(id), HttpStatus.OK);
    }

}
