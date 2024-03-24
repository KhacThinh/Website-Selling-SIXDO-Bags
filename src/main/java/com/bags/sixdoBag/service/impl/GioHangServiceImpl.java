package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.dto.request.ChiTietGioHangRequestDto;
import com.bags.sixdoBag.model.dto.request.GioHangRequest;
import com.bags.sixdoBag.model.entitys.ChiTietGioHang;
import com.bags.sixdoBag.model.entitys.GioHang;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.repository.GioHangRepository;
import com.bags.sixdoBag.service.ChiTietGioHangService;
import com.bags.sixdoBag.service.GioHangService;
import com.bags.sixdoBag.service.KhachHangService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class GioHangServiceImpl implements GioHangService {

    private final GioHangRepository gioHangRepository;

    private final KhachHangService khachHangService;

    private final ChiTietGioHangService chiTietGioHangService;

    private static KhachHang khachHangTaiQuay;

    @Override
    public GioHang getGioHang(Integer idGioHang) {
        GioHang gioHang = gioHangRepository.findById(idGioHang)
                .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy giỏ hàng có id " + idGioHang));
        return gioHang;
    }

    @Override
    public List<GioHang> getGioHangs() {
        List<GioHang> gioHangs = gioHangRepository.findAll();
        return gioHangs;
    }

    @Override
    public GioHang addGioHang(GioHangRequest gioHangRequest) {
        KhachHang khachHang = Optional.ofNullable(khachHangService
                .getKhachHang(gioHangRequest.getIdKhachHang())).orElseGet(() -> {
            KhachHang kh = new KhachHang();
            kh.setTenKhachHang("Khách lẻ");
            return kh;
        });

        KhachHang finalKhachHang = khachHang;
        GioHang gioHang = gioHangRepository.findGioHangByKhachHang(khachHang).orElseGet(() -> {
            GioHang newGioHang = new GioHang();
            newGioHang.setNgayTao(LocalDateTime.now());
            newGioHang.setKhachHang(finalKhachHang);
            newGioHang.setTongTien(0d);
            newGioHang.setTrangThai(1);
            return newGioHang;
        });

//        ChiTietGioHangRequestDto chiTietGioHangRequestDto = gioHangRequest.getChiTietGioHangRequestDto();
////        ChiTietGioHang chiTietGioHang = gioHang.getChiTietGioHangs().stream()
////                .filter(ctgh -> ctgh.getIdChiTietSanPham() == chiTietGioHangRequestDto.getIdChiTietSanPham())
////                .findFirst()
////                .orElse(null);
//
//        GioHang gh = gioHangRepository.save(gioHang);
//        chiTietGioHangRequestDto.setIdGioHang(gh.getId());
//
//        ChiTietGioHang chiTietGioHang = chiTietGioHangService.addChiTietGioHang(chiTietGioHangRequestDto);
//
//        if (Objects.nonNull(chiTietGioHang)) {
//            int soLuongMoi = chiTietGioHangRequestDto.getSoLuong();
//            int soLuongHienTai = chiTietGioHang.getSoLuong();
//            chiTietGioHang.setSoLuong(soLuongHienTai + soLuongMoi);
//        } else {
//            gioHang.addGioHangChiTiet(chiTietGioHang);
//        }

        return gioHangRepository.save(gioHang);
    }

    @Override
    public GioHang addGioHangTaiQuay(GioHangRequest gioHangRequest, int moi) {

        if (moi == 1) {
            khachHangTaiQuay = new KhachHang();
        }
        khachHangTaiQuay.setTenKhachHang("Khách lẻ");

        KhachHang finalKhachHang = khachHangTaiQuay;
        GioHang gioHang = gioHangRepository.findGioHangByKhachHang(khachHangTaiQuay).orElseGet(() -> {
            GioHang newGioHang = new GioHang();
            newGioHang.setNgayTao(LocalDateTime.now());
            newGioHang.setKhachHang(finalKhachHang);
            newGioHang.setTongTien(0d);
            newGioHang.setTrangThai(1);
            return newGioHang;
        });

        ChiTietGioHangRequestDto chiTietGioHangRequestDto = gioHangRequest.getChiTietGioHangRequestDto();
        ChiTietGioHang chiTietGioHang = gioHang.getChiTietGioHangs().stream()
                .filter(ctgh -> ctgh.getIdChiTietSanPham() == chiTietGioHangRequestDto.getIdChiTietSanPham())
                .findFirst()
                .orElse(null);

        if (Objects.nonNull(chiTietGioHang)) {
            int soLuongMoi = chiTietGioHangRequestDto.getSoLuong();
            int soLuongHienTai = chiTietGioHang.getSoLuong();
            chiTietGioHang.setSoLuong(soLuongHienTai + soLuongMoi);
        } else {
            gioHang.addGioHangChiTiet(chiTietGioHang);
        }

        return gioHangRepository.save(gioHang);

    }

    @Override
    public GioHang editGioHang(Integer idGioHang, GioHangRequest gioHangRequest) {
        return null;
    }

    @Override
    public GioHang deleteGioHang(Integer idGioHang) {
        return null;
    }

    @Override
    public int getIdGioHang(int idKhachHang) {
        return gioHangRepository.getIdGioHang(idKhachHang);
    }
}
