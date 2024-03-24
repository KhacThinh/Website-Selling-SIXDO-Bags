package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.ChiTietSanPham;
import com.bags.sixdoBag.model.entitys.GioHang;
import com.bags.sixdoBag.model.entitys.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface GioHangRepository extends JpaRepository<GioHang, Integer> {

    Optional<GioHang> findGioHangByKhachHang(KhachHang khachHang);

    @Query(value = "select ctsp.id from GioHang ctsp where ctsp.khachHang.id=:idKhachHang")
    int getIdGioHang(int idKhachHang);
}
