package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.model.entitys.DoiTuongSuDung;
import com.bags.sixdoBag.model.entitys.MauSac;
import com.bags.sixdoBag.model.entitys.ThuongHieu;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DoiTuongSuDungRepository extends JpaRepository<DoiTuongSuDung, Integer> {
    @Query(value = "SELECT dtsg FROM DoiTuongSuDung dtsg where dtsg.trangThai = true")
    List<DoiTuongSuDung> findDoiTuongSuDungByAll();

    @Query(value = "with x as(select ROW_NUMBER() over (order by id desc) as rs, * from doi_tuong_su_dung \n" +
            "where trang_thai = 1) select * from x where rs between :page and :size", nativeQuery = true)
    List<DoiTuongSuDung> findByPageing(int page, int size);

    @Query(value = "select * from doi_tuong_su_dung where ten like %:tenMa% or ma like %:tenMa%", nativeQuery = true)
    List<DoiTuongSuDung> searchDoiTuongSuDungTenOrMa(String tenMa);

    @Query(value = "select ms from DoiTuongSuDung ms where ms.maDoiTuongSuDung =:ma")
    DoiTuongSuDung searchDoiTuongSuDungByMa(String ma);

    @Query(value = "select ms from DoiTuongSuDung ms where ms.tenDoiTuongSuDung =:ten")
    DoiTuongSuDung searchDoiTuongSuDungByTen(String ten);
    //////////////////////////////////////////////////////
    Page<DoiTuongSuDung> findAll(Pageable pageable);

    @Query(value = "select * from doi_tuong_su_dung where ten like %:tenMa% or ma like %:tenMa%", nativeQuery = true)
    Page<DoiTuongSuDung> searchDTSDTenOrMa(String tenMa, Pageable pageable);

    @Query("select x from DoiTuongSuDung x where x.trangThai = :name")
    Page<DoiTuongSuDung> searchCbb(boolean name, Pageable pageable);
}
