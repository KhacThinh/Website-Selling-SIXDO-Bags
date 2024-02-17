package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.GioHang;
import com.bags.sixdoBag.model.entitys.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface GioHangRepository extends JpaRepository<GioHang, Integer> {

    Optional<GioHang> findGioHangByKhachHang(KhachHang khachHang);
}
