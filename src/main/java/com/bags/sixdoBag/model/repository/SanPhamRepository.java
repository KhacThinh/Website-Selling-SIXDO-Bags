package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, Integer> {
    @Query(value = "SELECT sp FROM SanPham sp where sp.trangThai = true")
    List<SanPham> findSanPhamByAll();

    @Query(value = "with x as(select ROW_NUMBER() over (order by id desc) as rs, * from san_pham \n" +
            "where trang_thai = 1) select * from x where rs between :page and :size", nativeQuery = true)
    List<SanPham> findByPageing(int page, int size);

    @Query(value = "select * from san_pham where ten like %:tenMa% or ma like %:tenMa%", nativeQuery = true)
    List<SanPham> searchSanPhamTenOrMa(String tenMa);
}
