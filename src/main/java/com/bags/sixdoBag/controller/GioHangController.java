package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.GioHangRequest;
import com.bags.sixdoBag.service.GioHangService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("gio-hang")
@RequiredArgsConstructor
public class GioHangController {

    private final GioHangService gioHangService;

//    @GetMapping()
//    public ResponseEntity<?> getGioHangService() {
//        return new ResponseEntity<>(gioHangService);
//    }

    @PostMapping()
    public ResponseEntity<?> addGioHang(@RequestBody GioHangRequest gioHangRequest) {
        return new ResponseEntity<>(gioHangService.addGioHang(gioHangRequest), HttpStatus.OK);
    }
}
