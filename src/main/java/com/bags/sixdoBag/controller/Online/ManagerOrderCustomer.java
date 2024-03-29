package com.bags.sixdoBag.controller.Online;

import com.bags.sixdoBag.model.dto.response.DonHangOnlineResponse;
import com.bags.sixdoBag.model.entitys.HoaDon;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.service.HoaDonService;
import com.bags.sixdoBag.service.KhachHangService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
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


    @GetMapping("/list-trang-thai-don-hang")
    public @ResponseBody
    List<DonHangOnlineResponse> listTrangThaiDonHang(@RequestParam("trangThai") int trangThai) {
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        List<DonHangOnlineResponse> hoaDonListMap = hoaDonService.getSortHoaDonByKhachHangTrangThai(khachHang.getId(), trangThai);
        return hoaDonListMap;
    }

    @GetMapping("/find-id-hoa-don")
    public @ResponseBody
    DonHangOnlineResponse findByIdHoaDon(@RequestParam("idHoaDon") int id) {
        DonHangOnlineResponse hoaDonListMap = hoaDonService.getHoaDonByIdHoaDonKhachHangTrangThai(id);
        return hoaDonListMap;
    }

    @PostMapping("/huy-don-hang-by-id-hoa-don")
    public @ResponseBody
    boolean huyHoaDonByIdHoaDon(@RequestParam("idHoaDon") int id, @RequestParam("lyDoKhachHuy") String lyDoKhachHuy) {
        try {
            HoaDon hoaDon = hoaDonService.getHoaDonById(id);
            if (lyDoKhachHuy.equals("") || lyDoKhachHuy == null) {
                return false;
            } else {
                hoaDon.setTrangThai(4);
                System.out.println(hoaDon.getLyDoKhachHuy());
                hoaDon.setLyDoKhachHuy(lyDoKhachHuy);
                hoaDonService.editHoaDon(hoaDon.getId(), hoaDon);
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @PostMapping("/edit-don-hang-by-id-hoa-don")
    public @ResponseBody
    boolean editHoaDonByIdHoaDon(@RequestParam("idHoaDon") int id,
                                 @RequestParam("tenNguoiNhan") String tenNguoiNhan,
                                 @RequestParam("sdtNguoiNhan") String sdtNguoiNhan,
                                 @RequestParam("diaChiNguoiNhan") String diaChiNguoiNhan,
                                 @RequestParam("emailNguoiNhan") String emailNguoiNhan) {
        try {
            if (tenNguoiNhan.isEmpty() || sdtNguoiNhan.isEmpty() || diaChiNguoiNhan.isEmpty() || emailNguoiNhan.isEmpty()) {
                return false;
            }
            HoaDon hoaDon = hoaDonService.getHoaDonById(id);
            hoaDon.setTenNguoiNhan(tenNguoiNhan);
            hoaDon.setSdtNguoiNhan(sdtNguoiNhan);
            hoaDon.setDiaChiNguoiNhan(diaChiNguoiNhan);
            hoaDon.setEmailNguoiNhan(emailNguoiNhan);
            hoaDonService.editHoaDon(hoaDon.getId(), hoaDon);
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


}
