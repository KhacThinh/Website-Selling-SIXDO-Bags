package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.dto.request.SanPhamRequest;
import com.bags.sixdoBag.model.dto.request.SanPhamYeuThichRequest;
import com.bags.sixdoBag.model.entitys.SanPham;
import com.bags.sixdoBag.model.entitys.SanPhamYeuThich;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface SanPhamYeuThichService {
    public SanPhamYeuThich getSanPhamYeuThich(Integer idSanPhamYeuThich);

    public List<SanPhamYeuThich> getListSanPhamYeuThich();

    public SanPhamYeuThich addSanPhamYeuThich(SanPhamYeuThichRequest sanPhamYeuThichRequest);

//    public SanPhamYeuThich deleteSanPhamYeuThich(Integer idSanPham,Integer idKhachHang);
}
