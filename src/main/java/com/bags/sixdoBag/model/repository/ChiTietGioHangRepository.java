package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.ChiTietGioHang;
import com.bags.sixdoBag.model.entitys.SanPhamYeuThich;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChiTietGioHangRepository extends JpaRepository<ChiTietGioHang, Integer> {
    @Query(value = "SELECT dtsg FROM ChiTietGioHang dtsg where dtsg.gioHang.khachHang.id =:iKhachHang")
    List<ChiTietGioHang> getListChiTietGioHangByKhachHang(int iKhachHang);

    @Query("select ctgh from ChiTietGioHang ctgh where ctgh.idGioHang =:idGioHang and ctgh.idChiTietSanPham =:idChiTietSanPham")
    ChiTietGioHang getChiTietGioHang(Integer idGioHang, Integer idChiTietSanPham);

}
