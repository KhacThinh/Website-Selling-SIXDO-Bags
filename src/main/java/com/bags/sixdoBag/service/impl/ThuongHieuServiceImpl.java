package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.ThuongHieu;
import com.bags.sixdoBag.model.repository.ThuongHieuRepository;
import com.bags.sixdoBag.service.ThuongHieuService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ThuongHieuServiceImpl implements ThuongHieuService {

    private final ThuongHieuRepository thuongHieuRepository;


    @Override
    public ThuongHieu getidThuongHieu(int idThuongHieu) {
        return null;
    }

    @Override
    public List<ThuongHieu> getThuongHieus() {
        return null;
    }

    @Override
    public ThuongHieu addThuongHieu(ThuongHieu thuongHieu) {
        return null;
    }

    @Override
    public ThuongHieu editThuongHieu(Integer idThuongHieu, ThuongHieu thuongHieu) {
        return null;
    }

    @Override
    public ThuongHieu deleteThuongHieu(Integer idThuongHieu) {
        return null;
    }

    @Override
    public List<ThuongHieu> pageThuongHieu(int limit, int size) {
        return null;
    }

    @Override
    public List<ThuongHieu> searchThuongHieu(String tenThuongHieu) {
        return null;
    }
}
