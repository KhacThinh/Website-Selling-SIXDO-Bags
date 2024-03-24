package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.dto.request.ProductHomeRequest;
import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.model.entitys.DoiTuongSuDung;
import com.bags.sixdoBag.model.entitys.KhuyenMai;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface DoiTuongSuDungService {
    public DoiTuongSuDung getDoiTuongSuDung(Integer idDoiTuongSuDung);

    public List<DoiTuongSuDung> getListDoiTuongSuDung();

    public DoiTuongSuDung addDoiTuongSuDung(DoiTuongSuDung doiTuongSuDung);

    public DoiTuongSuDung editDoiTuongSuDung(int idDoiTuongSuDung, DoiTuongSuDung doiTuongSuDung);

    public DoiTuongSuDung deleteDoiTuongSuDung(int iddoiTuongSuDung);

    public List<DoiTuongSuDung> pageDoiTuongSuDung(int limit, int size);

    public List<DoiTuongSuDung> searchDoiTuongSuDung(String tenDoiTuongSuDung);

    public DoiTuongSuDung getidDTSD(Integer idDTSD);

    public Page<DoiTuongSuDung> searchDTSDTenOrMa(String tenMa, Pageable pageable);

    public Page<DoiTuongSuDung> searchcbb(boolean name, Pageable pageable);

    public List<ProductHomeRequest> filterDoiTuongSuDungCTSPOnline(String ten);
}
