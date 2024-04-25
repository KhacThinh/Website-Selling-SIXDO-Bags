package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.model.entitys.DanhSachKhachHangApMgg;
import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.entitys.MaGiamGia;
import com.bags.sixdoBag.model.entitys.MauSac;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface MaGiamGiaService {

    public MaGiamGia getMaGiamGia(Integer idMaGiamGia);

    int apDungMaGiamGia(int idKhachHang, int maGiamGia);

    public List<MaGiamGia> getListMaGiamGia();

    public MaGiamGia addMaGiamGia(MaGiamGia maGiamGia);

    void deleteDanhSachKhMggByIdMgg(int idMaGiamGia);

    public MaGiamGia searchMaGiamGiaByMa(String maGiamGia);

    public MaGiamGia editMaGiamGia(Integer idMaGiamGia, MaGiamGia maGiamGia);

    public MaGiamGia deleteMaGiamGia(Integer idMaGiamGia);

    public List<MaGiamGia> pageMaGiamGia(int limit, int size);

    int[] getidKhByMgg(int idMaGiamGia);

    public MaGiamGia getidMaGiamGia(Integer idChucVu);

    void insertKhachHangMgg(int idKhachHang, int idMaGiamGia);

    int top1IdMaGiamGia();

    public Page<MaGiamGia> searchMGGTenOrMa(String tenMa, Pageable pageable);

    public Page<MaGiamGia> searchcbb(boolean name, Pageable pageable);

    List<MaGiamGia> danhSachMaGiamGiaByKhachHang(int idKhachHang);

    MaGiamGia getMaGiamGiaByKhachHang(int idKhachHang, int maGiamGia);
}
