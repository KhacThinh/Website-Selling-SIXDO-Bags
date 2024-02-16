package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.dto.request.SanPhamYeuThichRequest;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.entitys.SanPham;
import com.bags.sixdoBag.model.entitys.SanPhamYeuThich;
import com.bags.sixdoBag.model.entitys.SanPhamYeuThichID;
import com.bags.sixdoBag.model.repository.SanPhamYeuThichRepository;
import com.bags.sixdoBag.service.KhachHangService;
import com.bags.sixdoBag.service.SanPhamService;
import com.bags.sixdoBag.service.SanPhamYeuThichService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@RequiredArgsConstructor
public class SanPhamYeuThichServiceImpl implements SanPhamYeuThichService {
    public final SanPhamYeuThichRepository sanPhamYeuThichRepository;

    public final SanPhamService sanPhamService;

    public  final KhachHangService khachHangService;
    @Override
    public SanPhamYeuThich getSanPhamYeuThich(Integer idSanPhamYeuThich) {
        return null;
    }

    @Override
    public List<SanPhamYeuThich> getListSanPhamYeuThich() {
        List<SanPhamYeuThich>listSPYT= sanPhamYeuThichRepository.findSanPhamYeuThichByAll();
        return listSPYT;
    }

    @Override
    public SanPhamYeuThich addSanPhamYeuThich(SanPhamYeuThichRequest sanPhamYeuThichRequest) {
        SanPhamYeuThich sanPhamYeuThich= new SanPhamYeuThich();
        Integer idSanPham = sanPhamYeuThichRequest.getIdSanPham();
        Integer idKhachHang = sanPhamYeuThichRequest.getIdKhachHang();
        SanPham sp = sanPhamService.getSanPham(idSanPham);
        KhachHang kh = khachHangService.getKhachHang(idKhachHang);
        sanPhamYeuThich.setSanPham(sp);
        sanPhamYeuThich.setKhachHang(kh);
        SanPhamYeuThichID sanPhamYeuThichID = new SanPhamYeuThichID();
        sanPhamYeuThichID.setIdSanPham(idSanPham);
        sanPhamYeuThichID.setIdKhachHang(idKhachHang);
        sanPhamYeuThich.setId(sanPhamYeuThichID);
        sanPhamYeuThich.setTrangThai(1);
        sanPhamYeuThichRepository.save(sanPhamYeuThich);

        return sanPhamYeuThich;
    }

//    @Override
//    public SanPhamYeuThich deleteSanPhamYeuThich(Integer idSanPham,Integer idKhachHang) {
//
//        sanPhamYeuThichRepository.deleteSanPhamYeuThich(idKhachHang,idSanPham);
//
//        return null;
//    }
}
