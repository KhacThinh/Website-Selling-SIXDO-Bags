package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.dto.request.ChiTietGioHangRequestDto;
import com.bags.sixdoBag.model.entitys.ChiTietGioHang;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ChiTietGioHangService {
    public ChiTietGioHang getChiTietGioHang(Integer idChiTietGioHang);

    public List<ChiTietGioHang> getChiTietGioHangs(int idKhachHang);

    public ChiTietGioHang addChiTietGioHang(ChiTietGioHangRequestDto chiTietGioHangRequestDto);

    public ChiTietGioHang editChiTietGioHang(Integer idChiTietGioHang,Integer idChiTietSanPham, ChiTietGioHangRequestDto chiTietGioHangRequestDto);

    public ChiTietGioHang deleteChiTietGioHang(Integer idChiTietGioHang);

    public List<ChiTietGioHang>  soLuongGioHangByKhachHang(int idKH);
}
