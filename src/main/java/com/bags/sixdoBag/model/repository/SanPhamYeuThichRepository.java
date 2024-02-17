package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.SanPhamYeuThich;
import com.bags.sixdoBag.model.entitys.SanPhamYeuThichID;
import com.bags.sixdoBag.model.entitys.ThoiGianBaoHanh;
import jakarta.transaction.Transactional;
import jakarta.persistence.criteria.CriteriaBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface SanPhamYeuThichRepository extends JpaRepository<SanPhamYeuThich,Integer> {
    @Query(value = "SELECT dtsg FROM SanPhamYeuThich dtsg where dtsg.trangThai = 1 ")
    List<SanPhamYeuThich> findSanPhamYeuThichByAll();

//    @Modifying
//    @Transactional
//    @Query(value = "delete from SanPhamYeuThich where idSanPham = :idsanpham and idKhachHang = :idkhachhang")
//    public void deleteSanPhamYeuThich(@Param("idsanpham") Integer idsp, @Param("idkhachhang") Integer idkh);


    @Query(value = "select spyt from SanPhamYeuThich spyt where spyt.id.idSanPham =:idSp and spyt.id.idKhachHang =:idKh")
   public SanPhamYeuThich findSanPhamYeuThichByIdSpAndIdKh(Integer idSp, Integer idKh);
}
