package com.bags.sixdoBag.controller.Online;

import com.bags.sixdoBag.model.dto.request.ProductHomeRequest;
import com.bags.sixdoBag.model.entitys.DanhMuc;
import com.bags.sixdoBag.model.entitys.DoiTuongSuDung;
import com.bags.sixdoBag.model.entitys.MauSac;
import com.bags.sixdoBag.model.entitys.ThuongHieu;
import com.bags.sixdoBag.model.repository.ChiTietSanPhamRepository;
import com.bags.sixdoBag.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.*;
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
    public ResponseEntity<List<ProductHomeRequest>> hienThiProductHomePage(@RequestParam("limit") int limit) {
        int page = 8;
        if (limit <= 1) {
            page *= 1;
        } else {
            page *= limit;
        }
        List<ProductHomeRequest> productHomeRequestList = mapProductRequest(sanPhamService.listHienThiSanPhamLimit(page));
        return ResponseEntity.ok(productHomeRequestList);
    }

    @GetMapping("/search")
    public ResponseEntity<List<ProductHomeRequest>> searchComponentProductHome(@RequestParam("name") String keyword) {
        List<ProductHomeRequest> searchResults = mapProductRequest(sanPhamService.searchSanPhamOnlines(keyword));
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
//        List<ProductHomeRequest> searchResults = danhMucService.filterDanhMucCTSPOnline(tenDoiTuongSuDung);
        List<ProductHomeRequest> searchResults = mapProductRequest(danhMucService.filterDanhMucCTSPOnline(tenDoiTuongSuDung));
        return ResponseEntity.ok(searchResults);
    }

    @PostMapping("/filter/loc-thuong-hieu-mau-sac-components-product-home")
    public ResponseEntity<List<ProductHomeRequest>> filterComponentProductHomeFilter(
            @RequestParam("tenThuongHieu") String tenThuongHieu,
            @RequestParam("maMauSac") String maMauSac,
            @RequestParam("sortBy") int sortBy
    ) {
        List<ProductHomeRequest> searchResults = mapProductRequest(sanPhamService.filterMaMauSacOrThuongHieuOnlineProductHome(maMauSac, tenThuongHieu));
        if (sortBy == 2) {
            searchResults.sort(Comparator.comparingInt(p -> -(chiTietSanPhamServivce.soLuongMuaBySanPham(p.getId()))));
        } else if (sortBy == 3) {
            searchResults.sort(Comparator.comparing(ProductHomeRequest::getGiaBan));
        } else if (sortBy == 4) {
            searchResults.sort(Comparator.comparing(ProductHomeRequest::getGiaBan).reversed());
        }
        System.out.println(searchResults.size());
        return ResponseEntity.ok(searchResults);
    }


    @GetMapping("/so-luong-mua")
    @ResponseBody
    public int soLuongMuaChiTietSanPham(@RequestParam("id") int idChiTietSanPham) {
        int soLuongMua = chiTietSanPhamServivce.soLuongMuaByChiTietSanPham(idChiTietSanPham);
        return soLuongMua;
    }


    @GetMapping("/so-luong-san-pham")
    @ResponseBody
    public int soLuongSanPham() {
        int soLuongSanPham = sanPhamService.listHienThiSanPham().size();
//        int page = 1;
//        if (soLuongSanPham % 8 != 0) {
//            page = (soLuongSanPham / 8) + 1;
//        } else {
//            page = soLuongSanPham / 8;
//        }
        return soLuongSanPham;
    }


    public List<ProductHomeRequest> mapProductRequest(List<ProductHomeRequest> searchResults) {
        List<ProductHomeRequest> updateProduct = searchResults.stream()
                .map((sp) -> {
                            ProductHomeRequest productHomeRequest = new ProductHomeRequest();
                            productHomeRequest.setId(sp.getId());
                            productHomeRequest.setHinhAnh(sp.getHinhAnh());
                            productHomeRequest.setTenSanPham(sp.getTenSanPham());
                            productHomeRequest.setGiaBan(sp.getGiaBan());
                            productHomeRequest.setSoLuongBan(chiTietSanPhamServivce.soLuongMuaBySanPham(sp.getId()));
                            return productHomeRequest;
                        }
                ).collect(Collectors.toList());
        return updateProduct;
    }
}
