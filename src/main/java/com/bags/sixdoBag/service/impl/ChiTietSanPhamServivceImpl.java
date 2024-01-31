package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.dto.request.ChiTietSanPhamRequest;
import com.bags.sixdoBag.model.entitys.ChiTietSanPham;
import com.bags.sixdoBag.model.repository.ChiTietSanPhamRepository;
import com.bags.sixdoBag.service.ChiTietSanPhamServivce;
import com.bags.sixdoBag.service.KhuyenMaiService;
import com.bags.sixdoBag.service.MauSacService;
import com.bags.sixdoBag.service.SanPhamService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ChiTietSanPhamServivceImpl implements ChiTietSanPhamServivce {

    private final ChiTietSanPhamRepository chiTietSanPhamRepository;

    private final SanPhamService sanPhamService;

    private final MauSacService mauSacService;

    private final KhuyenMaiService khuyenMaiService;

    @Override
    public ChiTietSanPham getChiTietSanPham(Integer idChiTietSanPham) {
        ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.findById(idChiTietSanPham)
                .orElseThrow(() -> new IllegalArgumentException("Chi tiết sản phẩm không có id " + idChiTietSanPham + " này!"));
        return chiTietSanPham;
    }

    @Override
    public List<ChiTietSanPham> getChiTietSanPhams() {
        List<ChiTietSanPham> chiTietSanPhams = chiTietSanPhamRepository.findAll();
        return chiTietSanPhams;
    }

    @Override
    public ChiTietSanPham addChiTietSanPham(ChiTietSanPhamRequest chiTietSanPhamRequest) {
        ChiTietSanPham ctsp = new ChiTietSanPham();
        ctsp.setMa(chiTietSanPhamRequest.getMa());
        ctsp.setGiaBan(chiTietSanPhamRequest.getGiaBan());
        ctsp.setGiaNhap(chiTietSanPhamRequest.getGiaNhap());
        ctsp.setSoLuong(chiTietSanPhamRequest.getSoLuong());
        ctsp.setThoiGian(chiTietSanPhamRequest.getThoiGian());
        ctsp.setHinhAnh(chiTietSanPhamRequest.getHinhAnh());
        Integer idMauSac = chiTietSanPhamRequest.getIdMauSac();
        Optional.ofNullable(mauSacService.getMauSac(idMauSac)).ifPresent(ctsp::setMauSac);
        Integer idSanPham = chiTietSanPhamRequest.getIdSanPham();
        Optional.ofNullable(sanPhamService.getSanPham(idSanPham)).ifPresent(ctsp::setSanPham);
        Integer idKhuyenMai = chiTietSanPhamRequest.getIdKhuyenMai();
        Optional.ofNullable(khuyenMaiService.getKhuyenMai(idKhuyenMai)).ifPresent(ctsp::setKhuyenMai);
        return chiTietSanPhamRepository.save(ctsp);
    }

    @Override
    public ChiTietSanPham editChiTietSanPham(Integer idChiTietSanPham, ChiTietSanPhamRequest chiTietSanPhamRequest) {
        ChiTietSanPham ctsp = getChiTietSanPham(idChiTietSanPham);
        ctsp.setMa(chiTietSanPhamRequest.getMa());
        ctsp.setGiaBan(chiTietSanPhamRequest.getGiaBan());
        ctsp.setGiaNhap(chiTietSanPhamRequest.getGiaNhap());
        ctsp.setSoLuong(chiTietSanPhamRequest.getSoLuong());
        ctsp.setThoiGian(chiTietSanPhamRequest.getThoiGian());
        ctsp.setHinhAnh(chiTietSanPhamRequest.getHinhAnh());
        Integer idMauSac = chiTietSanPhamRequest.getIdMauSac();
        Optional.ofNullable(mauSacService.getMauSac(idMauSac)).ifPresent(ctsp::setMauSac);
        Integer idSanPham = chiTietSanPhamRequest.getIdSanPham();
        Optional.ofNullable(sanPhamService.getSanPham(idSanPham)).ifPresent(ctsp::setSanPham);
        Integer idKhuyenMai = chiTietSanPhamRequest.getIdKhuyenMai();
        Optional.ofNullable(khuyenMaiService.getKhuyenMai(idKhuyenMai)).ifPresent(ctsp::setKhuyenMai);
        return chiTietSanPhamRepository.save(ctsp);
    }

    @Override
    public ChiTietSanPham deleteChiTietSanPham(Integer idChiTietSanPham) {
        ChiTietSanPham ctsp = getChiTietSanPham(idChiTietSanPham);
        chiTietSanPhamRepository.delete(ctsp);
        return ctsp;
    }
}
