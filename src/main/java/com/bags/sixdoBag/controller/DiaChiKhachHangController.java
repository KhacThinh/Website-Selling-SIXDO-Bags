package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.DiaChiKhachHangRequest;
import com.bags.sixdoBag.model.entitys.DiaChiKhachHang;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.service.DiaChiKhachHangService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
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
@RequestMapping("/dia_chi_khach_hang")
public class DiaChiKhachHangController {
    public final DiaChiKhachHangService diaChiKhachHangService;

    @GetMapping("")
    public ResponseEntity<?> getAll() {
        return new ResponseEntity<>(diaChiKhachHangService.getListDiaChiKhachHang(), HttpStatus.OK);
    }


    @PostMapping("")
    public ResponseEntity<?> addDiaChiKhachHang(@RequestBody @Valid DiaChiKhachHangRequest diaChiKhachHang) {
        return new ResponseEntity<>(diaChiKhachHangService.addDiaChiKhachHang(diaChiKhachHang), HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> editDiaChiKH(@PathVariable int id, @RequestBody @Valid DiaChiKhachHangRequest khachHang) {
        return new ResponseEntity<>(diaChiKhachHangService.editDiaChiKhachHang(id,khachHang), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteDiaChiKH(@PathVariable int id) {
        return new ResponseEntity<>(diaChiKhachHangService.deleteDiaChiKhachHang(id), HttpStatus.OK);
    }

}
