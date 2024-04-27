package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.DiaChiKhachHang;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.entitys.MaGiamGia;
import com.bags.sixdoBag.model.entitys.NhanVien;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NhanVienRepository extends JpaRepository<NhanVien, Integer> {

    @Query(value = "SELECT sp FROM NhanVien sp")
    List<NhanVien> findNhanVienByAll();

    @Query(value = "with x as(select ROW_NUMBER() over (order by id desc) as rs, * from nhan_vien \n" +
            "where trang_thai = 1) select * from x where rs between :page and :size", nativeQuery = true)
    List<NhanVien> findByPageing(int page, int size);

//    @Query(value = "select * from nhan_vien where trang_thai = 1 and ten like %:tenMa% or ma like %:tenMa%", nativeQuery = true)
//    List<NhanVien> searchSanPhamTenOrMa(String tenMa);

    @Query( "select nv from NhanVien nv where nv.email=?1 and nv.matKhau=?2 and nv.trangThai=1")
    NhanVien findByTenEndMatKhau(String email,String matKhau);

    @Query(value = "select ms from NhanVien ms where ms.maNhanVien =:ma")
    NhanVien searchNhanVienByMa(String ma);
    ///////////////////////////////////////////////////////////
    Page<NhanVien> findAll(Pageable pageable);

    @Query(value = "select * from nhan_vien where ho_ten like %:tenMa% or sdt like %:tenMa%", nativeQuery = true)
    Page<NhanVien> searchNhanVienTenOrMa(String tenMa, Pageable pageable);


    @Query("select x from NhanVien x where x.trangThai = :name")
    Page<NhanVien> searchCbb(Integer name, Pageable pageable);

    @Query("select x from NhanVien x where x.chucVu.tenChucVu = :name1")
    Page<NhanVien> searchCbb1(String name, Pageable pageable);

    Page<NhanVien> findByChucVuId(Long chucVuId, Pageable pageable);
    ////////////////////////////////////////////////////////////

    @Query("select nv from NhanVien nv where nv.email =:email")
    NhanVien getNhanVienByEmail(String email);
    @Query("select nv from NhanVien nv where nv.sdt =:sdt")
    NhanVien getNhanVienBySDT(String sdt);
    @Query("select nv from NhanVien nv where nv.cccd =:cccd")
    NhanVien getNhanVienByCCCD(String cccd);
}
