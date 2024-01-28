package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.ThoiGianBaoHanh;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ThoiGianBaoHanhService {

    public ThoiGianBaoHanh getThoiGianBaoHanh(Integer idThoiGianBaoHanh);

    public List<ThoiGianBaoHanh> getThoiGianBaoHanhs();

    public ThoiGianBaoHanh addThoiGianBaoHanh(ThoiGianBaoHanh thoiGianBaoHanh);

    public ThoiGianBaoHanh editThoiGianBaoHanh(Integer idThoiGianBaoHanh, ThoiGianBaoHanh thoiGianBaoHanh);

    public ThoiGianBaoHanh deleteThoiGianBaoHanh(Integer idThoiGianBaoHanh);

    public List<ThoiGianBaoHanh> pageThoiGianBaoHanh(int limit, int size);
}
