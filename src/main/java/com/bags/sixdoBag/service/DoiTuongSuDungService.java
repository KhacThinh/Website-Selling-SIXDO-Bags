package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.DoiTuongSuDung;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface DoiTuongSuDungService {
    public DoiTuongSuDung getDoiTuongSuDung(int idDoiTuongSuDung);

    public List<DoiTuongSuDung> getListDoiTuongSuDung();

    public DoiTuongSuDung addDoiTuongSuDung(DoiTuongSuDung doiTuongSuDung);

    public DoiTuongSuDung editDoiTuongSuDung(DoiTuongSuDung doiTuongSuDung);

    public DoiTuongSuDung deleteDoiTuongSuDung(DoiTuongSuDung doiTuongSuDung);

    public List<DoiTuongSuDung>pageDoiTuongSuDung(int limit, int size);

    public List<DoiTuongSuDung>searchDoiTuongSuDung(String tenDoiTuongSuDung);
}
