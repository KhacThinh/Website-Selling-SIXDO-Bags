package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.MaGiamGia;
import com.bags.sixdoBag.model.entitys.MauSac;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface MauSacService {

    public MauSac getMauSac(Integer idMauSac);

    public List<MauSac> getMauSacs();

    public MauSac addMauSac(MauSac mauSac);

    public MauSac editMauSac(Integer idMauSac, MauSac mauSac);

    public MauSac deleteMauSac(Integer idMauSac);

    public List<MauSac> pageMauSac(int limit, int size);

//    public List<MauSac> searchMauSac(String tenMauSac);

    public boolean isMaMauSacExists(String maMauSac);

    public MauSac getidMauSac(Integer idMauSac);

    ////////////////////////////////////////////////////////////////////
    public Page<MauSac> searchMauSacTenOrMa(String tenMa, Pageable pageable);
}
