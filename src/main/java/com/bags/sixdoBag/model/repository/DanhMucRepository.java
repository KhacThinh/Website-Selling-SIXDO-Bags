package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.DanhMuc;
import com.bags.sixdoBag.model.entitys.MauSac;
import com.bags.sixdoBag.model.entitys.ThuongHieu;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface DanhMucRepository extends JpaRepository<DanhMuc,Integer> {
    @Query(value = "SELECT dm FROM DanhMuc dm where dm.trangThai = true")
    List<DanhMuc> findDanhMucByAll();

    @Query(value = "with x as(select ROW_NUMBER() over (order by id desc) as rs, * from danh_muc \n" +
            "where trang_thai = 1) select * from x where rs between :page and :size", nativeQuery = true)
    public List<DanhMuc> findByPageing(int page, int size);

    @Query(value = "select * from danh_muc where ten like %:tenMa% or ma like %:tenMa%", nativeQuery = true)
    List<DanhMuc> searchDanhMucOrMaDanhMuc(String tenMa);

    @Query(value = "select dm from DanhMuc dm where dm.maDanhMuc =:ma")
    DanhMuc searchDanhMucByMa(String ma);

    @Query(value = "select dm from DanhMuc dm where dm.tenDanhMuc =:ten")
    DanhMuc searchDanhMucByTen(String ten);



    //////////////////////////////////
    Page<DanhMuc> findAll(Pageable pageable);

    @Query(value = "select * from danh_muc where ten like %:tenMa% or ma like %:tenMa%", nativeQuery = true)
    Page<DanhMuc> searchDanhMucTenOrMa(String tenMa, Pageable pageable);

    @Query("select x from DanhMuc x where x.trangThai = :name")
    Page<DanhMuc> searchCbb(boolean name, Pageable pageable);
}
