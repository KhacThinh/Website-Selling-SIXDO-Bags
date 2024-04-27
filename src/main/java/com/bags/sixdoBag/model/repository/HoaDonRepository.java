package com.bags.sixdoBag.model.repository;


import com.bags.sixdoBag.model.dto.response.HoaDonResponse;
import com.bags.sixdoBag.model.entitys.HoaDon;
import com.bags.sixdoBag.model.entitys.KhachHang;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Transactional
@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, Integer> {
    @Query("select hd from HoaDon hd where hd.id =:id ")
    HoaDonResponse getHoaDonResponseById(int id);

    @Query("select hd from HoaDon hd where hd.trangThai =2")
    List<HoaDon>listHDChuaXacNhan();

    @Query("select hd from HoaDon hd where hd.trangThai =3")
    List<HoaDon>listHDDangXuLy();

    @Query("select hd from HoaDon hd where hd.trangThai =4")
    List<HoaDon>listHDHuyy();

    @Query("select hd from HoaDon hd where hd.trangThai =5")
    List<HoaDon>listHDDangGiao();

    @Query("select hd from HoaDon hd where hd.trangThai =0")
    List<HoaDon>listHDTaiQuay();

    @Query("select hd from HoaDon hd where hd.trangThai =6")
    List<HoaDon>listHDHoanThanh();

    @Query("select hd from HoaDon hd where hd.maHoaDon =:key or hd.tenNguoiNhan like %:key% or hd.sdtNguoiNhan =:key")
    List<HoaDon> searchHDByMaorSdt(String key);





    @Query("SELECT hd FROM HoaDon hd WHERE hd.trangThai <> 1")
    List<HoaDon>getListHd();

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

    @Query(value = "select hd from HoaDon hd join KhachHang as kh on hd.khachHang = kh where hd.id = :id")
    Optional<HoaDon> getHoaDonByIdHoaDonTrangThaiAndKhachHang(int id);

    @Query(value = "select hd from HoaDon hd join KhachHang as kh on hd.khachHang = kh where kh.id = :idKh")
    List<HoaDon> getHoaDonByKhachHang(int idKh);

    @Query(value = "select hd.* from hoa_don as hd join khach_hang kh on hd.id_khach_hang = kh.id where kh.id = :idKh",nativeQuery = true)
    List<HoaDon> getListHoaDonByKhachHang(int idKh);

}
