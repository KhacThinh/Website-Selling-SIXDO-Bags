package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.dto.request.DiaChiKhachHangRequest;
import com.bags.sixdoBag.model.entitys.DiaChiKhachHang;
import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.entitys.MaGiamGia;
import com.bags.sixdoBag.model.repository.DiaChiKhachHangRepository;
import com.bags.sixdoBag.service.DiaChiKhachHangService;
import com.bags.sixdoBag.service.KhachHangService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@RequiredArgsConstructor

public class DiaChiKhachHangServiceImpl implements DiaChiKhachHangService {
    public final DiaChiKhachHangRepository diaChiKhachHangRepository;
    public final KhachHangService khachHangService;
    @Override
    public DiaChiKhachHang getDiaChiKhachHang(Integer idMaDiaChi) {
        DiaChiKhachHang dc = diaChiKhachHangRepository.findById(idMaDiaChi).orElse(null);
        return dc;
    }

    @Override
    public List<DiaChiKhachHang> getListDiaChiKhachHang() {
        List<DiaChiKhachHang>listDC= diaChiKhachHangRepository.findDiaChiKhachHangByAll();
        return listDC;
    }

    @Override
    public DiaChiKhachHang addDiaChiKhachHang(DiaChiKhachHang diaChiKhachHang) {
        DiaChiKhachHang dc = new DiaChiKhachHang();
        dc.setTenDiaChi(diaChiKhachHang.getTenDiaChi());
        dc.setMoTa(diaChiKhachHang.getMoTa());
        dc.setTrangThai(true);
        Integer idKhachHang = diaChiKhachHang.getKhachHang().getId();
        if(idKhachHang== null){
            dc.setKhachHang(null);
        }else{
            dc.setKhachHang(khachHangService.getKhachHang(idKhachHang));
        }
        return diaChiKhachHangRepository.save(dc);
//        return dc;
    }

    @Override
    public DiaChiKhachHang editDiaChiKhachHang(Integer idDiaChi, DiaChiKhachHang diaChiKhachHang) {
        DiaChiKhachHang dc= getDiaChiKhachHang(idDiaChi);
        dc.setTenDiaChi(diaChiKhachHang.getTenDiaChi());
        dc.setMoTa(diaChiKhachHang.getMoTa());
//        Integer idKhachHang = diaChiKhachHang.getKhachHang().getId();
//        if(idKhachHang== null){
//            dc.setKhachHang(null);
//        }else{
//            dc.setKhachHang(khachHangService.getKhachHang(idKhachHang));
//        }
        diaChiKhachHangRepository.save(dc);
        return dc;
    }

    @Override
    public DiaChiKhachHang deleteDiaChiKhachHang(Integer idDiaChi) {
        DiaChiKhachHang dc=getDiaChiKhachHang(idDiaChi);
        dc.setTrangThai(false);
        diaChiKhachHangRepository.save(dc);
        return dc;
    }

    @Override
    public List<DiaChiKhachHang> pageDiaChiKhachHang(int limit, int size) {
        return null;
    }

    @Override
    public DiaChiKhachHang getidDCKH(Integer idDCKH) {
        DiaChiKhachHang diaChiKhachHang = diaChiKhachHangRepository.findById(idDCKH).orElse(null);
        return diaChiKhachHang;
    }

    ///////////////////////////////////////////////////////////////////////////
    @Override
    public Page<DiaChiKhachHang> searchDCKHTenOrMa(String tenMa, Pageable pageable) {
        return diaChiKhachHangRepository.searchDCKHTenOrMa(tenMa, pageable);
    }
    @Override
    public Page<DiaChiKhachHang> searchcbb(boolean name, Pageable pageable) {
        return diaChiKhachHangRepository.searchCbb(name,pageable);
    }
    @Override
    public Page<DiaChiKhachHang> searchcbb1(String name, Pageable pageable) {
        return diaChiKhachHangRepository.searchCbb1(name,pageable);
    }

    @Override
    public Page<DiaChiKhachHang> searchDCKHByKhachHangId(Long khachHangId, Pageable pageable) {
        return diaChiKhachHangRepository.findByKhachHangId(khachHangId, pageable);
    }
    /////////////////////////////////////////////////////////////////////////
}
