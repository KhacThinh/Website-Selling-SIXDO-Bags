package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.ThoiGianBaoHanh;
import com.bags.sixdoBag.model.entitys.ThuongHieu;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

    //    public List<ThoiGianBaoHanh>searchMa(String ma);
//    public List<ThoiGianBaoHanh>searchTime(Integer time);
    public Page<ThoiGianBaoHanh> searchTime(Integer tenMa, Pageable pageable);


    public Page<ThoiGianBaoHanh> searchcbb(boolean name, Pageable pageable);
}
