package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.CuaHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CuaHangRepository extends JpaRepository<CuaHang, Long> {
}
