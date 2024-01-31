package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NhanVienRepository extends JpaRepository<NhanVien, Integer> {

    @Query(value = "SELECT sp FROM NhanVien sp where sp.trangThai = 1")
    List<NhanVien> findNhanVienByAll();

    @Query(value = "with x as(select ROW_NUMBER() over (order by id desc) as rs, * from nhan_vien \n" +
            "where trang_thai = 1) select * from x where rs between :page and :size", nativeQuery = true)
    List<NhanVien> findByPageing(int page, int size);

    @Query(value = "select * from nhan_vien where trang_thai = 1 and ten like %:tenMa% or ma like %:tenMa%", nativeQuery = true)
    List<NhanVien> searchSanPhamTenOrMa(String tenMa);
}
