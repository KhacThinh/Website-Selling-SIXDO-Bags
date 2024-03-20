package com.bags.sixdoBag.controller.Online;

import com.bags.sixdoBag.model.dto.request.ProductHomeRequest;
import com.bags.sixdoBag.model.entitys.DoiTuongSuDung;
import com.bags.sixdoBag.model.repository.ChiTietSanPhamRepository;
import com.bags.sixdoBag.service.*;
import com.bags.sixdoBag.service.impl.Utils;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
@RequestMapping("load-du-Lieu")
public class ProductHomeController {

    private final ChiTietSanPhamServivce chiTietSanPhamServivce;

    private final ChiTietSanPhamRepository chiTietSanPhamRepository;

    private final DoiTuongSuDungService doiTuongSuDungService;

    private final MauSacService mauSacService;

    private final SanPhamService sanPhamService;


    @GetMapping("/product-home")
    public ResponseEntity<List<ProductHomeRequest>> HienThiProductHomePage() {
        List<ProductHomeRequest> productHomeRequestList = sanPhamService.listHienThiSanPham();
        return ResponseEntity.ok(productHomeRequestList);
    }

    @GetMapping("/search")
    public ResponseEntity<List<ProductHomeRequest>> searchComponentProductHome(@RequestParam("name") String keyword) {
        List<ProductHomeRequest> searchResults = sanPhamService.searchSanPhamOnlines(keyword);
        return ResponseEntity.ok(searchResults);
    }

    @GetMapping("/hien-thi-loc-components-product-home")
    public ResponseEntity<List<String>> filterComponentProductHome() {
        List<String> doiTuongSuDungs = doiTuongSuDungService.getListDoiTuongSuDung().stream().map(DoiTuongSuDung::getTenDoiTuongSuDung).collect(Collectors.toList());
        return ResponseEntity.ok(doiTuongSuDungs);
    }

    @GetMapping("/hien-thi-loc-components-product-home/filter")
    public ResponseEntity<List<ProductHomeRequest>> filterComponentProductHomeFilter(@RequestParam("tenDoiTuongSuDung") String tenDoiTuongSuDung) {
        List<ProductHomeRequest> searchResults = doiTuongSuDungService.filterDoiTuongSuDungCTSPOnline(tenDoiTuongSuDung);
        return ResponseEntity.ok(searchResults);
    }
}
