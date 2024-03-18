package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.entitys.ThuongHieu;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ThuongHieuService {

    public ThuongHieu getidThuongHieu(Integer idThuongHieu);

    public List<ThuongHieu> getThuongHieus();

    public ThuongHieu addThuongHieu(ThuongHieu thuongHieu);

    public ThuongHieu editThuongHieu(Integer idThuongHieu, ThuongHieu thuongHieu);

    public ThuongHieu deleteThuongHieu(Integer idThuongHieu);

    public List<ThuongHieu> pageThuongHieu(int limit, int size);

    public List<ThuongHieu> searchThuongHieu(String tenThuongHieu);

    ////////////////////////////////////////////////////////////////////////////////////
    public Page<ThuongHieu> searchThuongHieuTenOrMa(String tenMa, Pageable pageable);

    public Page<ThuongHieu> searchcbb(boolean name, Pageable pageable);
    ///////////////////////////////////////////////////////////////////////////////////
}
