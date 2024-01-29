package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.dto.request.AnhSlideShowRequest;
import com.bags.sixdoBag.model.entitys.AnhSlideShow;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AnhSlideShowService {
    public AnhSlideShow getAnhSlideShow(Integer idAnhSlideShow);

    public List< AnhSlideShow> getListAnhSlideShow();

    public  AnhSlideShow addAnhSlideShow(AnhSlideShowRequest slideShow);

    public  AnhSlideShow edit(Integer idSlide, AnhSlideShowRequest slideShow);

    public  AnhSlideShow delete(Integer idSlide);

    public List< AnhSlideShow>pageSlide(int limit, int size);
}
