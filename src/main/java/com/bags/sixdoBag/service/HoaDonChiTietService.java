package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.ChiTietHoaDon;
import com.bags.sixdoBag.model.entitys.ChiTietSanPham;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface HoaDonChiTietService {
    void addGioHang(ChiTietHoaDon chiTietHoaDon);

    public List<ChiTietHoaDon> getGioHangTaiQuay(int idHoaDon);

}
