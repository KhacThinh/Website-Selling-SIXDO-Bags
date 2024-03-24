package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.dto.request.ProductHomeRequest;
import com.bags.sixdoBag.model.dto.request.SanPhamRequest;
import com.bags.sixdoBag.model.entitys.ChiTietSanPham;
import com.bags.sixdoBag.model.entitys.SanPham;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, Integer> {

    @Query(value = "SELECT sp FROM SanPham sp where sp.trangThai = true")
    List<SanPham> findSanPhamByAll();

    @Query(value = "select sp from SanPham sp where sp.tenSanPham =:ten")
    SanPham getSanPhamByTen(String ten);

    @Query(value = "with x as(select ROW_NUMBER() over (order by id desc) as rs, * from san_pham \n" +
            "where trang_thai = 1) select * from x where rs between :page and :size", nativeQuery = true)
    List<SanPham> findByPageing(int page, int size);

    @Query(value = "select sp from SanPham sp where sp.trangThai = true and sp.tenSanPham like %:tenMa% or sp.maSanPham like %:tenMa%")
    List<SanPham> searchSanPhamTenOrMa(String tenMa);

    @Query(value = "select sp from SanPham sp join ThuongHieu as th on sp.thuongHieu = th" +
            " where sp.trangThai = true  and sp.chatLieu like %:tenChatLieu% and th.ten like %:tenThuongHieu%")
    List<SanPham> filterSanPhamChatLieuOrThuongHieu(String tenChatLieu, String tenThuongHieu);

    @Query(value = "select sp from SanPham sp where sp.trangThai = true and sp.khoiLuong between :min and :max")
    List<SanPham> searchKhoiLuong(int min, int max);

//    List<SanPham> findSanPhamsByChatLieuContainingIgnoreCase(String chatLieu);

    @Query(value = "SELECT ctsp FROM ChiTietSanPham ctsp " +
            "JOIN SanPham sp ON ctsp.sanPham = sp " +
            "JOIN MauSac ms ON ctsp.mauSac = ms " +
            "WHERE ctsp.trangThai = 1 " +
            "AND ctsp.soLuong > 0 " +
            "AND sp.tenSanPham LIKE %:ten% ")
    List<ChiTietSanPham> searchSanPhamTen(String ten);


    @Query(value = "WITH MinPrices AS ( " +
            "    SELECT " +
            "        san_pham.id, " +
            "        san_pham.ten, " +
            "        chi_tiet_san_pham.gia_ban, " +
            "        chi_tiet_san_pham.anh_ctsp, " +
            "        ROW_NUMBER() OVER (PARTITION BY san_pham.id ORDER BY chi_tiet_san_pham.gia_ban ASC) AS RowNumber " +
            "    FROM " +
            "        san_pham " +
            "    JOIN  chi_tiet_san_pham ON " +
            "        san_pham.id = chi_tiet_san_pham.id_san_pham " +
            "    JOIN thuong_hieu ON thuong_hieu.id = san_pham.id_thuong_hieu " +
            "    JOIN mau_sac ON mau_sac.id = chi_tiet_san_pham.id_mau_sac " +
            "    WHERE thuong_hieu.ten LIKE %:tenThuongHieu% AND mau_sac.ma LIKE %:maMauSac%) " +
            "SELECT " +
            "    id, " +
            "    ten, " +
            "    gia_ban, " +
            "    anh_ctsp " +
            "FROM " +
            "    MinPrices " +
            "WHERE " +
            "    RowNumber = 1", nativeQuery = true)
    List<ProductHomeRequest> findMinPricesByTenThuongHieuAndMaMauSac(@Param("tenThuongHieu") String tenThuongHieu, @Param("maMauSac") String maMauSac);


}
