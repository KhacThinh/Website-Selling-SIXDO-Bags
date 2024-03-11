package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.model.entitys.MauSac;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ChucVuService {
    public ChucVu getChucVu(Integer idChucVu);

    public List<ChucVu> getListChucVu();

    public ChucVu addChucVu(ChucVu chucVu);

    public ChucVu editChucVu(Integer idChucVu,ChucVu chucVu);

    public ChucVu deleteChucVu(Integer idchucVu);

    public List<ChucVu>pageChucVu(int limit, int size);

    public List<ChucVu>searchChucVu(String tenChucVu);

    public ChucVu getidChucVu(Integer idChucVu);
}
