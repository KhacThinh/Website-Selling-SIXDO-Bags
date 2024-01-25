package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.ChucVu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChucVuRepository extends JpaRepository<ChucVu,Integer> {
    @Query("select cv from ChucVu cv where cv.trangThai =true ")
    List<ChucVu>getListChucVu();
}
