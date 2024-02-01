package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.dto.request.NhanVienRequest;
import com.bags.sixdoBag.model.entitys.NhanVien;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface NhanVienService {
    public NhanVien getNhanVien(Integer idNhanVien);

    public List<NhanVien> getNhanViens();

    public NhanVien addNhanVien(NhanVienRequest nhanVien);

    public NhanVien editNhanVien(Integer idNhanVien, NhanVienRequest nhanVien);

    public NhanVien deleteNhanVien(Integer idNhanVien);
}
