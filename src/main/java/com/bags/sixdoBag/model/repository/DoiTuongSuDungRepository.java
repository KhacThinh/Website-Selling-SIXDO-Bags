package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.DoiTuongSuDung;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DoiTuongSuDungRepository extends JpaRepository<DoiTuongSuDung,Integer> {
}