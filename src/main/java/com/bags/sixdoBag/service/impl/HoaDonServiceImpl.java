package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.HoaDon;
import com.bags.sixdoBag.model.repository.HoaDonRepository;
import com.bags.sixdoBag.service.HoaDonService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
public class HoaDonServiceImpl implements HoaDonService {
    @Autowired
    HoaDonRepository hoaDonRepository;

    @Override
    public void themHoaDon() {
        HoaDon hoaDon = new HoaDon();
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
}
