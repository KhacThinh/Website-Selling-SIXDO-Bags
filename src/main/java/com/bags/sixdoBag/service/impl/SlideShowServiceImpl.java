package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.SlideShow;
import com.bags.sixdoBag.model.repository.SlideShowRepository;
import com.bags.sixdoBag.service.SlideShowService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@RequiredArgsConstructor
public class SlideShowServiceImpl implements SlideShowService {
    public final SlideShowRepository slideShowRepository;
    @Override
    public SlideShow getSlideShow(Integer idSlideShow) {
        SlideShow slideShow = slideShowRepository.findById(idSlideShow).orElse(null);
        return slideShow;
    }

    @Override
    public List<SlideShow> getListSlideShow() {
        List<SlideShow>list= slideShowRepository.findAllSlide();
        return list;
    }

    @Override
    public SlideShow addSlideShow(SlideShow slideShow) {
        SlideShow slideShow1 = new SlideShow();
        slideShow1.setTenSlideShow(slideShow.getTenSlideShow());
        slideShow1.setTrangThai(true);
        slideShowRepository.save(slideShow1);
        return slideShow1;
    }

    @Override
    public SlideShow edit(Integer idSlide, SlideShow slideShow) {
        SlideShow sl = getSlideShow(idSlide);
        sl.setTenSlideShow(slideShow.getTenSlideShow());
        slideShowRepository.save(sl);
        return sl;
    }

    @Override
    public SlideShow delete(Integer idSlide) {
        SlideShow sl= getSlideShow(idSlide);
        sl.setTrangThai(false);
        slideShowRepository.save(sl);
        return sl;
    }

    @Override
    public List<SlideShow> pageSlide(int limit, int size) {
        return null;
    }
}
