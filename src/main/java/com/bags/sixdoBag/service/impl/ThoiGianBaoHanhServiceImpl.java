package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.ThoiGianBaoHanh;
import com.bags.sixdoBag.model.repository.ThoiGianBaoHanhRepository;
import com.bags.sixdoBag.service.ThoiGianBaoHanhService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ThoiGianBaoHanhServiceImpl implements ThoiGianBaoHanhService {

    private final ThoiGianBaoHanhRepository thoiGianBaoHanhRepository;

    @Override
    public ThoiGianBaoHanh getThoiGianBaoHanh(int idThoiGianBaoHanh) {
        ThoiGianBaoHanh gianBaoHanh = thoiGianBaoHanhRepository.findById(idThoiGianBaoHanh).orElse(null);
        return gianBaoHanh;
    }

    @Override
    public List<ThoiGianBaoHanh> getThoiGianBaoHanhs() {
        List<ThoiGianBaoHanh> thoiGianBaoHanhs = thoiGianBaoHanhRepository.findThoiGianBaoHanhByAll();
        return thoiGianBaoHanhs;
    }

    @Override
    public ThoiGianBaoHanh addThoiGianBaoHanh(ThoiGianBaoHanh thoiGianBaoHanh) {
        ThoiGianBaoHanh tgbh = new ThoiGianBaoHanh();
        tgbh.setMa(thoiGianBaoHanh.getMa().trim());
        tgbh.setThoiGian(thoiGianBaoHanh.getThoiGian());
        tgbh.setTrangThai(true);
        return thoiGianBaoHanhRepository.save(tgbh);
    }

    @Override
    public ThoiGianBaoHanh editThoiGianBaoHanh(Integer idThoiGianBaoHanh, ThoiGianBaoHanh thoiGianBaoHanh) {
        ThoiGianBaoHanh tgbh = getThoiGianBaoHanh(idThoiGianBaoHanh);
        tgbh.setThoiGian(thoiGianBaoHanh.getThoiGian());
        return thoiGianBaoHanhRepository.save(tgbh);
    }

    @Override
    public ThoiGianBaoHanh deleteThoiGianBaoHanh(Integer idThoiGianBaoHanh) {
        ThoiGianBaoHanh gianBaoHanh = getThoiGianBaoHanh(idThoiGianBaoHanh);
        gianBaoHanh.setTrangThai(false);
        return thoiGianBaoHanhRepository.save(gianBaoHanh);
    }

    @Override
    public List<ThoiGianBaoHanh> pageThoiGianBaoHanh(int limit, int size) {
        List<ThoiGianBaoHanh> thoiGianBaoHanhs = thoiGianBaoHanhRepository.findByPageing(limit, size);
        return thoiGianBaoHanhs;
    }
}
