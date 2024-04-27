package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.DiaChiKhachHang;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.entitys.MaGiamGia;
import com.bags.sixdoBag.model.entitys.NhanVien;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
    public KhachHang getidKhachHang(Integer idKhachHang);
////////////////////////////////////////////////////////
    public Page<KhachHang> searchKhachHangTenOrMa(String tenMa, Pageable pageable);
    public Page<KhachHang> searchcbb(Integer name, Pageable pageable);
    KhachHang getKhachHangByUserNameAndPassword(String email,String matKhau);

    public KhachHang addKhachHang1(KhachHang khachHang);
    public KhachHang getKhachHangByEmail(String email);
    public KhachHang getKhachHangBySDT(String sdt);

}
