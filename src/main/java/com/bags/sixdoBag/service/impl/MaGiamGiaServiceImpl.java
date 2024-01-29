package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.MaGiamGia;
import com.bags.sixdoBag.model.entitys.MauSac;
import com.bags.sixdoBag.model.repository.MaGiamGiaRepository;
import com.bags.sixdoBag.service.MaGIamGiaService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MaGiamGiaServiceImpl implements MaGIamGiaService {
    public final MaGiamGiaRepository maGiamGiaRepository;

    @Override
    public MaGiamGia getMaGiamGia(int idMaGiamGia) {
        MaGiamGia maGiamGia = maGiamGiaRepository.findById(idMaGiamGia).orElse(null);

        return maGiamGia;
    }

    @Override
    public List<MaGiamGia> getListMaGiamGia() {
        List<MaGiamGia> listMaGiamGia = maGiamGiaRepository.findMaGiamGiaByAll();
        return listMaGiamGia;
    }

    @Override
    public MaGiamGia addMaGiamGia(MaGiamGia maGiamGia) {
        MaGiamGia ma = new MaGiamGia();
        ma.setMaGiamGia(maGiamGia.getMaGiamGia().trim());
        ma.setTenMaGiamGia(maGiamGia.getTenMaGiamGia().trim());
        ma.setGiaTriGiam(maGiamGia.getGiaTriGiam());
        ma.setNgayBatDau(maGiamGia.getNgayBatDau());
        ma.setNgayKetThuc(maGiamGia.getNgayKetThuc());
        ma.setMoTa(maGiamGia.getMoTa().trim());
        ma.setSoLuong(maGiamGia.getSoLuong());
        ma.setDieuKienGiam(maGiamGia.getDieuKienGiam());
        ma.setTrangThai(true);
        maGiamGiaRepository.save(ma);
        return ma;
    }

    @Override
    public MaGiamGia editMaGiamGia(Integer idMaGiamGia, MaGiamGia maGiamGia) {
        MaGiamGia ma = getMaGiamGia(idMaGiamGia);
        ma.setTenMaGiamGia(maGiamGia.getTenMaGiamGia().trim());
        ma.setGiaTriGiam(maGiamGia.getGiaTriGiam());
        ma.setNgayBatDau(maGiamGia.getNgayBatDau());
        ma.setNgayKetThuc(maGiamGia.getNgayKetThuc());
        ma.setMoTa(maGiamGia.getMoTa().trim());
        maGiamGiaRepository.save(ma);
        return ma;
    }

    @Override
    public MaGiamGia deleteMaGiamGia(Integer idMaGiamGia) {
        MaGiamGia maGiamGia = getMaGiamGia(idMaGiamGia);
        maGiamGiaRepository.delete(maGiamGia);
        return maGiamGia;
    }

    @Override
    public List<MaGiamGia> pageMaGiamGia(int limit, int size) {
        List<MaGiamGia> list = maGiamGiaRepository.findByPageing(limit, size);

        return list;
    }
}
