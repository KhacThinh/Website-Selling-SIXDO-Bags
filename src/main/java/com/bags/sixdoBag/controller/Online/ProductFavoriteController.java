package com.bags.sixdoBag.controller.Online;

import com.bags.sixdoBag.config.UserLoginKhachHang;
import com.bags.sixdoBag.model.dto.request.ProductHomeRequest;
import com.bags.sixdoBag.model.dto.request.SanPhamYeuThichRequest;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.repository.ChiTietSanPhamRepository;
import com.bags.sixdoBag.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@RestController
@RequiredArgsConstructor
@RequestMapping("product-favorite")
public class ProductFavoriteController {

    private final ChiTietSanPhamServivce chiTietSanPhamServivce;

    private final ChiTietSanPhamRepository chiTietSanPhamRepository;

    private final DoiTuongSuDungService doiTuongSuDungService;

    private final DanhMucService danhMucService;

    private final ThuongHieuService thuongHieuService;

    private final MauSacService mauSacService;

    private final SanPhamService sanPhamService;

    private final SanPhamYeuThichService sanPhamYeuThichService;

    private final KhachHangService khachHangService;

    @GetMapping("load-data")
    public @ResponseBody
    List<ProductHomeRequest> getListResponseEntity() {
        List<ProductHomeRequest> productHomeControllers = new ArrayList<>();
        if (Objects.nonNull(UserLoginKhachHang.idKhachHangFavorite)) {
            KhachHang khachHang = khachHangService.getidKhachHang(UserLoginKhachHang.idKhachHangFavorite);
            if (Objects.nonNull(khachHang)) {
                productHomeControllers = sanPhamYeuThichService.getListSanPhamYeuThich(khachHang.getId());
            }
        }
        return productHomeControllers;
    }

    @GetMapping("hien-thi-so-luong-product-favorite")
    public @ResponseBody
    int getProuductSoLuongHead() {
        if (Objects.nonNull(UserLoginKhachHang.idKhachHangFavorite)) {
            KhachHang khachHang = khachHangService.getidKhachHang(UserLoginKhachHang.idKhachHangFavorite);
            int soLuong = sanPhamYeuThichService.getListSanPhamYeuThich(khachHang.getId()).size();
            return soLuong;
        } else {
            return 0;
        }
    }


    @GetMapping("check-thong-tin-khach-hang")
    public @ResponseBody
    Integer getCheckLoginKhachHang() {
        if (Objects.nonNull(UserLoginKhachHang.idKhachHangFavorite)) {
            System.out.println("đã vô đây");
            KhachHang khachHang = khachHangService.getidKhachHang(UserLoginKhachHang.idKhachHangFavorite);
            return khachHang.getId();
        }
        return 0;
    }

    @PostMapping("them-san-pham-yeu-thich")
    public @ResponseBody
    Integer addThemSanPhamYeuThich(@RequestParam("idSanPham") Integer idSP) {
        int idKH = UserLoginKhachHang.idKhachHangFavorite;
        SanPhamYeuThichRequest sanPhamYeuThichRequest = new SanPhamYeuThichRequest();
        sanPhamYeuThichRequest.setIdSanPham(idSP);
        sanPhamYeuThichRequest.setIdKhachHang(idKH);
        if (Objects.nonNull(sanPhamYeuThichService.addSanPhamYeuThich(sanPhamYeuThichRequest))) {
            return 1;
        }
        return 0;
    }

    @GetMapping("xoa-san-pham-yeu-thich")
    public @ResponseBody
    Integer deleteThemSanPhamYeuThich(@RequestParam("idSanPham") Integer idSP) {
        int idKH = UserLoginKhachHang.idKhachHangFavorite;
        if (Objects.nonNull(sanPhamYeuThichService.deleteSanPhamYeuThich(idSP, idKH))) {
            return 1;
        }
        return 0;
    }

    @GetMapping("check-san-pham-yeu-thich-home")
    public @ResponseBody
    List<Integer> checkSanPhamYeuThichHome() {
        List<Integer> idSanPhamYeuThich = new ArrayList<>();
        if (Objects.nonNull(UserLoginKhachHang.idKhachHangFavorite)) {
            KhachHang khachHang = khachHangService.getidKhachHang(UserLoginKhachHang.idKhachHangFavorite);
            if (Objects.nonNull(khachHang)) {
                idSanPhamYeuThich = sanPhamYeuThichService
                        .getListSanPhamYeuThich(khachHang.getId())
                        .stream()
                        .map(ProductHomeRequest::getId)
                        .collect(Collectors.toList());
            }
        }
        return idSanPhamYeuThich;
    }

}
