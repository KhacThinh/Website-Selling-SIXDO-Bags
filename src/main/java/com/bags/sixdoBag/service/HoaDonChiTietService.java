package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.ChiTietHoaDon;
import com.bags.sixdoBag.model.entitys.ChiTietSanPham;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface HoaDonChiTietService {
    void addGioHang(ChiTietHoaDon chiTietHoaDon);

    public List<ChiTietHoaDon> getGioHangTaiQuay(int idHoaDon);

    public ChiTietHoaDon getHoaDonById(int idHoaDon, int idChiTietSp);

    public void updateChiTietHoaDon(int idHoaDon, int idChiTietSp, ChiTietHoaDon hoaDon);

    void deleteHoaDonChiTietById(int idHoaDon);

    List<ChiTietHoaDon> getGioHangChiTietFromHoaDon(int idHoaDon);

}
