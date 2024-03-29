package com.bags.sixdoBag.controller.Online;

import com.bags.sixdoBag.config.UserLoginKhachHang;
import com.bags.sixdoBag.model.dto.request.ProductHomeRequest;
import com.bags.sixdoBag.model.dto.request.SanPhamYeuThichRequest;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.repository.ChiTietSanPhamRepository;
import com.bags.sixdoBag.service.*;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.UUID;
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

    private final HttpSession session;

    @GetMapping("load-data")
    public @ResponseBody
    List<ProductHomeRequest> getListResponseEntity() {
        List<ProductHomeRequest> productHomeControllers = new ArrayList<>();
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        if (Objects.nonNull(khachHang)) {
            productHomeControllers = sanPhamYeuThichService.getListSanPhamYeuThich(khachHang.getId());
        }
        return productHomeControllers;
    }

    @GetMapping("hien-thi-so-luong-product-favorite")
    public @ResponseBody
    int getProuductSoLuongHead() {
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        if (Objects.nonNull(khachHang)) {
            int soLuong = sanPhamYeuThichService.getListSanPhamYeuThich(khachHang.getId()).size();
            return soLuong;
        }

        return 0;
    }


    @GetMapping("check-thong-tin-khach-hang")
    public @ResponseBody
    Integer getCheckLoginKhachHang() {
        if (Objects.nonNull((KhachHang) session.getAttribute("buyer"))) {
            KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
            return khachHang.getId();
        }
        return 0;
    }

    @PostMapping("them-san-pham-yeu-thich")
    public @ResponseBody
    Integer addThemSanPhamYeuThich(@RequestParam("idSanPham") Integer idSP) {
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        SanPhamYeuThichRequest sanPhamYeuThichRequest = new SanPhamYeuThichRequest();
        sanPhamYeuThichRequest.setIdSanPham(idSP);
        sanPhamYeuThichRequest.setIdKhachHang(khachHang.getId());
        if (Objects.nonNull(sanPhamYeuThichService.addSanPhamYeuThich(sanPhamYeuThichRequest))) {
            return 1;
        }
        return 0;
    }

    @GetMapping("xoa-san-pham-yeu-thich")
    public @ResponseBody
    Integer deleteThemSanPhamYeuThich(@RequestParam("idSanPham") Integer idSP) {
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        if (Objects.nonNull(sanPhamYeuThichService.deleteSanPhamYeuThich(idSP, khachHang.getId()))) {
            return 1;
        }
        return 0;
    }

    @GetMapping("check-san-pham-yeu-thich-home")
    public @ResponseBody
    List<Integer> checkSanPhamYeuThichHome() {
        List<Integer> idSanPhamYeuThich = new ArrayList<>();
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        if (Objects.nonNull(khachHang)) {
            idSanPhamYeuThich = sanPhamYeuThichService
                    .getListSanPhamYeuThich(khachHang.getId())
                    .stream()
                    .map(ProductHomeRequest::getId)
                    .collect(Collectors.toList());

        }
        return idSanPhamYeuThich;
    }

    @GetMapping("infomation-profile-header")
    public @ResponseBody
    KhachHang infomationProfileHeader() {
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        if (Objects.nonNull(khachHang)) {
            return khachHang;
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
            @RequestParam("diaChi") String diaChi,
            @RequestParam(value = "hinhAnh", required = false) MultipartFile hinhAnh
    ) {
        System.out.println("Hình Ảnh");
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        if (Objects.nonNull(khachHang)) {
            if (Objects.nonNull(hinhAnh) && !hinhAnh.isEmpty()) {
                try {
                    byte[] bytes = hinhAnh.getBytes();
                    String UPLOAD_DIR = "src/main/resources/static/images/khach-hang/";
                    // Lưu ảnh vào thư mục trong dự án của bạn hoặc thực hiện xử lý tùy chỉnh khác
                    BufferedOutputStream stream =
                            new BufferedOutputStream(new FileOutputStream(new File(UPLOAD_DIR + hinhAnh.getOriginalFilename())));
                    stream.write(bytes);
                    System.out.println(hinhAnh.getOriginalFilename());
//                    khachHang.setHinhAnh("../static/images/khach-hang/" + hinhAnh.getOriginalFilename());
                    khachHang.setHinhAnh("../static/images/khach-hang/" + hinhAnh.getOriginalFilename() + "?" + UUID.randomUUID().toString());

                    stream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            khachHang.setTenKhachHang(ten);
            khachHang.setGioiTinh(gioiTinh);
            khachHang.setSdt(sdt);
            khachHang.setNgaySinh(ngaySinh);
            khachHang.setDiaChi(diaChi);
            khachHangService.editKhachHang(khachHang.getId(), khachHang);
            System.out.println(khachHang.toString());
            return 1;
        }
        return 0;
    }

}
