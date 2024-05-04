package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.entitys.ThuongHieu;
import com.bags.sixdoBag.model.repository.ThuongHieuRepository;
import com.bags.sixdoBag.service.ThuongHieuService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ThuongHieuServiceImpl implements ThuongHieuService {

    private final ThuongHieuRepository thuongHieuRepository;

    @Override
    public ThuongHieu getidThuongHieu(Integer idThuongHieu) {
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
        th.setMaTH(thuongHieu.getMaTH().trim());
        th.setTen(thuongHieu.getTen().trim());
        th.setTrangThai(true);
        return thuongHieuRepository.save(th);
    }

    @Override
    public ThuongHieu editThuongHieu(Integer idThuongHieu, ThuongHieu thuongHieu) {
        ThuongHieu th = getidThuongHieu(idThuongHieu);
        th.setTen(thuongHieu.getTen().trim());
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

    /////////////////////////////////////////////////////////////
    @Override
    public Page<ThuongHieu> searchThuongHieuTenOrMa(String tenMa, Pageable pageable) {
        return thuongHieuRepository.searchThuongHieuTenOrMa(tenMa, pageable);
    }
    @Override
    public Page<ThuongHieu> searchcbb(boolean name, Pageable pageable) {
        return thuongHieuRepository.searchCbb(name,pageable);
    }
    ////////////////////////////////////////////////////////////////
}
