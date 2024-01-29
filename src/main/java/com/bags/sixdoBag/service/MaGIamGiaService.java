package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.MaGiamGia;
import com.bags.sixdoBag.model.entitys.MauSac;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface MaGIamGiaService {

    public MaGiamGia getMaGiamGia(int idMaGiamGia);

    public List<MaGiamGia> getListMaGiamGia();

    public MaGiamGia addMaGiamGia(MaGiamGia maGiamGia);

    public MaGiamGia editMaGiamGia(Integer idMaGiamGia, MaGiamGia maGiamGia);

    public MaGiamGia deleteMaGiamGia(Integer idMaGiamGia);

    public List<MaGiamGia> pageMaGiamGia(int limit, int size);
}
