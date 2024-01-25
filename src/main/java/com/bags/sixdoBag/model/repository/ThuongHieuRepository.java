package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.ThuongHieu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ThuongHieuRepository extends JpaRepository<ThuongHieu, Integer> {
}
