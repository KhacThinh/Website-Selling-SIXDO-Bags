package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.model.entitys.MauSac;
import com.bags.sixdoBag.model.repository.ChucVuRepository;
import com.bags.sixdoBag.service.ChucVuService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ChucVuServiceImpl implements ChucVuService {
    public final ChucVuRepository chucVuRepository;

    @Override
    public ChucVu getChucVu(Integer idChucVu) {
        ChucVu chucVu = chucVuRepository.findById(idChucVu).orElse(null);
        return chucVu;
    }

    @Override
    public List<ChucVu> getListChucVu() {
        List<ChucVu> listChucVu = chucVuRepository.getListChucVu();
        return listChucVu;
    }

    @Override
    public ChucVu addChucVu(ChucVu chucVu) {
        ChucVu cv = new ChucVu();
        cv.setMaChucVu(chucVu.getMaChucVu().trim());
        cv.setTenChucVu(chucVu.getTenChucVu().trim());
        cv.setTrangThai(chucVu.getTrangThai());
        chucVuRepository.save(cv);
        return cv;
    }

    @Override
    public ChucVu editChucVu(Integer idChucVu, ChucVu chucVu) {
        ChucVu cv = getChucVu(idChucVu);
        cv.setTenChucVu(chucVu.getTenChucVu().trim());
        chucVuRepository.save(cv);
        return cv;
    }

    @Override
    public ChucVu deleteChucVu(Integer idchucVu) {
        ChucVu cv = getChucVu(idchucVu);
        cv.setTrangThai(false);



        return  chucVuRepository.save(cv);
    }

    @Override
    public List<ChucVu> pageChucVu(int limit, int size) {
        List<ChucVu> chucVu = chucVuRepository.findByPageing(limit, size);
        return chucVu;
    }

    @Override
    public List<ChucVu> searchChucVu(String tenChucVu) {
        List<ChucVu> chucVu = chucVuRepository.searchChucVuTenOrMa(tenChucVu);
        return chucVu;
    }

    @Override
    public ChucVu getidChucVu(Integer idChucVu) {
        ChucVu chucVu = chucVuRepository.findById(idChucVu).orElse(null);
        return chucVu;
    }
}
