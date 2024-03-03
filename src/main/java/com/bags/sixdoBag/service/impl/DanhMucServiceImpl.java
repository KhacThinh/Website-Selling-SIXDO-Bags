package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.DanhMuc;
import com.bags.sixdoBag.model.repository.DanhMucRepository;
import com.bags.sixdoBag.service.DanhMucService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DanhMucServiceImpl implements DanhMucService {

    private final DanhMucRepository danhMucRepository;

    @Override
    public DanhMuc getDanhMuc(Integer idDanhMuc) {
        DanhMuc danhMuc = danhMucRepository.findById(idDanhMuc).orElse(null);
        return danhMuc;
    }

    @Override
    public List<DanhMuc> getDanhMucs() {
        List<DanhMuc> danhMucs = danhMucRepository.findDanhMucByAll();
        return danhMucs;

    }

    @Override
    public DanhMuc addDanhMuc(DanhMuc danhMuc) {
        DanhMuc dm = new DanhMuc();
        dm.setMa(danhMuc.getMa().trim());
        dm.setTen(danhMuc.getTen().trim());
        dm.setTrangThai(true);
        return danhMucRepository.save(dm);
    }

    @Override
    public DanhMuc editDanhMuc(Integer idDanhMuc, DanhMuc danhMuc) {
        DanhMuc dm = getDanhMuc(idDanhMuc);
        dm.setTen(danhMuc.getTen().trim());
        danhMucRepository.save(dm);
        return dm;
    }

    @Override
    public DanhMuc deleteDanhMuc(Integer idDanhMuc) {
        DanhMuc dm = getDanhMuc(idDanhMuc);
        dm.setTrangThai(false);
        danhMucRepository.save(dm);
        return dm;
    }

    @Override
    public List<DanhMuc> pageDanhMuc(int limit, int size) {
        List<DanhMuc> danhMucs = danhMucRepository.findByPageing(limit, size);
        return danhMucs;
    }

    @Override
    public List<DanhMuc> searchDanhMuc(String tenDanhMuc) {
        List<DanhMuc> danhMucs = danhMucRepository.searchDanhMucOrMaDanhMuc(tenDanhMuc);
        return danhMucs;
    }
}

