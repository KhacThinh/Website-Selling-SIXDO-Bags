package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.ThoiGianBaoHanh;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ThoiGianBaoHanhRepository extends JpaRepository<ThoiGianBaoHanh, Integer> {
}
