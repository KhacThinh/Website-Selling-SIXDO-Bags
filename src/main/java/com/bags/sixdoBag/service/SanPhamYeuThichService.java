package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.dto.response.ProductHomeResponse;
import com.bags.sixdoBag.model.dto.request.SanPhamYeuThichRequest;
import com.bags.sixdoBag.model.entitys.SanPhamYeuThich;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface SanPhamYeuThichService {
    public SanPhamYeuThich getSanPhamYeuThich(Integer idSanPhamYeuThich);

    public List<ProductHomeResponse> getListSanPhamYeuThich(int idKhachHang);

    List<ProductHomeResponse> searchSanPhamFavoriteOnlines(int idKh, String name);

    public SanPhamYeuThich addSanPhamYeuThich(SanPhamYeuThichRequest sanPhamYeuThichRequest);

    public SanPhamYeuThich deleteSanPhamYeuThich(Integer idSanPham, Integer idKhachHang);

}
