package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.SlideShow;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AnhSlideShow {
    public AnhSlideShow getAnhSlideShow(Integer idAnhSlideShow);

    public List<AnhSlideShow> getListAnhSlideShow();

    public AnhSlideShow addAnhSlideShow(AnhSlideShow slideShow);

    public AnhSlideShow edit(Integer idSlide,AnhSlideShow slideShow);

    public AnhSlideShow delete(Integer idSlide);

    public List<AnhSlideShow>pageSlide(int limit, int size);
}
