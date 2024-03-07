package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.dto.request.ChiTietSanPhamRequest;
import com.bags.sixdoBag.model.entitys.ChiTietSanPham;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ChiTietSanPhamServivce {

    public ChiTietSanPham getChiTietSanPham(Integer idChiTietSanPham);

    public List<ChiTietSanPham> getChiTietSanPhams();

    public ChiTietSanPham addChiTietSanPham(ChiTietSanPham chiTietSanPham);

    public ChiTietSanPham editChiTietSanPham(Integer idChiTietSanPham, ChiTietSanPhamRequest chiTietSanPhamRequest);

    public ChiTietSanPham deleteChiTietSanPham(Integer idChiTietSanPham);

    public List<ChiTietSanPham> searchChiTietSanPhams(String tenMa);

    public List<ChiTietSanPham> filterTaiQuay(String chatLieu, String thuongHieu, String mauSac, String doiTuongSuDung);

}
