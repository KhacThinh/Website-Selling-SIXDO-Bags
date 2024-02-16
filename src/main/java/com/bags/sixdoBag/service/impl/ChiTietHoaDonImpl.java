package com.bags.sixdoBag.service.impl;


import com.bags.sixdoBag.model.entitys.ChiTietHoaDon;
import com.bags.sixdoBag.model.repository.ChiTietHoaDonRepository;
import com.bags.sixdoBag.service.HoaDonChiTietService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChiTietHoaDonImpl implements HoaDonChiTietService {

    @Autowired
    ChiTietHoaDonRepository chiTietHoaDonRepository;
    @Override
    public void addGioHang(ChiTietHoaDon chiTietHoaDon) {
        chiTietHoaDonRepository.save(chiTietHoaDon);
    }

    @Override
    public List<ChiTietHoaDon> getGioHangTaiQuay(int idHoaDon) {
        return chiTietHoaDonRepository.getGioHangChiTiet(idHoaDon);
    }
}
