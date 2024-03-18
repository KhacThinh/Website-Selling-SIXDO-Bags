package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.model.entitys.DiaChiKhachHang;
import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.entitys.MaGiamGia;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MaGiamGiaRepository extends JpaRepository<MaGiamGia, Integer> {
    @Query(value = "SELECT mgg FROM MaGiamGia mgg where mgg.trangThai = true")
    List<MaGiamGia> findMaGiamGiaByAll();
    //13/3
    Page<MaGiamGia> findAll(Pageable pageable);
    @Query(value = "select * from ma_giam_gia where ten_ma_giam_gia like %:tenMa% or ma_giam_gia like %:tenMa%", nativeQuery = true)
    Page<MaGiamGia> searchMGGTenOrMa(String tenMa, Pageable pageable);
    @Query("select x from MaGiamGia x where x.trangThai = :name")
    Page<MaGiamGia> searchCbb(boolean name, Pageable pageable);
    //////



    @Query(value = "with x as(select ROW_NUMBER() over (order by id desc) as rs, * from ma_gia_gia \n" +
            "where trang_thai = 1) select * from x where rs between :page and :size", nativeQuery = true)
    List<MaGiamGia> findByPageing(int page, int size);

    @Query(value = "select ms from MaGiamGia ms where ms.maGiamGia =:ma")
    MaGiamGia searchMaGiamGiaByMa(String ma);

    @Query(value = "select ms from MaGiamGia ms where ms.tenMaGiamGia =:ten")
    MaGiamGia searchMaGiamGiaByTen(String ten);

//    @Query(value = "DECLARE @start_date datetime = :startDate;" +
//            "DECLARE @end_date datetime = :endDate;" +
//            "\n" +
//            "SELECT *\n" +
//            "FROM khuyen_mai\n" +
//            "WHERE ngay_bat_dau BETWEEN @start_date AND @end_date\n" +
//            "   OR ngay_ket_thuc BETWEEN @start_date AND @end_date\n" +
//            "   OR (@start_date BETWEEN ngay_bat_dau AND ngay_ket_thuc AND @end_date BETWEEN ngay_bat_dau AND ngay_ket_thuc) AND ", nativeQuery = true)
//    List<DiaChiKhachHang> searchDiaChiKhachHangTen(String ten,String startDate,String endDate);
}
