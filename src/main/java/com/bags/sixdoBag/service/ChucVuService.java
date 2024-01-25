package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.ChucVu;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ChucVuService {
    public ChucVu getChucVu(int idChucVu);

    public List<ChucVu> getListChucVu();

    public ChucVu addChucVu(ChucVu chucVu);

    public ChucVu editChucVu(int idChucVu,ChucVu chucVu);

    public ChucVu deleteChucVu(int idchucVu);

    public List<ChucVu>pageChucVu(int limit, int size);

    public List<ChucVu>searchChucVu(String tenChucVu);

}
