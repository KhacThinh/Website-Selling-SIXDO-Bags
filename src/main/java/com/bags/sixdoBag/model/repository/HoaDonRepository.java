package com.bags.sixdoBag.model.repository;


import com.bags.sixdoBag.model.entitys.HoaDon;
import com.bags.sixdoBag.model.entitys.KhachHang;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Transactional
@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, Integer> {

    @Query(value = "select hd from HoaDon hd where hd.maHoaDon =:maHd")
    HoaDon getHoaDonByMaHoaDon(String maHd);

    @Modifying
    @Query(value = "update HoaDon hd  set  hd.trangThai =:trangThai where hd.maHoaDon=:maHd")
    void setTrangThaiDonHang(int trangThai, String maHd);

    @Query(value = "select hd from HoaDon hd where hd.maHoaDon like %:maSdt% or hd.sdtNguoiNhan like %:maSdt%")
    List<HoaDon> getHoaDomByMaHoaDonOrSdt(String maSdt);


    @Query(value = "select * from hoa_don where thoi_gian_tao between :ngayBatDau and :ngayKetThuc", nativeQuery = true)
    List<HoaDon> filterNgayBatDauKetThuc(String ngayBatDau, String ngayKetThuc);

    @Query(value = "select hd from HoaDon hd join KhachHang as kh on hd.khachHang = kh where hd.trangThai = :trangThai and kh.id = :idKh")
    List<HoaDon> getHoaDonByTrangThaiAndKhachHang(int idKh, int trangThai);

    @Query(value = "select hd from HoaDon hd join KhachHang as kh on hd.khachHang = kh where kh.id = :idKh")
    List<HoaDon> getHoaDonByKhachHang(int idKh);
}
