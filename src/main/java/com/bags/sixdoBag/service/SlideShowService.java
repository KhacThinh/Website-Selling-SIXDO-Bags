package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.SlideShow;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface SlideShowService {
    public SlideShow getSlideShow(Integer idSlideShow);

    public List<SlideShow> getListSlideShow();

    public List<SlideShow> getSlideShowManager();

    public SlideShow addSlideShow(SlideShow slideShow);

    public SlideShow edit(Integer idSlide, SlideShow slideShow);

    public SlideShow delete(Integer idSlide);

    public List<SlideShow> pageSlide(int limit, int size);

}
