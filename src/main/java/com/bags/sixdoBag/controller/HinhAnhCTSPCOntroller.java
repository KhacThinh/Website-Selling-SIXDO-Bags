package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.AnhSlideShowRequest;
import com.bags.sixdoBag.model.dto.request.HinhAnhCTSPRequest;
import com.bags.sixdoBag.service.HinhAnhCTSPService;
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
@RequestMapping("/hinh_anh_ctsp")
public class HinhAnhCTSPCOntroller {
    public final HinhAnhCTSPService hinhAnhCTSPService;

    @GetMapping("")
    public ResponseEntity<?> getAll() {
        return ResponseEntity.ok(hinhAnhCTSPService.getListHinhAnhCTSP());
    }

    @PostMapping("")
    public ResponseEntity<?> add(@RequestBody @Valid HinhAnhCTSPRequest hinhAnhCTSPRequest) {
        return ResponseEntity.ok(hinhAnhCTSPService.addHinhAnhCTSP(hinhAnhCTSPRequest));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> edit(@RequestBody @Valid HinhAnhCTSPRequest hinhAnhCTSPRequest, @PathVariable Integer id) {
        return ResponseEntity.ok(hinhAnhCTSPService.editHinhAnhCTSP(id,hinhAnhCTSPRequest));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable Integer id) {
        return ResponseEntity.ok(hinhAnhCTSPService.deleteHinhANhCTSP(id));
    }
}
