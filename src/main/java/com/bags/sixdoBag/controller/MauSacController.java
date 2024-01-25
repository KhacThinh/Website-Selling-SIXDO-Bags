package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.MauSac;
import com.bags.sixdoBag.service.MauSacService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("mau-sac")
public class MauSacController {
    private final MauSacService mauSacService;

    @GetMapping("")
    public ResponseEntity<?> getObject() {
        return new ResponseEntity<>(mauSacService.getMauSacs(), HttpStatus.OK);
    }

    @GetMapping("/search")
    public ResponseEntity<?> getSearch(@RequestParam String tenMa) {
        return new ResponseEntity<>(mauSacService.searchMauSac(tenMa), HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity<?> addObject(@RequestBody @Valid MauSac danhMuc) {
        return new ResponseEntity<>(mauSacService.addMauSac(danhMuc), HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> addObject(@PathVariable Integer id, @RequestBody @Valid MauSac danhMuc) {
        return new ResponseEntity<>(mauSacService.editMauSac(id, danhMuc), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> addObject(@PathVariable Integer id) {
        return new ResponseEntity<>(mauSacService.deleteMauSac(id), HttpStatus.OK);
    }
}
