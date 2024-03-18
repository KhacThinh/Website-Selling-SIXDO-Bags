package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DiaChiKhachHangRepository extends JpaRepository<DiaChiKhachHang, Integer> {
    @Query(value = "SELECT dckh FROM DiaChiKhachHang dckh where dckh.trangThai = true")
    List<DiaChiKhachHang> findDiaChiKhachHangByAll();

    @Query(value = "with x as(select ROW_NUMBER() over (order by id desc) as rs, * from dia_chi_khach_hang \n" +
            "where trang_thai = 1) select * from x where rs between :page and :size", nativeQuery = true)
    List<DiaChiKhachHang> findByPageing(int page, int size);

    @Query(value = "select * from dia_chi_khach_hang where ten like %:ten%", nativeQuery = true)
    List<DiaChiKhachHang> searchDiaChiKhachHangTen(String ten);

    @Query(value = "select ms from DiaChiKhachHang ms where ms.tenDiaChi =:ten")
    DiaChiKhachHang searchDiaChiKhachHangByTen(String ten);


//    @Query(value = "select * from khuyen_mai where ten like %:tenMa% or ma_khuyen_mai like %:tenMa%", nativeQuery = true)
//    Page<KhuyenMai> searchKhuyenMaiTenOrMa(String tenMa, Pageable pageable);


    ///////////////////////////////////////////////////////////
    Page<DiaChiKhachHang> findAll(Pageable pageable);

    @Query(value = "select * from dia_chi_khach_hang where ten_dia_chi like %:tenMa% ", nativeQuery = true)
    Page<DiaChiKhachHang> searchDCKHTenOrMa(String tenMa, Pageable pageable);


    @Query("select x from DiaChiKhachHang x where x.trangThai = :name")
    Page<DiaChiKhachHang> searchCbb(boolean name, Pageable pageable);

    @Query("select x from DiaChiKhachHang x where x.khachHang.tenKhachHang = :name1")
    Page<DiaChiKhachHang> searchCbb1(String name, Pageable pageable);

    Page<DiaChiKhachHang> findByKhachHangId(Long khachHangId, Pageable pageable);
    ////////////////////////////////////////////////////////////
}
