package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.entitys.MauSac;
import com.bags.sixdoBag.model.entitys.ThuongHieu;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

    @Query(value = "select th from ThuongHieu th where th.maTH =:maThuongHieu")
    ThuongHieu searchThuongHieuByMa(String maThuongHieu);

    @Query(value = "select th from ThuongHieu th where th.ten=:tenThuongHieu")
    ThuongHieu searchThuongHieuByTen(String tenThuongHieu);

    //////////////
    Page<ThuongHieu> findAll(Pageable pageable);

    @Query(value = "select * from thuong_hieu where ten like %:tenMa% or ma like %:tenMa%", nativeQuery = true)
    Page<ThuongHieu> searchThuongHieuTenOrMa(String tenMa,Pageable pageable);

    @Query("select x from ThuongHieu x where x.trangThai = :name")
    Page<ThuongHieu> searchCbb(boolean name, Pageable pageable);
}
