package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.entitys.NhanVien;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface KhachHangService {
    public KhachHang getKhachHang(Integer idKhachHang);

    public List<KhachHang> getListKhachHang();

    public KhachHang addKhachHang(KhachHang khachHang);

    public KhachHang editKhachHang(Integer idKhachHang, KhachHang khachHang);

    public KhachHang deleteKhachHang(Integer idKhachHang);

    public KhachHang searchKh(String email);
}
