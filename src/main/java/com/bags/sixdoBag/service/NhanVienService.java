package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.dto.request.NhanVienRequest;
import com.bags.sixdoBag.model.entitys.DiaChiKhachHang;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.entitys.NhanVien;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
    ////////////////////////////////////////////////////////
    public Page<NhanVien> searchNhanVienTenOrMa(String tenMa, Pageable pageable);
    public Page<NhanVien> searchcbb(Integer name, Pageable pageable);
    public Page<NhanVien> searchcbb1(String name1, Pageable pageable);
    Page<NhanVien> searchDCKHByChucVuId(Long chucVuId, Pageable pageable);

    public NhanVien getNhanVienByEmail(String email);
    public NhanVien getNhanVienBySDT(String sdt);
    public NhanVien getNhanVienByCCCD(String cccd);
}
