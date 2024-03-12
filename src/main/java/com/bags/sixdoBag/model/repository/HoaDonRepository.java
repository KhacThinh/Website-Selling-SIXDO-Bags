package com.bags.sixdoBag.model.repository;


import com.bags.sixdoBag.model.entitys.HoaDon;
import com.bags.sixdoBag.model.entitys.KhachHang;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
@Transactional
@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon,Integer> {

    @Query(value = "select hd from HoaDon hd where hd.maHoaDon =:maHd")
     HoaDon getHoaDonByMaHoaDon(String maHd);

    @Modifying
    @Query(value = "update HoaDon hd  set  hd.trangThai =:trangThai where hd.maHoaDon=:maHd")
    void  setTrangThaiDonHang(int trangThai,String maHd);
}
