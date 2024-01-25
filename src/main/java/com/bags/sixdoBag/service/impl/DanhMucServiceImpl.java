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
    public DanhMuc getDanhMuc(int idDanhMuc) {
        return null;
    }

    @Override
    public List<DanhMuc> getDanhMucs() { return null;
    }

    @Override
    public DanhMuc addDanhMuc(DanhMuc danhMuc) {
        return null;
    }

    @Override
    public DanhMuc editDanhMuc(Integer idDanhMuc, DanhMuc danhMuc) {
        return null;
    }

    @Override
    public DanhMuc deleteDanhMuc(Integer idDanhMuc) {
        return null;
    }

    @Override
    public List<DanhMuc> pageDanhMuc(int limit, int size) {
        return null;
    }

    @Override
    public List<DanhMuc> searchDanhMuc(String tenDanhMuc) {
        return null;
    }
}
