package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.DoiTuongSuDung;
import com.bags.sixdoBag.model.repository.DoiTuongSuDungRepository;
import com.bags.sixdoBag.service.DoiTuongSuDungService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DoiTuongSuDungServiceImpl implements DoiTuongSuDungService {

    private final DoiTuongSuDungRepository doiTuongSuDungRepository;

    @Override
    public DoiTuongSuDung getDoiTuongSuDung(int idDoiTuongSuDung) {
        DoiTuongSuDung doiTuongSuDung = doiTuongSuDungRepository.findById(idDoiTuongSuDung).orElse(null);
        return doiTuongSuDung;
    }

    @Override
    public List<DoiTuongSuDung> getListDoiTuongSuDung() {
        List<DoiTuongSuDung> doiTuongSuDungs = doiTuongSuDungRepository.findDoiTuongSuDungByAll();
        return doiTuongSuDungs;
    }

    @Override
    public DoiTuongSuDung addDoiTuongSuDung(DoiTuongSuDung doiTuongSuDung) {
        DoiTuongSuDung dtsg = new DoiTuongSuDung();
        dtsg.setMaDoiTuongSuDung(doiTuongSuDung.getMaDoiTuongSuDung().trim());
        dtsg.setTenDoiTuongSuDung(doiTuongSuDung.getTenDoiTuongSuDung().trim());
        dtsg.setTrangThai(true);
        return doiTuongSuDungRepository.save(dtsg);
    }

    @Override
    public DoiTuongSuDung editDoiTuongSuDung(int idDoiTuongSuDung, DoiTuongSuDung doiTuongSuDung) {
        DoiTuongSuDung dtsg = getDoiTuongSuDung(idDoiTuongSuDung);
        dtsg.setTenDoiTuongSuDung(doiTuongSuDung.getTenDoiTuongSuDung().trim());
        return doiTuongSuDungRepository.save(dtsg);
    }

    @Override
    public DoiTuongSuDung deleteDoiTuongSuDung(int iddoiTuongSuDung) {
        DoiTuongSuDung doiTuongSuDung = getDoiTuongSuDung(iddoiTuongSuDung);
        doiTuongSuDung.setTrangThai(false);
        return doiTuongSuDungRepository.save(doiTuongSuDung);
    }

    @Override
    public List<DoiTuongSuDung> pageDoiTuongSuDung(int limit, int size) {
        List<DoiTuongSuDung> doiTuongSuDungs = doiTuongSuDungRepository.findByPageing(limit, size);
        return doiTuongSuDungs;
    }

    @Override
    public List<DoiTuongSuDung> searchDoiTuongSuDung(String tenDoiTuongSuDung) {
        List<DoiTuongSuDung> doiTuongSuDungs = doiTuongSuDungRepository.searchDoiTuongSuDungTenOrMa(tenDoiTuongSuDung);
        return doiTuongSuDungs;
    }
}
