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

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;


@Service
@RequiredArgsConstructor
public class HoaDonServiceImpl implements HoaDonService {
    @Autowired
    HoaDonRepository hoaDonRepository;
    Utils utils = new Utils();

    private final HoaDonChiTietService hoaDonChiTietService;

    @Override
    public void themHoaDon() {
        HoaDon hoaDon = new HoaDon();
        hoaDon.setThoiGianTao(LocalDateTime.now());
        hoaDon.setTrangThai(1); // Thiết lập trạng thái hóa đơn
        hoaDon.setThoiGianTao(utils.getCurrentDateTime());

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
        hoaDonTemp.setThoiGianXacNhan(hoaDon.getThoiGianXacNhan());
        hoaDonTemp.setThoiGianThanhToan(hoaDon.getThoiGianThanhToan());
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

    @Override
    public Map<HoaDon, List<ChiTietHoaDon>> getSearchMaSdtSortHoaDon(String maSdt) {
        Map<HoaDon, List<ChiTietHoaDon>> hoaDonListMap = new LinkedHashMap<>();
        List<HoaDon> hoaDons = hoaDonRepository.getHoaDomByMaHoaDonOrSdt(maSdt);

        // Sắp xếp danh sách hoaDons theo thời gian tạo giảm dần
        hoaDons.sort(Comparator.comparing(HoaDon::getThoiGianTao, Comparator.nullsLast(Comparator.reverseOrder())));

        for (HoaDon hoaDon : hoaDons) {
            List<ChiTietHoaDon> chiTietHoaDons = hoaDonChiTietService.getGioHangChiTietFromHoaDon(hoaDon.getId());
            hoaDonListMap.put(hoaDon, chiTietHoaDons);
        }

        return hoaDonListMap;
    }

    @Override
    public Map<HoaDon, List<ChiTietHoaDon>> filterNgayBatDauKetThuc(String ngayBatDau, String ngayKetThuc) {
        Map<HoaDon, List<ChiTietHoaDon>> hoaDonListMap = new LinkedHashMap<>();
        LocalDateTime batDau = ngayBatDau.isEmpty() ? LocalDateTime.MIN : LocalDateTime.parse(ngayBatDau + "T00:00:00");
        LocalDateTime ketThuc = ngayKetThuc.isEmpty() ? LocalDateTime.MAX : LocalDateTime.parse(ngayKetThuc + "T23:59:59");
        List<HoaDon> hoaDons = hoaDonRepository.findAll()
                .stream()
                .filter(hd -> {
                    boolean start = hd.getThoiGianTao() != null && (batDau.isBefore(hd.getThoiGianTao()) || batDau.isEqual(hd.getThoiGianTao()));
                    boolean end = hd.getThoiGianTao() != null && (ketThuc.isAfter(hd.getThoiGianTao()) || ketThuc.isEqual(hd.getThoiGianTao()));
                    return start && end;
                }).collect(Collectors.toList());


        hoaDons.sort(Comparator.comparing(HoaDon::getThoiGianTao, Comparator.nullsLast(Comparator.reverseOrder())));

        for (HoaDon hoaDon : hoaDons) {
            List<ChiTietHoaDon> chiTietHoaDons = hoaDonChiTietService.getGioHangChiTietFromHoaDon(hoaDon.getId());
            hoaDonListMap.put(hoaDon, chiTietHoaDons);
        }

        return hoaDonListMap;
    }

    @Override
    public void saveHoaDon(HoaDon hoaDon) {
        hoaDonRepository.save(hoaDon);
    }

    @Override
    public void xacNhanDonHang(int trangThai, String maHd) {
        hoaDonRepository.setTrangThaiDonHang(trangThai, maHd);

    }

    @Override
    public HoaDon editHoaDon(Integer idHoaDon, HoaDon hoaDon) {
        HoaDon ms = getHoaDonById(idHoaDon);
        ms.setTenNguoiNhan(hoaDon.getTenNguoiNhan());
        ms.setEmailNguoiNhan(hoaDon.getEmailNguoiNhan());
        ms.setSdtNguoiNhan(hoaDon.getSdtNguoiNhan());
        ms.setDiaChiNguoiNhan(hoaDon.getDiaChiNguoiNhan());
        ms.setPhiVanChuyen(hoaDon.getPhiVanChuyen());
        ms.setKhachThanhToan(hoaDon.getKhachThanhToan());
        ms.setSoTienNo(hoaDon.getSoTienNo());

        return hoaDonRepository.save(ms);
    }
}
