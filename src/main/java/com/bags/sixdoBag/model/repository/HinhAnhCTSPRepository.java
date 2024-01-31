package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.HinhAnhCTSP;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HinhAnhCTSPRepository extends JpaRepository<HinhAnhCTSP,Integer> {
}
