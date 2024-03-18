package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.DiaChiKhachHang;
import com.bags.sixdoBag.model.entitys.MauSac;
import com.bags.sixdoBag.model.repository.MauSacRepository;
import com.bags.sixdoBag.service.MauSacService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MauSacServiceImpl implements MauSacService {

    private final MauSacRepository mauSacRepository;

    @Override
    public MauSac getMauSac(Integer idMauSac) {
        MauSac mauSac = mauSacRepository.findById(idMauSac)
                .orElseThrow(() -> new IllegalArgumentException("Màu Sắc không tồn tại id " + idMauSac));
        return mauSac;
    }

    @Override
    public List<MauSac> getMauSacs() {
        List<MauSac> mauSacs = mauSacRepository.findMauSacByAll();
        return mauSacs;
    }

    @Override
    public MauSac addMauSac(MauSac mauSac) {
        MauSac ms = new MauSac();
        ms.setMaMauSac(mauSac.getMaMauSac().trim());
        ms.setTenMauSac(mauSac.getTenMauSac().trim());
        return mauSacRepository.save(ms);
    }

    @Override
    public MauSac editMauSac(Integer idMauSac, MauSac mauSac) {
        MauSac ms = getMauSac(idMauSac);
        ms.setMaMauSac(mauSac.getMaMauSac().trim());
        ms.setTenMauSac(mauSac.getTenMauSac().trim());
        return mauSacRepository.save(ms);
    }

    @Override
    public MauSac deleteMauSac(Integer idMauSac) {
        MauSac ms = getMauSac(idMauSac);
        mauSacRepository.delete(ms);
        return ms;
    }

    @Override
    public List<MauSac> pageMauSac(int limit, int size) {
        List<MauSac> mauSacs = mauSacRepository.findByPageing(limit, size);
        return mauSacs;
    }

//    @Override
//    public List<MauSac> searchMauSac(String tenMauSac) {
//        List<MauSac> mauSacs = mauSacRepository.searchMauSacTenOrMa(tenMauSac);
//        return mauSacs;
//    }

    @Override
    public boolean isMaMauSacExists(String maMauSac) {
        return mauSacRepository.isMaMauSacExists(maMauSac);
    }

    @Override
    public MauSac getidMauSac(Integer idMauSac) {
        MauSac mauSac = mauSacRepository.findById(idMauSac).orElse(null);
        return mauSac;
    }

    //////////////////////////////////////////////////
    @Override
    public Page<MauSac> searchMauSacTenOrMa(String tenMa, Pageable pageable) {
        return mauSacRepository.searchMauSacTenOrMa(tenMa, pageable);
    }
    ////////////////////////////////////////////
}
