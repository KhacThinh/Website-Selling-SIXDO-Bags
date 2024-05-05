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

    @Query(value = "SELECT dtsg FROM ChiTietGioHang dtsg where dtsg.gioHang.khachHang.id =:iKhachHang and dtsg.chiTietSanPham.trangThai = 1 " +
            "and dtsg.chiTietSanPham.sanPham.trangThai = true")
    List<ChiTietGioHang> getListChiTietGioHangByKhachHangAndTrangThaiCtsp(int iKhachHang);

    @Query("select ctgh from ChiTietGioHang ctgh where ctgh.idGioHang =:idGioHang and ctgh.idChiTietSanPham =:idChiTietSanPham")
    ChiTietGioHang getChiTietGioHang(Integer idGioHang, Integer idChiTietSanPham);

    @Query(value = "select o from ChiTietGioHang  o where o.chiTietSanPham.trangThai = 1 and o.chiTietSanPham.sanPham.trangThai = true and o.gioHang.khachHang.id =:idKh")
    public List<ChiTietGioHang> soLuongGioHangByIdKhachHang(int idKh);

    @Query(value = "delete from chi_tiet_gio_hang where id_gio_hang =:idGh and  id_ctsp =:idCtsp",nativeQuery = true)
    void deleteChiTietGioHang(int idGh, int idCtsp);

    @Query(value = "delete from chi_tiet_gio_hang where id_gio_hang =:idGh",nativeQuery = true)
    void deleteAllGiohangChiTietByIdGioHang(int idGh);

    @Query("select ctgh from ChiTietGioHang ctgh where ctgh.idGioHang =:idGh and ctgh.idChiTietSanPham =:idCtsp")
    ChiTietGioHang getChiTietGioHangByCtspAndGh(int idGh, int idCtsp);

}
