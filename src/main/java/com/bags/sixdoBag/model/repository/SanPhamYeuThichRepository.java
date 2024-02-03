package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.SanPhamYeuThich;
import com.bags.sixdoBag.model.entitys.SanPhamYeuThichID;
import com.bags.sixdoBag.model.entitys.ThoiGianBaoHanh;
import jakarta.persistence.criteria.CriteriaBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamYeuThichRepository extends JpaRepository<SanPhamYeuThich,Integer> {
    @Query(value = "SELECT dtsg FROM SanPhamYeuThich dtsg where dtsg.trangThai = 1 ")
    List<SanPhamYeuThich> findSanPhamYeuThichByAll();

    @Query(value = "select spyt from SanPhamYeuThich spyt where spyt.id.idSanPham =:idSp and spyt.id.idKhachHang =:idKh")
   public SanPhamYeuThich findSanPhamYeuThichByIdSpAndIdKh(Integer idSp, Integer idKh);
}
