package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.repository.KhuyenMaiRepository;
import com.bags.sixdoBag.service.KhuyenMaiService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Pageable;

import java.util.List;

@Service
@RequiredArgsConstructor
public class KhuyenMaiServiceImpl implements KhuyenMaiService {
    private final KhuyenMaiRepository khuyenMaiRepository;

    @Override
    public KhuyenMai getKhuyenMai(Integer idKhuyenMai) {
        KhuyenMai khuyenMai = khuyenMaiRepository.findById(idKhuyenMai).orElse(null);
        return khuyenMai;
    }

    @Override
    public List<KhuyenMai> getKhuyenMais() {
        List<KhuyenMai> khuyenMais = khuyenMaiRepository.findKhuyenMaiByAll();
        return khuyenMais;
    }

    @Override
    public KhuyenMai addKhuyenMai(KhuyenMai khuyenMai) {
        KhuyenMai km = new KhuyenMai();
        return getKhuyenMai(khuyenMai, km);
    }

    private KhuyenMai getKhuyenMai(KhuyenMai khuyenMai, KhuyenMai km) {
        km.setMaKhuyenMai(khuyenMai.getMaKhuyenMai().trim());
        km.setTen(khuyenMai.getTen().trim());
        km.setGiaTriGiam(khuyenMai.getGiaTriGiam());
        km.setNgayBatDau(khuyenMai.getNgayBatDau());
        km.setNgayKetThuc(khuyenMai.getNgayKetThuc());
        km.setMoTa(khuyenMai.getMoTa());
        km.setTrangThai(khuyenMai.getTrangThai());
        return khuyenMaiRepository.save(km);
    }

    @Override
    public KhuyenMai editKhuyenMai(Integer idKhuyenMai, KhuyenMai khuyenMai) {
        KhuyenMai km = getKhuyenMai(idKhuyenMai);
        return getKhuyenMai(khuyenMai, km);
    }

    @Override
    public KhuyenMai deleteKhuyenMai(Integer idKhuyenMai) {
        KhuyenMai km = getKhuyenMai(idKhuyenMai);
        km.setTrangThai(false);
        return km;
    }


    @Override
    public List<KhuyenMai> pageKhuyenMai(int limit, int size) {
        List<KhuyenMai> khuyenMais = khuyenMaiRepository.findByPageing(limit, size);
        return khuyenMais;
    }

    @Override
    public List<KhuyenMai> searchKhuyenMaiNgay(String dateStart, String dateEnd) {
        List<KhuyenMai> khuyenMais = khuyenMaiRepository.searchKhuyenMaiNgay(dateStart, dateEnd);
        return khuyenMais;
    }

    @Override
    public KhuyenMai getidKhuyenMai(Integer idKhuyenMai) {
        KhuyenMai khuyenMai = khuyenMaiRepository.findById(idKhuyenMai).orElse(null);
        return khuyenMai;
    }

    /////////////////////////////////////////////////////////////
    @Override
    public Page<KhuyenMai> searchKhuyenMaiTenOrMa(String tenMa, Pageable pageable) {
        return khuyenMaiRepository.searchKhuyenMaiTenOrMa(tenMa, pageable);
    }
    @Override
    public Page<KhuyenMai> searchcbb(boolean name, Pageable pageable) {
        return khuyenMaiRepository.searchCbb(name,pageable);
    }
    ////////////////////////////////////////////////////////////////
}
