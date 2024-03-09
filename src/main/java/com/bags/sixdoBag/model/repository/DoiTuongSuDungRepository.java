package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.DanhMuc;
import com.bags.sixdoBag.model.entitys.DoiTuongSuDung;
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

    @Query(value = "select dt from DoiTuongSuDung dt where dt.maDoiTuongSuDung =:maDoiTuongSuDung")
    DoiTuongSuDung searchDoiTuongSuDungByMa(String maDoiTuongSuDung);

    @Query(value = "select dt from DoiTuongSuDung dt where dt.tenDoiTuongSuDung =:tenDoiTuongSuDung")
    DoiTuongSuDung searchDoiTuongSuDungByTen(String tenDoiTuongSuDung);
}
