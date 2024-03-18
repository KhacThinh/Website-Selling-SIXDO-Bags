package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.dto.request.DiaChiKhachHangRequest;
import com.bags.sixdoBag.model.entitys.DiaChiKhachHang;
import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.entitys.MaGiamGia;
import com.bags.sixdoBag.model.entitys.MauSac;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface DiaChiKhachHangService {
    public DiaChiKhachHang getDiaChiKhachHang(Integer idMaDiaChi);

    public List<DiaChiKhachHang> getListDiaChiKhachHang();

    public DiaChiKhachHang addDiaChiKhachHang(DiaChiKhachHang diaChiKhachHang);

    public DiaChiKhachHang editDiaChiKhachHang(Integer idDiaChi, DiaChiKhachHang diaChiKhachHang);

    public DiaChiKhachHang deleteDiaChiKhachHang(Integer idDiaChi);

    public List<DiaChiKhachHang> pageDiaChiKhachHang(int limit, int size);

    public DiaChiKhachHang getidDCKH(Integer idDCKH);


    //13_3
    public Page<DiaChiKhachHang> searchDCKHTenOrMa(String tenMa, Pageable pageable);
    public Page<DiaChiKhachHang> searchcbb(boolean name, Pageable pageable);
    public Page<DiaChiKhachHang> searchcbb1(String name1, Pageable pageable);
    Page<DiaChiKhachHang> searchDCKHByKhachHangId(Long khachHangId, Pageable pageable);

}
