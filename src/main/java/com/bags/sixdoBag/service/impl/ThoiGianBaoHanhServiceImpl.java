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
        return null;
    }

    @Override
    public List<ThoiGianBaoHanh> getThoiGianBaoHanhs() {
        return null;
    }

    @Override
    public ThoiGianBaoHanh addThoiGianBaoHanh(ThoiGianBaoHanh thoiGianBaoHanh) {
        return null;
    }

    @Override
    public ThoiGianBaoHanh editThoiGianBaoHanh(Integer idThoiGianBaoHanh, ThoiGianBaoHanh thoiGianBaoHanh) {
        return null;
    }

    @Override
    public ThoiGianBaoHanh deleteThoiGianBaoHanh(Integer idThoiGianBaoHanh) {
        return null;
    }

    @Override
    public List<ThoiGianBaoHanh> pageThoiGianBaoHanh(int limit, int size) {
        return null;
    }
}
