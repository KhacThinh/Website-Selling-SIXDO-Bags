package com.bags.sixdoBag.controller.Online;

import com.bags.sixdoBag.model.dto.request.ProductHomeRequest;
import com.bags.sixdoBag.model.entitys.DanhMuc;
import com.bags.sixdoBag.model.entitys.DoiTuongSuDung;
import com.bags.sixdoBag.model.entitys.MauSac;
import com.bags.sixdoBag.model.entitys.ThuongHieu;
import com.bags.sixdoBag.model.repository.ChiTietSanPhamRepository;
import com.bags.sixdoBag.service.*;
import com.bags.sixdoBag.service.impl.Utils;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
@RequestMapping("load-du-lieu")
public class ProductHomeController {

    private final ChiTietSanPhamServivce chiTietSanPhamServivce;

    private final ChiTietSanPhamRepository chiTietSanPhamRepository;

    private final DoiTuongSuDungService doiTuongSuDungService;

    private final DanhMucService danhMucService;

    private final ThuongHieuService thuongHieuService;

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

    @GetMapping("/hien-thi-loc-doi-tuong-su-dung-components-product-home")
    public ResponseEntity<Set<String>> filterComponentProductHome() {
        Set<String> doiTuongSuDungs = new HashSet<>(doiTuongSuDungService.getListDoiTuongSuDung().stream()
                .map(DoiTuongSuDung::getTenDoiTuongSuDung)
                .filter(doiTuong -> doiTuong != null && !doiTuong.isEmpty())
                .map(s -> s.trim())
                .collect(Collectors.toSet()));
        return ResponseEntity.ok(doiTuongSuDungs);
    }

    @GetMapping("/hien-thi-thuong-hieu-components-product-home")
    public ResponseEntity<Set<String>> filterThuongHieuComponentProductHome() {
        Set<String> thuongHieus = thuongHieuService.getThuongHieus().stream()
                .filter(th -> th != null && !th.getTen().isEmpty())
                .map(ThuongHieu::getTen)
                .map(s -> s.trim())
                .collect(Collectors.toSet());
        return ResponseEntity.ok(thuongHieus);
    }


    @GetMapping("/hien-thi-danh-muc-components-product-home")
    public ResponseEntity<Set<String>> filterDanhMucComponentProductHome() {
        Set<String> danhMucs = danhMucService.getDanhMucs().stream()
                .filter(th -> th != null && !th.getTenDanhMuc().isEmpty())
                .map(DanhMuc::getTenDanhMuc)
                .map(s -> s.trim())
                .collect(Collectors.toSet());
        return ResponseEntity.ok(danhMucs);
    }

    @GetMapping("/hien-thi-mau-sac-components-product-home")
    public ResponseEntity<List<MauSac>> filterMauSacComponentProductHome() {
        List<MauSac> mauSacs = mauSacService.getMauSacs();
        return ResponseEntity.ok(mauSacs);
    }

    @GetMapping("/hien-thi-loc-components-product-home/filter")
    public ResponseEntity<List<ProductHomeRequest>> filterComponentProductHomeFilter(@RequestParam("tenDanhMuc") String tenDoiTuongSuDung) {
        List<ProductHomeRequest> searchResults = danhMucService.filterDanhMucCTSPOnline(tenDoiTuongSuDung);
        return ResponseEntity.ok(searchResults);
    }

    @PostMapping("/filter/loc-thuong-hieu-mau-sac-components-product-home")
    public ResponseEntity<List<ProductHomeRequest>> filterComponentProductHomeFilter(
            @RequestParam("tenThuongHieu") String tenThuongHieu,
            @RequestParam("maMauSac") String maMauSac
    ) {
        List<ProductHomeRequest> searchResults = sanPhamService.filterMaMauSacOrThuongHieuOnlineProductHome(maMauSac, tenThuongHieu);
        System.out.println(searchResults.size());
        return ResponseEntity.ok(searchResults);
    }
}
