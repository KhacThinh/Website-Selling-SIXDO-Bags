package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.entitys.MauSac;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MauSacRepository extends JpaRepository<MauSac, Integer> {

    @Query(value = "SELECT dtsg FROM MauSac dtsg")
    List<MauSac> findMauSacByAll();

    @Query(value = "with x as(select ROW_NUMBER() over (order by id desc) as rs, * from mau_sac \n" +
            ") select * from x where rs between :page and :size", nativeQuery = true)
    List<MauSac> findByPageing(int page, int size);



    @Query(value = "SELECT COUNT(ms) FROM MauSac ms WHERE ms.maMauSac like : maMauSac")
    boolean isMaMauSacExists(String maMauSac); // Thêm phương thức kiểm tra tồn tại

    @Query(value = "select ms from MauSac ms where ms.maMauSac =:ma")
    MauSac searchMauSacByMa(String ma);

    @Query(value = "select ms from MauSac ms where ms.tenMauSac =:ten")
    MauSac searchMauSacByTen(String ten);



    /////////////////////////////////////////////////////
    Page<MauSac> findAll(Pageable pageable);

    @Query(value = "select * from mau_sac where ten like %:tenMa% or ma like %:tenMa%", nativeQuery = true)
    Page<MauSac> searchMauSacTenOrMa(String tenMa,Pageable pageable);

    ///////////////////////////////////////////////
}
