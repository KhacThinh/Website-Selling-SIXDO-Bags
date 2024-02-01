package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.dto.request.DiaChiKhachHangRequest;
import com.bags.sixdoBag.model.entitys.DiaChiKhachHang;
import com.bags.sixdoBag.model.entitys.MaGiamGia;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface DiaChiKhachHangService {
    public DiaChiKhachHang getDiaChiKhachHang(Integer idMaDiaChi);

    public List<DiaChiKhachHang> getListDiaChiKhachHang();

    public DiaChiKhachHang addDiaChiKhachHang(DiaChiKhachHangRequest diaChiKhachHang);

    public DiaChiKhachHang editDiaChiKhachHang(Integer idDiaChi, DiaChiKhachHangRequest diaChiKhachHang);

    public DiaChiKhachHang deleteDiaChiKhachHang(Integer idDiaChi);

    public List<DiaChiKhachHang> pageDiaChiKhachHang(int limit, int size);
}
