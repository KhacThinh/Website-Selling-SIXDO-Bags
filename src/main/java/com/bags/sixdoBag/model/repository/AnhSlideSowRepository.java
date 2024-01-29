package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.AnhSlideShow;
import com.bags.sixdoBag.model.entitys.SlideShow;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface AnhSlideSowRepository extends JpaRepository<AnhSlideShow,Integer> {

}
