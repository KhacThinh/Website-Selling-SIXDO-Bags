package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, Integer> {

    @Query(value = "SELECT sp FROM SanPham sp")
    List<SanPham> findSanPhamByAll();

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
}
