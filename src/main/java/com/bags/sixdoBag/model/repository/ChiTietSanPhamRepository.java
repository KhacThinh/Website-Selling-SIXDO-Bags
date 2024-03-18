package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.ChiTietSanPham;
import jakarta.transaction.Transactional;
import jakarta.persistence.criteria.CriteriaBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Transactional
@Repository
public interface ChiTietSanPhamRepository extends JpaRepository<ChiTietSanPham, Integer> {

    @Query(value = "select * from chi_tiet_san_pham where trang_thai = 1", nativeQuery = true)
    List<ChiTietSanPham> getListCtsp();

    @Query(value = "select * from chi_tiet_san_pham as ctsp where ctsp.trang_thai=1 and ctsp.so_luong>0", nativeQuery = true)
    List<ChiTietSanPham> getListCtspTaiQuay();

    @Query(value = "SELECT ctsp FROM ChiTietSanPham ctsp " +
            "JOIN SanPham sp ON ctsp.sanPham = sp " +
            "JOIN MauSac ms ON ctsp.mauSac = ms " +
            "WHERE ctsp.trangThai = 1 " +
            "AND ctsp.soLuong > 0 " +
            "AND (ctsp.ma LIKE %:tenMa% " +
            "OR sp.tenSanPham LIKE %:tenMa% " +
            "OR ms.tenMauSac LIKE %:tenMa%)")
    List<ChiTietSanPham> listSearch(@Param("tenMa") String tenMa);


    @Query(value = "select ctsp from ChiTietSanPham ctsp where ctsp.trangThai=1 and ctsp.soLuong >0 ")
    List<ChiTietSanPham> listSearchTaiQuay(String tenMa);


    @Query(value = "select ctsp from ChiTietSanPham ctsp join SanPham sp on ctsp.sanPham = sp join MauSac ms on ctsp.mauSac = ms" +
            " where ctsp.ma = :ma")
    Optional<ChiTietSanPham> searchSanPhamByMa(String ma);


    @Query(value = "select ctsp from ChiTietSanPham ctsp join SanPham sp on ctsp.sanPham = sp join MauSac ms on ctsp.mauSac = ms" +
            " join DoiTuongSuDung as dtsd on sp.doiTuongSuDung = dtsd where" +
            " sp.chatLieu like %:chatLieu% and" +
            " dtsd.tenDoiTuongSuDung like %:doiTuongSuDung%  and " +
            "ms.tenMauSac like %:mauSac% and sp.thuongHieu.ten like %:thuongHieu%")
    public List<ChiTietSanPham> filterTaiQuay(String chatLieu, String thuongHieu, String mauSac, String doiTuongSuDung);


    @Query(value = "select ctsp from ChiTietSanPham ctsp where ctsp.sanPham.id=:idSanPham")
    List<ChiTietSanPham> getChiTietSanPhamById(int idSanPham);


    @Query(value = "select ctsp.soLuong from ChiTietSanPham ctsp where ctsp.id=:idCtSanPham")
    int getSoLuongSanPhamById(int idCtSanPham);

    @Modifying
    @Query("update ChiTietSanPham ctsp set ctsp.soLuong = :newSoLuong where ctsp.id = :idCtSanPham")
    void updateSoLuongSanPham(int newSoLuong, int idCtSanPham);

    @Query("select ctsp from ChiTietSanPham ctsp where ctsp.ma =:ma")
    ChiTietSanPham getChiTietSanPhamByMa(String ma);

}