package com.bags.sixdoBag.controller.Online;

import com.bags.sixdoBag.model.dto.response.ProductHomeResponse;
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
    public ResponseEntity<List<ProductHomeResponse>> hienThiProductHomePage(@RequestParam("limit") int limit) {
        int page = 8;
        if (limit <= 1) {
            page *= 1;
        } else {
            page *= limit;
        }
        List<ProductHomeResponse> productHomeRequestList = mapProductRequest(sanPhamService.listHienThiSanPhamLimit(page));
        return ResponseEntity.ok(productHomeRequestList);
    }

    @GetMapping("/search")
    public ResponseEntity<List<ProductHomeResponse>> searchComponentProductHome(@RequestParam("name") String keyword) {
        List<ProductHomeResponse> searchResults = mapProductRequest(sanPhamService.searchSanPhamOnlines(keyword));
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
    public ResponseEntity<List<ProductHomeResponse>> filterComponentProductHomeFilter(@RequestParam("tenDanhMuc") String tenDoiTuongSuDung) {
//        List<ProductHomeRequest> searchResults = danhMucService.filterDanhMucCTSPOnline(tenDoiTuongSuDung);
        List<ProductHomeResponse> searchResults = mapProductRequest(danhMucService.filterDanhMucCTSPOnline(tenDoiTuongSuDung));
        return ResponseEntity.ok(searchResults);
    }

    @PostMapping("/filter/loc-thuong-hieu-mau-sac-components-product-home")
    public ResponseEntity<List<ProductHomeResponse>> filterComponentProductHomeFilter(
            @RequestParam("tenThuongHieu") String tenThuongHieu,
            @RequestParam("maMauSac") String maMauSac,
            @RequestParam("sortBy") int sortBy
    ) {
        List<ProductHomeResponse> searchResults = mapProductRequest(sanPhamService.filterMaMauSacOrThuongHieuOnlineProductHome(maMauSac, tenThuongHieu));
        if (sortBy == 2) {
            searchResults.sort(Comparator.comparingInt(p -> -(chiTietSanPhamServivce.soLuongMuaBySanPham(p.getId()))));
        } else if (sortBy == 3) {
            searchResults.sort(Comparator.comparing(ProductHomeResponse::getGiaBan));
        } else if (sortBy == 4) {
            searchResults.sort(Comparator.comparing(ProductHomeResponse::getGiaBan).reversed());
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


    public List<ProductHomeResponse> mapProductRequest(List<ProductHomeResponse> searchResults) {
        List<ProductHomeResponse> updateProduct = searchResults.stream()
                .map((sp) -> {
                            ProductHomeResponse productHomeRequest = new ProductHomeResponse();
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
