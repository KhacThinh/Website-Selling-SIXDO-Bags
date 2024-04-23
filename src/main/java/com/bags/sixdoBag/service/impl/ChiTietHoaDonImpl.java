package com.bags.sixdoBag.service.impl;


import com.bags.sixdoBag.model.entitys.ChiTietHoaDon;
import com.bags.sixdoBag.model.entitys.ChiTietSanPham;
import com.bags.sixdoBag.model.repository.ChiTietHoaDonRepository;
import com.bags.sixdoBag.service.HoaDonChiTietService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

@Service
public class ChiTietHoaDonImpl implements HoaDonChiTietService {

    @Autowired
    ChiTietHoaDonRepository chiTietHoaDonRepository;

    @Override
    public void addGioHang(ChiTietHoaDon chiTietHoaDon) {
        chiTietHoaDonRepository.save(chiTietHoaDon);
    }

    @Override
    public List<ChiTietHoaDon> getGioHangTaiQuay(int idHoaDon) {
        return chiTietHoaDonRepository.getGioHangChiTiet(idHoaDon);
    }

    @Override
    public ChiTietHoaDon getHoaDonById(int idHoaDon, int idCtSanPham) {
        return chiTietHoaDonRepository.getGioHangChiTiet(idHoaDon, idCtSanPham);

    }

    @Override
    public void updateChiTietHoaDon(int idHoaDon, int idChiTietSp, ChiTietHoaDon hoaDon) {
        ChiTietHoaDon cthd = getHoaDonById(idHoaDon, idChiTietSp);
        cthd.setSoLuong(hoaDon.getSoLuong());
        cthd.setGia(hoaDon.getGia());
        chiTietHoaDonRepository.save(cthd);
    }


    @Transactional
    @Override
    public void deleteHoaDonChiTietById(int idHoaDon) {
        chiTietHoaDonRepository.deleteChiTietHoaDonByIdHoaDon(idHoaDon);
    }

    @Override
    public List<ChiTietHoaDon> getGioHangChiTietFromHoaDon(int idHoaDon) {
        List<ChiTietHoaDon> chiTietHoaDons = chiTietHoaDonRepository.getGioHangChiTietFromHoaDon(idHoaDon);
        return chiTietHoaDons;
    }

    @Override
    public void saveProductForCart(int idHoaDon, int idChiTietSp, int soLuong, double gia) {
        chiTietHoaDonRepository.insertHoaDonChiTiet(idHoaDon,idChiTietSp,soLuong,gia);
    }

    @Override
    public void updateTongTien(double tongTien, int id) {
        chiTietHoaDonRepository.updateTongTien(tongTien,id);
    }
}
