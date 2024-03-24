package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.dto.request.ProductHomeRequest;
import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.model.entitys.DoiTuongSuDung;
import com.bags.sixdoBag.model.entitys.ThuongHieu;
import com.bags.sixdoBag.model.repository.DoiTuongSuDungRepository;
import com.bags.sixdoBag.model.repository.QueryJpa;
import com.bags.sixdoBag.service.DoiTuongSuDungService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DoiTuongSuDungServiceImpl implements DoiTuongSuDungService {

    private final DoiTuongSuDungRepository doiTuongSuDungRepository;

    private QueryJpa queryJpa = new QueryJpa();

    @Override
    public DoiTuongSuDung getDoiTuongSuDung(Integer idDoiTuongSuDung) {
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

    @Override
    public DoiTuongSuDung getidDTSD(Integer idDTSD) {
        DoiTuongSuDung doiTuongSuDung = doiTuongSuDungRepository.findById(idDTSD).orElse(null);
        return doiTuongSuDung;
    }

    @Override
    public Page<DoiTuongSuDung> searchDTSDTenOrMa(String tenMa, Pageable pageable) {
        return doiTuongSuDungRepository.searchDTSDTenOrMa(tenMa, pageable);
    }
    @Override
    public Page<DoiTuongSuDung> searchcbb(boolean name, Pageable pageable) {
        return doiTuongSuDungRepository.searchCbb(name,pageable);
    }

    @Override
    public List<ProductHomeRequest> filterDoiTuongSuDungCTSPOnline(String ten) {
        List<ProductHomeRequest> productHomeRequestList = queryJpa.filterDoiTuongSuDungProductHome(ten);
        return productHomeRequestList;
    }
}
