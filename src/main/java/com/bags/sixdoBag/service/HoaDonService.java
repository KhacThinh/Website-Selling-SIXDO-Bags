package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.dto.response.DonHangOnlineResponse;
import com.bags.sixdoBag.model.entitys.ChiTietHoaDon;
import com.bags.sixdoBag.model.entitys.HoaDon;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface HoaDonService {
    void themHoaDon();

    List<HoaDon> getTabHoaDon();

    void updateHoaDon(int idHoaDon, HoaDon hoaDon);

    HoaDon getHoaDonById(int idHoaDon);

    void deleteHoaDonById(int id);

    Map<HoaDon, List<ChiTietHoaDon>> getSortHoaDon();

    Map<HoaDon, List<ChiTietHoaDon>> getSearchMaSdtSortHoaDon(String maSdt);

    Map<HoaDon, List<ChiTietHoaDon>> filterNgayBatDauKetThuc(String ngayBatDau, String ngayKetThuc);

    void saveHoaDon(HoaDon hoaDon);

    void xacNhanDonHang(int trangThai, String maHd);

    public HoaDon editHoaDon(Integer idHoaDon, HoaDon hoaDon);

    List<DonHangOnlineResponse> getSortHoaDonByKhachHangTrangThai(int idKh, int trangThai);

    Map<Integer, Integer> getSortHoaDonByKhachHang(int idKh);

}
