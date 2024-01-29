package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.DiaChiKhachHang;
import com.bags.sixdoBag.model.repository.DiaChiKhachHangRepository;
import com.bags.sixdoBag.service.DiaChiKhachHangService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@RequiredArgsConstructor

public class DiaChiKhachHangServiceImpl implements DiaChiKhachHangService {
    public final DiaChiKhachHangRepository diaChiKhachHangRepository;
    @Override
    public DiaChiKhachHang getDiaChiKhachHang(Integer idMaDiaChi) {
        return null;
    }

    @Override
    public List<DiaChiKhachHang> getListDiaChiKhachHang() {
        return null;
    }

    @Override
    public DiaChiKhachHang addDiaChiKhachHang(DiaChiKhachHang diaChiKhachHang) {
        return null;
    }

    @Override
    public DiaChiKhachHang editDiaChiKhachHang(Integer idDiaChi, DiaChiKhachHang diaChiKhachHang) {
        return null;
    }

    @Override
    public DiaChiKhachHang deleteDiaChiKhachHang(Integer idDiaChi) {
        return null;
    }

    @Override
    public List<DiaChiKhachHang> pageDiaChiKhachHang(int limit, int size) {
        return null;
    }
}
