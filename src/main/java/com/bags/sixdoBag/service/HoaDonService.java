package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.HoaDon;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface HoaDonService {
    void themHoaDon();
    List<HoaDon> getTabHoaDon ();
}
