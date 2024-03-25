
package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.SanPhamYeuThichRequest;
import com.bags.sixdoBag.service.SanPhamYeuThichService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/san-pham-yeu-thich")
public class SanPhamYeuThichController {
    public final SanPhamYeuThichService sanPhamYeuThichService;

    @GetMapping("")
    public ResponseEntity<?> getAll() {
        return new ResponseEntity<>(sanPhamYeuThichService.getListSanPhamYeuThich(1), HttpStatus.OK);
    }


    @PostMapping("")
    public ResponseEntity<?> addSanPhamYT(@RequestBody @Valid SanPhamYeuThichRequest khuyenMai) {
        return new ResponseEntity<>(sanPhamYeuThichService.addSanPhamYeuThich(khuyenMai), HttpStatus.OK);
    }


    @DeleteMapping("")
    public ResponseEntity<?> deleteSanPhamYT(@RequestParam("idKh") Integer idKh, @RequestParam("idSp") Integer idSp) {
        System.out.println(idKh + "abcccccc" + idSp);
        return new ResponseEntity<>(sanPhamYeuThichService.deleteSanPhamYeuThich(idSp, idKh), HttpStatus.OK);
    }
}

