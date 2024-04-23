package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.ChiTietHoaDon;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;


@Repository
public interface ChiTietHoaDonRepository extends JpaRepository<ChiTietHoaDon, Integer> {

    @Query("SELECT c FROM ChiTietHoaDon c WHERE c.idHoaDon = :idHoaDon")
    List<ChiTietHoaDon> getGioHangChiTiet(@Param("idHoaDon") int idHoaDon);

    @Query("select hd from ChiTietHoaDon hd where hd.hoaDon.khachHang.id =:idKh")
    List<ChiTietHoaDon>getListCTHDByKh(int idKh);


    @Query("SELECT c FROM ChiTietHoaDon c WHERE c.idHoaDon = :idHoaDon and c.idCtSanPham =:idCtSanPham")
    ChiTietHoaDon getGioHangChiTiet(@Param("idHoaDon") int idHoaDon, @Param("idCtSanPham") int idCtSanPham);


    @Query("SELECT c FROM ChiTietHoaDon c WHERE c.idHoaDon =:idHoaDon")
    List<ChiTietHoaDon> getGioHangChiTietFromHoaDon(@Param("idHoaDon") int idHoaDon);

    @Query("SELECT c FROM ChiTietHoaDon c WHERE c.hoaDon.id IN :hoaDonIds")
    List<ChiTietHoaDon> getGioHangChiTietFromHoaDons(@Param("hoaDonIds") List<Integer> hoaDonIds);


    @Modifying
    @Query("delete from ChiTietHoaDon c WHERE c.idHoaDon = :idHoaDon")
    void deleteChiTietHoaDonByIdHoaDon(@Param("idHoaDon") int idHoaDon);

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO chi_tiet_hoa_don (id_hoa_don, id_ctsp, so_luong, gia) VALUES (:idhoadon, :idchitietsp, :soluong, :dongia)", nativeQuery = true)
    void insertHoaDonChiTiet(@Param("idhoadon") int idhoadon, @Param("idchitietsp") int idchitietsp, @Param("soluong") int soluong, @Param("dongia") double dongia);


    @Query(value = "delete from chi_tiet_hoa_don where id_hoa_don =:idHd and id_ctsp =:id",nativeQuery = true)
    void deleteChiTietHoaDonByIdChiTietSp(Integer idHd,Integer id);

    @Query("select hdct from ChiTietHoaDon hdct where hdct.hoaDon.maHoaDon =:maHd")
    List<ChiTietHoaDon> getListCTHDByMaHd(String maHd);

    void deleteChiTietHoaDonByIdHoaDonAndIdCtSanPham(Integer idHoaDon,Integer idCtSanPham);


    @Modifying
    @Transactional
    @Query(value = "update hoa_don set tong_tien =:tongTien where id=:id", nativeQuery = true)
    void updateTongTien(@Param("tongTien") double tongTien, @Param("id") int id );


}
