package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.ChiTietSanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChiTietSanPhamRepository extends JpaRepository<ChiTietSanPham, Integer> {

    @Query(value = "select ctsp from ChiTietSanPham ctsp join SanPham sp on ctsp.sanPham = sp join MauSac ms on ctsp.mauSac = ms" +
            " where ctsp.ma like %:tenMa% or sp.tenSanPham like %:tenMa% or ms.tenMauSac like %:tenMa%")
    List<ChiTietSanPham> listSearch(String tenMa);

    @Query(value = "select ctsp from ChiTietSanPham ctsp join SanPham sp on ctsp.sanPham = sp join MauSac ms on ctsp.mauSac = ms" +
            " join DoiTuongSuDung as dtsd on sp.doiTuongSuDung = dtsd where" +
            " sp.chatLieu like %:chatLieu% and" +
            " dtsd.tenDoiTuongSuDung like %:doiTuongSuDung%  and " +
            "ms.tenMauSac like %:mauSac%")
    public List<ChiTietSanPham> filterTaiQuay(String chatLieu, String mauSac, String doiTuongSuDung);


}
