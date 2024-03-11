package com.bags.sixdoBag.service;

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
    void saveHoaDon (HoaDon hoaDon);
}
