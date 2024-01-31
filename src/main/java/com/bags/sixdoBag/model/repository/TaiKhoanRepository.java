package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.TaiKhoan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TaiKhoanRepository extends JpaRepository<TaiKhoan, Integer> {
    @Query(value = "with x as(select ROW_NUMBER() over (order by id desc) as rs, * from tai_khoan \n" +
            "where trang_thai = 1) select * from x where rs between :page and :size", nativeQuery = true)
    List<TaiKhoan> findByPageing(int page, int size);
}
