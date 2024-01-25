package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.ThuongHieu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ThuongHieuRepository extends JpaRepository<ThuongHieu, Integer> {
    @Query(value = "SELECT dtsg FROM ThuongHieu dtsg where dtsg.trangThai = true")
    List<ThuongHieu> findThuongHieuByAll();

    @Query(value = "with x as(select ROW_NUMBER() over (order by id desc) as rs, * from thuong_hieu \n" +
            "where trang_thai = 1) select * from x where rs between :page and :size", nativeQuery = true)
    public List<ThuongHieu> findByPageing(int page, int size);

    @Query(value = "select * from thuong_hieu where ten like %:tenMa% or ma like %:tenMa%", nativeQuery = true)
    List<ThuongHieu> searchTenThuongHieuOrMa(String tenMa);
}
