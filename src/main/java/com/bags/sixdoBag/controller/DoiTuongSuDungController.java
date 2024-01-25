package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.DoiTuongSuDung;
import com.bags.sixdoBag.service.DoiTuongSuDungService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("doi-tuong-su-dung")
public class DoiTuongSuDungController {

    private final DoiTuongSuDungService doiTuongSuDungService;

    @GetMapping("")
    public ResponseEntity<?> getObject() {
        return new ResponseEntity<>(doiTuongSuDungService.getListDoiTuongSuDung(), HttpStatus.OK);
    }

    @GetMapping("/search")
    public ResponseEntity<?> getSearch(@RequestParam String tenMa) {
        return new ResponseEntity<>(doiTuongSuDungService.searchDoiTuongSuDung(tenMa), HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity<?> addObject(@RequestBody @Valid DoiTuongSuDung danhMuc) {
        return new ResponseEntity<>(doiTuongSuDungService.addDoiTuongSuDung(danhMuc), HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> addObject(@PathVariable Integer id, @RequestBody @Valid DoiTuongSuDung danhMuc) {
        return new ResponseEntity<>(doiTuongSuDungService.editDoiTuongSuDung(id, danhMuc), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> addObject(@PathVariable Integer id) {
        return new ResponseEntity<>(doiTuongSuDungService.deleteDoiTuongSuDung(id), HttpStatus.OK);
    }
}
