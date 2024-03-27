package com.bags.sixdoBag.controller.Online;

import com.bags.sixdoBag.config.UserLoginKhachHang;
import com.bags.sixdoBag.model.dto.request.ProductHomeRequest;
import com.bags.sixdoBag.model.dto.request.SanPhamYeuThichRequest;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.repository.ChiTietSanPhamRepository;
import com.bags.sixdoBag.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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
            KhachHang khachHang = khachHangService.getKhachHang(UserLoginKhachHang.idKhachHangFavorite);
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

    @GetMapping("infomation-profile-header")
    public @ResponseBody
    KhachHang infomationProfileHeader() {
        System.out.println("Đã Vô Đây");
        if (Objects.nonNull(UserLoginKhachHang.idKhachHangFavorite)) {
            KhachHang khachHang = khachHangService.getKhachHang(UserLoginKhachHang.idKhachHangFavorite);
            if (Objects.nonNull(khachHang)) {
                return khachHang;
            }
        }
        return null;
    }

    @PostMapping("input-infomation-profile-header")
    public @ResponseBody
    int inputInfomationProfileHeader(
            @RequestParam("ten") String ten,
            @RequestParam("gioiTinh") Integer gioiTinh,
            @RequestParam("sdt") String sdt,
            @RequestParam("ngaySinh") String ngaySinh,
            @RequestParam("diaChi") String diaChi
            // Thêm các @RequestParam khác tương tự nếu cần
//            @RequestParam(value = "hinhAnh", required = false) MultipartFile hinhAnh // Handle optional file upload
    ) {
//        System.out.println("Hình Ảnh");

//        try {
//            // Implement your business logic to save customer profile information
//            // Validate and sanitize user input (ten, gioiTinh, sdt, ngaySinh, email, diaChi)
//
//            // Handle file upload (if applicable)
//            if (hinhAnh != null && !hinhAnh.isEmpty()) {
//                // Save the uploaded file (consider using a file storage service or local storage)
//                String fileName = hinhAnh.getOriginalFilename();
//                System.out.println(fileName);
//                // ... (file saving logic)
//            }
//
//            // Save customer information to database (replace with your actual database interaction)
//            // Customer customer = new Customer(ten, gioiTinh, sdt, ngaySinh, email, diaChi);
//            // customerService.saveCustomer(customer); // Assuming a customerService and saveCustomer method
//
//            return 1;// Success response (consider using a more informative message)
//        } catch (Exception e) {
//            e.printStackTrace();
//            return 0;
//        }

        if (Objects.nonNull(UserLoginKhachHang.idKhachHangFavorite)) {
            KhachHang khachHang = khachHangService.getKhachHang(UserLoginKhachHang.idKhachHangFavorite);
            if (Objects.nonNull(khachHang)) {
                khachHang.setTenKhachHang(ten);
                khachHang.setGioiTinh(gioiTinh);
                khachHang.setSdt(sdt);
                khachHang.setNgaySinh(ngaySinh);
                khachHang.setDiaChi(diaChi);
//                khachHang.setHinhAnh();
                khachHangService.editKhachHang(UserLoginKhachHang.idKhachHangFavorite, khachHang);
                System.out.println(khachHang.toString());
                return 1;
            }
        }

        return 0;
    }

}
