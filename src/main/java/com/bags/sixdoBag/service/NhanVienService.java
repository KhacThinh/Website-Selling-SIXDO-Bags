package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.dto.request.NhanVienRequest;
import com.bags.sixdoBag.model.entitys.KhachHang;
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

    NhanVien loginNhanVien(String email,String matKhau);
    public NhanVien getidNhanVien(Integer idNhanVien);
}
