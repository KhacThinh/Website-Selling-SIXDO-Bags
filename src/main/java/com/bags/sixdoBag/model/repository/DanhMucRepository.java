package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.DanhMuc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DanhMucRepository extends JpaRepository<DanhMuc,Integer> {
}
