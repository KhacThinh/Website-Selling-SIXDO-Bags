package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.dto.request.HinhAnhCTSPRequest;
import com.bags.sixdoBag.model.entitys.HinhAnhCTSP;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface HinhAnhCTSPService {
    public HinhAnhCTSP getAnhCTSP(Integer idAnh);

    public List<HinhAnhCTSP> getListHinhAnhCTSP();

    public HinhAnhCTSP addHinhAnhCTSP(HinhAnhCTSPRequest hinhAnhCTSP);

    public HinhAnhCTSP editHinhAnhCTSP(int idHinhAnhCTSP,HinhAnhCTSPRequest hinhAnhCTSP);

    public HinhAnhCTSP deleteHinhANhCTSP(int idHinhAnhCTSP);
}
