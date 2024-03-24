package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.dto.request.ProductHomeRequest;
import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.model.entitys.DanhMuc;
import com.bags.sixdoBag.model.entitys.KhuyenMai;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

    public DanhMuc getidDanhMuc(Integer idDanhMuc);

    public Page<DanhMuc> searchDanhMucTenOrMa(String tenMa, Pageable pageable);

    public Page<DanhMuc> searchcbb(boolean name, Pageable pageable);

    public List<ProductHomeRequest> filterDanhMucCTSPOnline(String tenDanhMuc);
}
