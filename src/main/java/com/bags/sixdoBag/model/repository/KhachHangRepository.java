package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.entitys.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KhachHangRepository extends JpaRepository<KhachHang,Integer> {
    @Query(value = "SELECT sp FROM KhachHang sp where sp.trangThai = 1")
    List<KhachHang> findKhachHangByAll();
    @Query(value = "select kh from KhachHang kh where kh.email =:email ")
    KhachHang searchKh(String email);
    @Query(value = "select kh from KhachHang kh where kh.sdt =:sdt")
    KhachHang searchBySdt(String sdt);
}
