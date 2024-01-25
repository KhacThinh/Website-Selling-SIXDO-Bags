package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.ThuongHieu;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ThuongHieuService {

    public ThuongHieu getidThuongHieu(int idThuongHieu);

    public List<ThuongHieu> getThuongHieus();

    public ThuongHieu addThuongHieu(ThuongHieu thuongHieu);

    public ThuongHieu editThuongHieu(Integer idThuongHieu, ThuongHieu thuongHieu);

    public ThuongHieu deleteThuongHieu(Integer idThuongHieu);

    public List<ThuongHieu> pageThuongHieu(int limit, int size);

    public List<ThuongHieu> searchThuongHieu(String tenThuongHieu);
}
