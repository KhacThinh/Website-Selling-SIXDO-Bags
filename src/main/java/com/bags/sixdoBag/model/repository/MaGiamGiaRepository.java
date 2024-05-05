package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.model.entitys.DanhSachKhachHangApMgg;
import com.bags.sixdoBag.model.entitys.DiaChiKhachHang;
import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.entitys.MaGiamGia;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MaGiamGiaRepository extends JpaRepository<MaGiamGia, Integer> {
    @Query(value = "SELECT mgg FROM MaGiamGia mgg where mgg.trangThai = true")
    List<MaGiamGia> findMaGiamGiaByAll();

    Page<MaGiamGia> findAll(Pageable pageable);

    @Query(value = "select * from ma_giam_gia where ten_ma_giam_gia like %:tenMa% or ma_giam_gia like %:tenMa%", nativeQuery = true)
    Page<MaGiamGia> searchMGGTenOrMa(String tenMa, Pageable pageable);

    @Query("select x from MaGiamGia x where x.trangThai = :name")
    Page<MaGiamGia> searchCbb(boolean name, Pageable pageable);

    @Modifying
    @Transactional
    @Query(value = "delete from danh_sach_kh_mgg where id_ma_giam_gia=:idMaGiamGia ", nativeQuery = true)
    void deleteDanhSachKhMggByIdMgg(@Param("idMaGiamGia") int idMaGiamGia);

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO danh_sach_kh_mgg (id_khach_hang, id_ma_giam_gia) VALUES " +
            "(:idKhachHang,:idMaGiamGia)", nativeQuery = true)
    void insertKhachHangApMgg(@Param("idKhachHang") int idKhachHang, @Param("idMaGiamGia") int idMaGiamGia);


    @Query(value = "select max (ms.id) from MaGiamGia ms")
    int top1IdMaGiamGia();

    @Query(value = "with x as(select ROW_NUMBER() over (order by id desc) as rs, * from ma_gia_gia \n" +
            "where trang_thai = 1) select * from x where rs between :page and :size", nativeQuery = true)
    List<MaGiamGia> findByPageing(int page, int size);

    @Query(value = "select ms from MaGiamGia ms where ms.maGiamGia =:ma")
    MaGiamGia searchMaGiamGiaByMa(String ma);


    @Query(value = "SELECT dskm.id_khach_hang\n" +
            "FROM danh_sach_kh_mgg dskm\n" +
            "JOIN ma_giam_gia mgg ON dskm.id_ma_giam_gia = mgg.id\n" +
            "WHERE dskm.id_khach_hang = :idKhachHang \n" +
            "  AND dskm.id_ma_giam_gia = :idMaGiamGia\n" +
            "  AND mgg.so_luong > 0 \n" +
            "  AND mgg.trang_thai = 1\n" +
            "  AND GETDATE() BETWEEN mgg.ngay_bat_dau AND mgg.ngay_ket_thuc;", nativeQuery = true)
    int apDungMaGiamGia(@Param("idKhachHang") int idKhachHang, @Param("idMaGiamGia") int idMaGiamGia);

    @Query(value = "select mgg.* from ma_giam_gia as mgg " +
            "join danh_sach_kh_mgg as dskm on mgg.id = dskm.id_ma_giam_gia " +
            "where dskm.id_khach_hang = :idKhachHang AND mgg.so_luong > 0 AND mgg.trang_thai = 1 " +
            "AND GETDATE() BETWEEN mgg.ngay_bat_dau AND mgg.ngay_ket_thuc;", nativeQuery = true)
    List<MaGiamGia> danhSachMaGiamGiaByKhachHang(@Param("idKhachHang") int idKhachHang);


    @Query(value = "SELECT mgg.* \n" +
            "FROM danh_sach_kh_mgg dskm\n" +
            "JOIN ma_giam_gia mgg ON dskm.id_ma_giam_gia = mgg.id\n" +
            "WHERE dskm.id_khach_hang = :idKhachHang \n" +
            "  AND dskm.id_ma_giam_gia = :idMaGiamGia\n" +
            "  AND mgg.so_luong > 0 \n" +
            "  AND mgg.trang_thai = 1\n" +
            "  AND GETDATE() BETWEEN mgg.ngay_bat_dau AND mgg.ngay_ket_thuc;", nativeQuery = true)
    MaGiamGia getMaGiamGiaByKhachHang(@Param("idKhachHang") int idKhachHang, @Param("idMaGiamGia") int idMaGiamGia);


    @Query(value = "select danh_sach_kh_mgg.id_khach_hang from danh_sach_kh_mgg where id_ma_giam_gia=:idMaGiamGia", nativeQuery = true)
    int[] getidKhByMgg(@Param("idMaGiamGia") int idMaGiamGia);

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
