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
        ThuongHieu thuongHieu = thuongHieuRepository.findById(idThuongHieu).orElse(null);
        return thuongHieu;
    }

    @Override
    public List<ThuongHieu> getThuongHieus() {
        List<ThuongHieu> thuongHieus = thuongHieuRepository.findThuongHieuByAll();
        return thuongHieus;
    }

    @Override
    public ThuongHieu addThuongHieu(ThuongHieu thuongHieu) {
        ThuongHieu th = new ThuongHieu();
        th.setMa(thuongHieu.getMa());
        th.setTen(thuongHieu.getTen());
        return thuongHieuRepository.save(th);
    }

    @Override
    public ThuongHieu editThuongHieu(Integer idThuongHieu, ThuongHieu thuongHieu) {
        ThuongHieu th = getidThuongHieu(idThuongHieu);
        th.setTen(thuongHieu.getTen());
        return thuongHieuRepository.save(th);
    }

    @Override
    public ThuongHieu deleteThuongHieu(Integer idThuongHieu) {
        ThuongHieu th = getidThuongHieu(idThuongHieu);
        th.setTrangThai(false);
        return thuongHieuRepository.save(th);
    }

    @Override
    public List<ThuongHieu> pageThuongHieu(int limit, int size) {
        List<ThuongHieu> thuongHieus = thuongHieuRepository.findByPageing(limit, size);
        return thuongHieus;
    }

    @Override
    public List<ThuongHieu> searchThuongHieu(String tenThuongHieu) {
        List<ThuongHieu> thuongHieus = thuongHieuRepository.searchTenThuongHieuOrMa(tenThuongHieu);
        return thuongHieus;
    }
}
