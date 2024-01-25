package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.SanPham;
import com.bags.sixdoBag.model.entitys.SanPham;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface SanPhamService {

    public SanPham getSanPham(int idSanPham);

    public List<SanPham> getSanPhams();

    public SanPham addSanPham(SanPham sanPham);

    public SanPham editSanPham(Integer idSanPham, SanPham sanPham);

    public SanPham deleteSanPham(Integer idSanPham);

    public List<SanPham> searchSanPhamTenOrMa(String tenMa);

    public List<SanPham> pageSanPham(int limit, int size);
}
