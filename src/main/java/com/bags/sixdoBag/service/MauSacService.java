package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.MauSac;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface MauSacService {

    public MauSac getDanhMuc(Integer idMauSac);

    public List<MauSac> getMauSacs();

    public MauSac addMauSac(MauSac mauSac);

    public MauSac editMauSac(Integer idMauSac, MauSac mauSac);

    public MauSac deleteMauSac(Integer idMauSac);

    public List<MauSac> pageMauSac(int limit, int size);

    public List<MauSac> searchMauSac(String tenMauSac);
}
