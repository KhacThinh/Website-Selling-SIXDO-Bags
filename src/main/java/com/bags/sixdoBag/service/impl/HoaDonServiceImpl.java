package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.ChiTietHoaDon;
import com.bags.sixdoBag.model.entitys.HoaDon;
import com.bags.sixdoBag.model.repository.HoaDonRepository;
import com.bags.sixdoBag.service.ChiTietSanPhamServivce;
import com.bags.sixdoBag.service.HoaDonChiTietService;
import com.bags.sixdoBag.service.HoaDonService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.*;


@Service
@RequiredArgsConstructor
public class HoaDonServiceImpl implements HoaDonService {
    @Autowired
    HoaDonRepository hoaDonRepository;

    private final HoaDonChiTietService hoaDonChiTietService;

    @Override
    public void themHoaDon() {
        HoaDon hoaDon = new HoaDon();
        hoaDon.setThoiGianTao(LocalDateTime.now());
        hoaDon.setTrangThai(1); // Thiết lập trạng thái hóa đơn

// Lưu hóa đơn vào cơ sở dữ liệu để nhận ID
        hoaDon = hoaDonRepository.save(hoaDon);

// Tạo mã hóa đơn dựa trên ID
        String maHoaDon = "HD0" + hoaDon.getId();
        hoaDon.setMaHoaDon(maHoaDon);

// Cập nhật hóa đơn với mã hóa đơn mới
        hoaDonRepository.save(hoaDon);

    }

    @Override
    public List<HoaDon> getTabHoaDon() {
        return hoaDonRepository.findAll();
    }

    @Override
    public void updateHoaDon(int idHoaDon, HoaDon hoaDon) {
        HoaDon hoaDonTemp = getHoaDonById(idHoaDon);
        hoaDonTemp.setTenNguoiNhan(hoaDon.getTenNguoiNhan());
        hoaDonTemp.setTrangThai(hoaDon.getTrangThai());
        hoaDonTemp.setSdtNguoiNhan(hoaDon.getSdtNguoiNhan());
        hoaDonTemp.setTongTien(hoaDon.getTongTien());

        hoaDonRepository.save(hoaDonTemp);
    }

    @Override
    public HoaDon getHoaDonById(int idHoaDon) {
        return hoaDonRepository.findById(idHoaDon).orElse(null);
    }


    @Override
    public void deleteHoaDonById(int id) {
        hoaDonRepository.deleteById(id);
    }

    @Override
    public Map<HoaDon, List<ChiTietHoaDon>> getSortHoaDon() {
        Map<HoaDon, List<ChiTietHoaDon>> hoaDonListMap = new LinkedHashMap<>();
        List<HoaDon> hoaDons = hoaDonRepository.findAll();

        // Sắp xếp danh sách hoaDons theo thời gian tạo giảm dần
        hoaDons.sort(Comparator.comparing(HoaDon::getThoiGianTao, Comparator.nullsLast(Comparator.reverseOrder())));

        for (HoaDon hoaDon : hoaDons) {
            List<ChiTietHoaDon> chiTietHoaDons = hoaDonChiTietService.getGioHangChiTietFromHoaDon(hoaDon.getId());
            hoaDonListMap.put(hoaDon, chiTietHoaDons);
        }

        return hoaDonListMap;
    }
}
