package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.entitys.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KhuyenMaiRepository extends JpaRepository<KhuyenMai, Integer> {
    @Query(value = "SELECT km FROM KhuyenMai km where km.trangThai = 1")
    List<KhuyenMai> findKhuyenMaiByAll();

    @Query(value = "with x as(select ROW_NUMBER() over (order by id desc) as rs, * from khuyen_mai \n" +
            "where trang_thai = 1) select * from x where rs between :page and :size", nativeQuery = true)
    List<KhuyenMai> findByPageing(int page, int size);

    @Query(value = "select * from khuyen_mai where ten like %:tenMa% or ma_khuyen_mai like %:tenMa%", nativeQuery = true)
    List<KhuyenMai> searchKhuyenMaiTenOrMa(String tenMa);



    @Query(value = "DECLARE @start_date datetime = :dateStart; \n" +
            "DECLARE @end_date datetime = :dateEnd;   \n" +
            "\n" +
            "SELECT *\n" +
            "FROM khuyen_mai\n" +
            "WHERE ngay_bat_dau BETWEEN @start_date AND @end_date\n" +
            "   OR ngay_ket_thuc BETWEEN @start_date AND @end_date\n" +
            "   OR (@start_date BETWEEN ngay_bat_dau AND ngay_ket_thuc AND @end_date BETWEEN ngay_bat_dau AND ngay_ket_thuc);", nativeQuery = true)
    List<KhuyenMai> searchKhuyenMaiNgay(String dateStart, String dateEnd);
}
