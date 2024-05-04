package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.dto.request.ChiTietGioHangRequestDto;
import com.bags.sixdoBag.model.entitys.ChiTietGioHang;
import com.bags.sixdoBag.model.entitys.ChiTietSanPham;
import com.bags.sixdoBag.model.repository.ChiTietGioHangRepository;
import com.bags.sixdoBag.service.ChiTietGioHangService;
import com.bags.sixdoBag.service.ChiTietSanPhamServivce;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
@RequiredArgsConstructor
public class ChiTietGioHangServiceImpl implements ChiTietGioHangService {

    private final ChiTietGioHangRepository chiTietGioHangRepository;

    private final ChiTietSanPhamServivce chiTietSanPhamServivce;

    @Override
    public ChiTietGioHang getChiTietGioHang(Integer idChiTietGioHang) {
        ChiTietGioHang chiTietGioHang = chiTietGioHangRepository.findById(idChiTietGioHang)
                .orElseThrow(() -> new IllegalArgumentException("id chi tiết giỏ hàng không tồn tại"));
        return chiTietGioHang;
    }

    @Override
    public List<ChiTietGioHang> getChiTietGioHangs(int idKhachHang) {
        return chiTietGioHangRepository.getListChiTietGioHangByKhachHang(idKhachHang);
    }

    @Override
    public ChiTietGioHang addChiTietGioHang(ChiTietGioHangRequestDto chiTietGioHangRequestDto) {
        ChiTietGioHang chiTietGioHang = new ChiTietGioHang();
        Integer idChiTietSanPham = chiTietGioHangRequestDto.getIdChiTietSanPham();
        if (Objects.isNull(idChiTietSanPham)) {
            throw new IllegalArgumentException("Giỏ hàng bắt buộc cần sản phẩm");
        }
        ChiTietSanPham chiTietSanPham = chiTietSanPhamServivce.getChiTietSanPham(idChiTietSanPham);
        if (chiTietSanPham.getSoLuong() < chiTietGioHangRequestDto.getSoLuong()) {
            throw new IllegalArgumentException("Số lượng sản phẩm trong giỏ hàng không được vượt quá số lượng kho");
        }
        chiTietGioHang.setIdGioHang(chiTietGioHangRequestDto.getIdGioHang());
        chiTietGioHang.setSoLuong(chiTietGioHangRequestDto.getSoLuong());
        chiTietGioHang.setIdChiTietSanPham(chiTietSanPham.getId());
        chiTietGioHang.setTongTien(Double.valueOf(chiTietSanPham.getGiaBan()) * chiTietGioHang.getSoLuong());
        return chiTietGioHangRepository.save(chiTietGioHang);

    }

    @Override
    public ChiTietGioHang editChiTietGioHang(Integer idChiTietGioHang,Integer idChiTietSanPham, ChiTietGioHangRequestDto chiTietGioHangRequestDto) {
        ChiTietGioHang chiTietGioHang =chiTietGioHangRepository.getChiTietGioHang(idChiTietGioHang,idChiTietSanPham);
        Integer idChiTietSanPhamm = chiTietGioHangRequestDto.getIdChiTietSanPham();
        if (Objects.isNull(idChiTietSanPham)) {
            throw new IllegalArgumentException("Giỏ hàng bắt buộc cần sản phẩm");
        }
        ChiTietSanPham chiTietSanPham = chiTietSanPhamServivce.getChiTietSanPham(idChiTietSanPhamm);
//        if (chiTietSanPham.getSoLuong() > chiTietGioHangRequestDto.getSoLuong()) {
//            throw new IllegalArgumentException("Số lượng sản phẩm trong giỏ hàng không được vượt quá số lượng kho");
//        }
        chiTietGioHang.setSoLuong(chiTietGioHangRequestDto.getSoLuong());
        chiTietGioHang.setChiTietSanPham(chiTietSanPham);
        chiTietGioHang.setTongTien(Double.valueOf(chiTietSanPham.getGiaBan()) * chiTietGioHang.getSoLuong());
        return chiTietGioHangRepository.save(chiTietGioHang);
    }

    @Override
    public ChiTietGioHang deleteChiTietGioHang(Integer idChiTietGioHang) {
        ChiTietGioHang chiTietGioHang = getChiTietGioHang(idChiTietGioHang);
        chiTietGioHangRepository.delete(chiTietGioHang);
        return chiTietGioHang;
    }

    @Override
    public List<ChiTietGioHang> soLuongGioHangByKhachHang(int idKH) {
        List<ChiTietGioHang>  list = chiTietGioHangRepository.soLuongGioHangByIdKhachHang(idKH);
        return list;
    }
}
