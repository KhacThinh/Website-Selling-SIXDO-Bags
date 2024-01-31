package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.NhanVien;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface NhanVienService {
    public NhanVien getNhanVien(Integer idNhanVien);

    public List<NhanVien> getNhanViens();

    public NhanVien addNhanVien(NhanVien nhanVien);

    public NhanVien editNhanVien(Integer idNhanVien, NhanVien nhanVien);

    public NhanVien deleteNhanVien(Integer idNhanVien);
}
