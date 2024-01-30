package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.dto.request.HinhAnhCTSPRequest;
import com.bags.sixdoBag.model.entitys.HinhAnhCTSP;
import com.bags.sixdoBag.model.repository.HinhAnhCTSPRepository;
import com.bags.sixdoBag.service.ChiTietSanPhamServivce;
import com.bags.sixdoBag.service.HinhAnhCTSPService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class HinhAnhCTSPServiceImpl implements HinhAnhCTSPService {
    public final HinhAnhCTSPRepository hinhAnhCTSPRepository;
    public final ChiTietSanPhamServivce chiTietSanPhamServivce;

    @Override
    public HinhAnhCTSP getAnhCTSP(Integer idAnh) {
        HinhAnhCTSP hinhAnhCTSP = hinhAnhCTSPRepository.findById(idAnh).orElse(null);
        return hinhAnhCTSP;
    }

    @Override
    public List<HinhAnhCTSP> getListHinhAnhCTSP() {
        List<HinhAnhCTSP> hinhAnhCTSPList = hinhAnhCTSPRepository.findAll();
        return hinhAnhCTSPList;
    }

    @Override
    public HinhAnhCTSP addHinhAnhCTSP(HinhAnhCTSPRequest hinhAnhCTSP) {
        HinhAnhCTSP hinhAnhCTSP1 = new HinhAnhCTSP();
        hinhAnhCTSP1.setUrl(hinhAnhCTSP.getUrl());
        Integer idChiTietSP = hinhAnhCTSP.getIdChiTietSP();
        if (idChiTietSP != null) {
            hinhAnhCTSP1.setChiTietSanPham(chiTietSanPhamServivce.getChiTietSanPham(idChiTietSP));
        }
        return hinhAnhCTSPRepository.save(hinhAnhCTSP1);
    }

    @Override
    public HinhAnhCTSP editHinhAnhCTSP(int idHinhAnhCTSP, HinhAnhCTSPRequest hinhAnhCTSP) {
        HinhAnhCTSP hinhAnhCTSP1 = getAnhCTSP(idHinhAnhCTSP);
        hinhAnhCTSP1.setUrl(hinhAnhCTSP.getUrl());
        Integer idChiTietSP = hinhAnhCTSP.getIdChiTietSP();

        if (idChiTietSP != null) {
            hinhAnhCTSP1.setChiTietSanPham(chiTietSanPhamServivce.getChiTietSanPham(idChiTietSP));

        }
        return hinhAnhCTSPRepository.save(hinhAnhCTSP1);
    }

    @Override
    public HinhAnhCTSP deleteHinhANhCTSP(int idHinhAnhCTSP) {
        HinhAnhCTSP hinhAnhCTSP = getAnhCTSP(idHinhAnhCTSP);
        hinhAnhCTSPRepository.delete(hinhAnhCTSP);
        return hinhAnhCTSP;

    }
}
