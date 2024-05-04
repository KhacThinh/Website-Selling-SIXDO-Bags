package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.dto.request.ChiTietSanPhamRequest;
import com.bags.sixdoBag.model.entitys.ChiTietSanPham;
import com.bags.sixdoBag.model.entitys.SanPham;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ChiTietSanPhamServivce {

    public ChiTietSanPham getChiTietSanPham(Integer idChiTietSanPham);

    List<ChiTietSanPham> getChiTietSanPhamById(int idSanPham);

    public List<ChiTietSanPham> getChiTietSanPhams();

    public ChiTietSanPham addChiTietSanPham(ChiTietSanPham chiTietSanPham);

    public ChiTietSanPham editChiTietSanPham(Integer idChiTietSanPham, ChiTietSanPham chiTietSanPhamRequest);

    public ChiTietSanPham deleteChiTietSanPham(Integer idChiTietSanPham);

    public List<ChiTietSanPham> searchChiTietSanPhams(String tenMa);

    public ChiTietSanPham searchByMaSanPham(String ma);

    public List<ChiTietSanPham> filterTaiQuay(String chatLieu, String thuongHieu, String mauSac, String doiTuongSuDung);

    public List<ChiTietSanPham> filterTaiQuay(String chatLieu, String mauSac, String doiTuongSuDung);

    void updateSoLuongSanPham(int newSoLuong, int idCtSanPham);

    int getSoLuongSanPhamById(int idCtSanPham);

    public int soLuongMuaByChiTietSanPham(int idCtsp);

    public int soLuongMuaBySanPham(int idSp);


}
