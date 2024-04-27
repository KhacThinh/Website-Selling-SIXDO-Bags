package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KhachHangRepository extends JpaRepository<KhachHang,Integer> {

    @Query( "SELECT sp FROM KhachHang sp where  sp.email=?1 and sp.matKhau=?2 and sp.trangThai=1")
    KhachHang findByTenEndMatKhau(String email,String matKhau);


    @Query(value = "SELECT sp FROM KhachHang sp where sp.trangThai = 1")
    List<KhachHang> findKhachHangByAll();
    @Query(value = "select kh from KhachHang kh where kh.email =:email ")
    KhachHang searchKh(String email);
    @Query(value = "select ms from KhachHang ms where ms.maKhachHang =:ma")
    KhachHang searchKhachHangByMa(String ma);
    @Query(value = "select ms from KhachHang ms where ms.tenKhachHang =:ten")
    KhachHang searchKhachHangByTen(String ten);
    @Query(value = "select kh from KhachHang kh where kh.sdt =:sdt")
    KhachHang searchBySdt(String sdt);
//    @Query(value = "select ms from KhachHang ms where ms.sdt =:sdt")
//    KhachHang searchKhBySdt(String Sdt);
//
//    @Query(value = "select ms from KhachHang ms where ms.email =:email")
//    KhachHang searchKhByGM(String gmail);

    ///////////////////////////////////////////////////////////
    Page<KhachHang> findAll(Pageable pageable);

    @Query(value = "select * from khach_hang where ten_khach_hang like %:tenMa% or sdt like %:tenMa%", nativeQuery = true)
    Page<KhachHang> searchKhachHangTenOrMa(String tenMa, Pageable pageable);


    @Query("select x from KhachHang x where x.trangThai = :name")
    Page<KhachHang> searchCbb(Integer name, Pageable pageable);


    @Query("select kh from KhachHang kh where kh.email =:email")
    KhachHang getKhachHangByEmail(String email);
    @Query("select kh from KhachHang kh where kh.sdt =:sdt")
    KhachHang getKhachHangBySDT(String sdt);
    ////////////////////////////////////////////////////////////
}
