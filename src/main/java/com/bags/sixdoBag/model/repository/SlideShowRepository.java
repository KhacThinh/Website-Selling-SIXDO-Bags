package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.entitys.SlideShow;
import com.bags.sixdoBag.model.entitys.ThoiGianBaoHanh;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface SlideShowRepository extends JpaRepository<SlideShow,Integer> {
    @Query("select cv from SlideShow cv where cv.trangThai =true ")
    List<SlideShow> findAllSlide();

    @Query(value = "with x as(select ROW_NUMBER() over (order by id desc) as rs, * from slide_show \n" +
            "where trang_thai = 1) select * from x where rs between :page and :size", nativeQuery = true)
    public List<SlideShow> findByPageing(int page, int size);
}
