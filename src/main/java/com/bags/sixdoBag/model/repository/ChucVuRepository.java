package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.model.entitys.DanhMuc;
import com.bags.sixdoBag.model.entitys.MauSac;
import com.bags.sixdoBag.model.entitys.ThuongHieu;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChucVuRepository extends JpaRepository<ChucVu, Integer> {
    @Query("select cv from ChucVu cv where cv.trangThai =true ")
    List<ChucVu> getListChucVu();

    @Query(value = "with x as(select ROW_NUMBER() over (order by id desc) as rs, * from chuc_vu \n" +
            "where trang_thai = 1) select * from x where rs between :page and :size", nativeQuery = true)
    public List<ChucVu> findByPageing(int page, int size);

    @Query(value = "select * from chuc_vu where ten_chuc_vu like %:tenMa% or ma_chuc_vu like %:tenMa%", nativeQuery = true)
    List<ChucVu> searchChucVuTenOrMa(String tenMa);

    @Query(value = "select ms from ChucVu ms where ms.maChucVu =:ma")
    ChucVu searchChucVuByMa(String ma);

    @Query(value = "select ms from ChucVu ms where ms.tenChucVu =:ten")
    ChucVu searchChucVuByTen(String ten);

    ///////////////////////////////////
//    Page<ChucVu> findAll(Pageable pageable);
//
//    @Query(value = "select * from chuc_vu where ten_chuc_vu like %:tenMa% or ma_chuc_vu like %:tenMa%", nativeQuery = true)
//    Page<ChucVu> searchChucVuTenOrMa(String tenMa,Pageable pageable);
//
//    @Query("select x from ChucVu x where x.trangThai = :name")
//    Page<ChucVu> searchCbb(boolean name, Pageable pageable);
}
