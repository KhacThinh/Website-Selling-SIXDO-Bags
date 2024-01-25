package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.ThoiGianBaoHanh;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ThoiGianBaoHanhRepository extends JpaRepository<ThoiGianBaoHanh, Integer> {

    @Query(value = "SELECT dtsg FROM ThoiGianBaoHanh dtsg where dtsg.trangThai = true")
    List<ThoiGianBaoHanh> findThoiGianBaoHanhByAll();

    @Query(value = "with x as(select ROW_NUMBER() over (order by id desc) as rs, * from thoi_gian_bao_hanh \n" +
            "where trang_thai = 1) select * from x where rs between :page and :size", nativeQuery = true)
    public List<ThoiGianBaoHanh> findByPageing(int page, int size);
}
