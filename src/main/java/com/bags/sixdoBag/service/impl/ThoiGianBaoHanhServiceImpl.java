package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.ThoiGianBaoHanh;
import com.bags.sixdoBag.model.repository.ThoiGianBaoHanhRepository;
import com.bags.sixdoBag.service.ThoiGianBaoHanhService;
import lombok.RequiredArgsConstructor;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ThoiGianBaoHanhServiceImpl implements ThoiGianBaoHanhService {

    private final ThoiGianBaoHanhRepository thoiGianBaoHanhRepository;

    @Override
    public ThoiGianBaoHanh getThoiGianBaoHanh(Integer idThoiGianBaoHanh) {
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

//    @Override
//    public List<ThoiGianBaoHanh> searchMa(String ma) {
//        List<ThoiGianBaoHanh>listSearchMa= thoiGianBaoHanhRepository.searchTenThuongHieuMa(ma);
//        return listSearchMa;
//    }
//
//    @Override
//    public List<ThoiGianBaoHanh> searchTime(Integer time) {
//        List<ThoiGianBaoHanh>listSearchTime = thoiGianBaoHanhRepository.searchTenThuongHieuTime(time);
//        return listSearchTime;
//    }

    @Override
    public Page<ThoiGianBaoHanh> searchTime(Integer tenMa, Pageable pageable) {
        return thoiGianBaoHanhRepository.searchTime(tenMa,pageable);
    }



    @Override
    public Page<ThoiGianBaoHanh> searchcbb(boolean name, Pageable pageable) {
        return thoiGianBaoHanhRepository.searchCbb(name,pageable);
    }


}
