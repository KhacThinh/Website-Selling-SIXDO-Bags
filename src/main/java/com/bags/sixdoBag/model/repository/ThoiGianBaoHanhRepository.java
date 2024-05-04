package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.ThoiGianBaoHanh;

import com.bags.sixdoBag.model.entitys.ThuongHieu;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

    @Query(value = "select th from ThoiGianBaoHanh th where th.ma =:maTG")
    ThoiGianBaoHanh searchTGByMa(String maTG);

    @Query(value = "select th from ThoiGianBaoHanh th where th.thoiGian=:thoiGian")
    ThoiGianBaoHanh searchTGByTen(Integer thoiGian);


    Page<ThoiGianBaoHanh> findAll(Pageable pageable);

    @Query(value = "select * from thoi_gian_bao_hanh where thoi_gian  =?1", nativeQuery = true)
    Page<ThoiGianBaoHanh> searchTime(Integer tenMa,Pageable pageable);


    @Query("select x from ThoiGianBaoHanh x where x.trangThai = :name")
    Page<ThoiGianBaoHanh> searchCbb(boolean name, Pageable pageable);
}
