package com.bags.sixdoBag.model.repository;


import com.bags.sixdoBag.model.entitys.HoaDon;
import com.bags.sixdoBag.model.entitys.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon,Integer> {

    @Query(value = "select hd from HoaDon hd where hd.maHoaDon =:maHd")
     HoaDon getHoaDonByMaHoaDon(String maHd);
}
