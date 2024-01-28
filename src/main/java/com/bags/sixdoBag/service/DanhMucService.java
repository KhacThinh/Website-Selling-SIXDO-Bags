package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.DanhMuc;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface DanhMucService {

    public DanhMuc getDanhMuc(Integer idDanhMuc);

    public List<DanhMuc> getDanhMucs();

    public DanhMuc addDanhMuc(DanhMuc danhMuc);

    public DanhMuc editDanhMuc(Integer idDanhMuc, DanhMuc danhMuc);

    public DanhMuc deleteDanhMuc(Integer idDanhMuc);

    public List<DanhMuc> pageDanhMuc(int limit, int size);

    public List<DanhMuc> searchDanhMuc(String tenDanhMuc);
}
