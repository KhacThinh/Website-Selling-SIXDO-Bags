package com.bags.sixdoBag.controller.Online;

import com.bags.sixdoBag.config.UserLoginKhachHang;
import com.bags.sixdoBag.model.dto.request.ProductHomeRequest;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.repository.ChiTietSanPhamRepository;
import com.bags.sixdoBag.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

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
    Integer getCheckLoginKhachHang(){
        if (Objects.nonNull(UserLoginKhachHang.idKhachHangFavorite)) {
            System.out.println("đã vô đây");
            KhachHang khachHang = khachHangService.getidKhachHang(UserLoginKhachHang.idKhachHangFavorite);
            return khachHang.getId();
        } else {
            System.out.println("chưa vô đây");
            return 0;
        }
    }
}
