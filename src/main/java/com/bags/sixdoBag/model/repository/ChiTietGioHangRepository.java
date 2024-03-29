package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.ChiTietGioHang;
import com.bags.sixdoBag.model.entitys.SanPhamYeuThich;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChiTietGioHangRepository extends JpaRepository<ChiTietGioHang, Integer> {
    @Query(value = "SELECT dtsg FROM ChiTietGioHang dtsg where dtsg.gioHang.khachHang.id =:iKhachHang")
    List<ChiTietGioHang> getListChiTietGioHangByKhachHang(int iKhachHang);

    @Query("select ctgh from ChiTietGioHang ctgh where ctgh.idGioHang =:idGioHang and ctgh.idChiTietSanPham =:idChiTietSanPham")
    ChiTietGioHang getChiTietGioHang(Integer idGioHang, Integer idChiTietSanPham);

    @Query(value = "select sum(ctgh.so_luong) from gio_hang as gh " +
            "join chi_tiet_gio_hang as ctgh on gh.id = ctgh.id_gio_hang " +
            "where gh.id_khach_hang = :idKh " +
            "group by gh.id", nativeQuery = true)
    public Integer soLuongGioHangByIdKhachHang(@Param("idKh") int idKh);

}
