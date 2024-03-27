package com.bags.sixdoBag.controller.Online;

import com.bags.sixdoBag.model.dto.response.DonHangOnlineResponse;
import com.bags.sixdoBag.model.entitys.ChiTietHoaDon;
import com.bags.sixdoBag.model.entitys.HoaDon;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.service.HoaDonService;
import com.bags.sixdoBag.service.KhachHangService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;
import java.util.Objects;

@RestController
@RequiredArgsConstructor
@RequestMapping("/sixdo-shop/manager-order-customer-online")
public class ManagerOrderCustomer {

    private final HoaDonService hoaDonService;

    private final HttpSession session;

    private final KhachHangService khachHangService;

    @GetMapping("/don-chua-xac-nhan")
    public @ResponseBody
    int choXacNhanDonHang() {
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        int soLuong = 0;
        if (Objects.nonNull(khachHang)) {
            soLuong = hoaDonService.getSortHoaDonByKhachHang(khachHang.getId()).get(2).intValue();
        }

        return soLuong;
    }

    @GetMapping("/don-hang-dang-xu-ly")
    public @ResponseBody
    int donHangDangXuLy() {
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        int soLuong = 0;
        if (Objects.nonNull(khachHang)) {
            soLuong = hoaDonService.getSortHoaDonByKhachHang(khachHang.getId()).get(3).intValue();
        }
        return soLuong;
    }

    @GetMapping("/don-hang-dang-duoc-giao")
    public @ResponseBody
    int donHangDangDuocGiao() {
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        int soLuong = 0;
        if (Objects.nonNull(khachHang)) {
            soLuong = hoaDonService.getSortHoaDonByKhachHang(khachHang.getId()).get(5).intValue();
        }
        return soLuong;
    }

    @GetMapping("/don-hang-hoan-thanh")
    public @ResponseBody
    int donHangHoanThanh() {
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        int soLuong = 0;
        if (Objects.nonNull(khachHang)) {
            soLuong = hoaDonService.getSortHoaDonByKhachHang(khachHang.getId()).get(0).intValue();
        }
        return soLuong;
    }

    @GetMapping("/don-hang-da-huy")
    public @ResponseBody
    int donHangDaHuy() {
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        int soLuong = 0;
        if (Objects.nonNull(khachHang)) {
            soLuong = hoaDonService.getSortHoaDonByKhachHang(khachHang.getId()).get(4).intValue();
        }
        return soLuong;
    }


    @GetMapping("/list-don-chua-xac-nhan")
    public @ResponseBody
    List<DonHangOnlineResponse> listChoXacNhanDonHang() {
        System.out.println("Hellosss");
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        List<DonHangOnlineResponse> hoaDonListMap = hoaDonService.getSortHoaDonByKhachHangTrangThai(khachHang.getId(), 2);
        return hoaDonListMap;
    }

    @GetMapping("/list-don-hang-dang-xu-ly")
    public @ResponseBody
    List<DonHangOnlineResponse> listDonHangDangXuLy() {
        System.out.println("Hellosss");
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        List<DonHangOnlineResponse> hoaDonListMap = hoaDonService.getSortHoaDonByKhachHangTrangThai(khachHang.getId(), 3);
        return hoaDonListMap;
    }

//    @GetMapping("/list-don-chua-xac-nhan")
//    public @ResponseBody
//    Map<HoaDon, List<ChiTietHoaDon>> listChoXacNhanDonHang() {
//        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
//        Map<HoaDon, List<ChiTietHoaDon>> hoaDonListMap = hoaDonService.getSortHoaDonByKhachHangTrangThai(khachHang.getId(), 2);
//        return hoaDonListMap;
//    }
//
//    @GetMapping("/list-don-chua-xac-nhan")
//    public @ResponseBody
//    Map<HoaDon, List<ChiTietHoaDon>> listChoXacNhanDonHang() {
//        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
//        Map<HoaDon, List<ChiTietHoaDon>> hoaDonListMap = hoaDonService.getSortHoaDonByKhachHangTrangThai(khachHang.getId(), 2);
//        return hoaDonListMap;
//    }
//
//    @GetMapping("/list-don-chua-xac-nhan")
//    public @ResponseBody
//    Map<HoaDon, List<ChiTietHoaDon>> listChoXacNhanDonHang() {
//        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
//        Map<HoaDon, List<ChiTietHoaDon>> hoaDonListMap = hoaDonService.getSortHoaDonByKhachHangTrangThai(khachHang.getId(), 2);
//        return hoaDonListMap;
//    }


}
