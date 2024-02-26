package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.ChiTietHoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ChiTietHoaDonRepository extends JpaRepository<ChiTietHoaDon, Integer> {

    @Query("SELECT c FROM ChiTietHoaDon c WHERE c.idHoaDon = :idHoaDon")
    List<ChiTietHoaDon> getGioHangChiTiet(@Param("idHoaDon") int idHoaDon);


    @Query("SELECT c FROM ChiTietHoaDon c WHERE c.idHoaDon = :idHoaDon and c.idCtSanPham =:idCtSanPham")
    ChiTietHoaDon getGioHangChiTiet(@Param("idHoaDon") int idHoaDon, @Param("idCtSanPham") int idCtSanPham);


    @Query("SELECT c FROM ChiTietHoaDon c WHERE c.idHoaDon = :idHoaDon")
    List<ChiTietHoaDon> getGioHangChiTietFromHoaDon(@Param("idHoaDon") int idHoaDon);


    @Modifying
    @Query("delete from ChiTietHoaDon c WHERE c.idHoaDon = :idHoaDon")
    void deleteChiTietHoaDonByIdHoaDon(@Param("idHoaDon") int idHoaDon);

}
