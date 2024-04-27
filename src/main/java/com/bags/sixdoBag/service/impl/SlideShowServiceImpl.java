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
        List<SlideShow> list = slideShowRepository.findAllSlide();
        return list;
    }

    @Override
    public List<SlideShow> getSlideShowManager() {
        List<SlideShow> list = slideShowRepository.findAllSlideManager();
        return list;
    }

    @Override
    public SlideShow addSlideShow(SlideShow slideShow) {
        SlideShow slideShow1 = new SlideShow();
        slideShow1.setTextCollectionTitle(slideShow.getTextCollectionTitle());
        slideShow1.setTextNewArrivals(slideShow.getTextNewArrivals());
        slideShow1.setLinkChuyenTrang(slideShow.getLinkChuyenTrang());
        slideShow1.setUrlHinhAnh(slideShow.getUrlHinhAnh());
        slideShow1.setTrangThai(slideShow.getTrangThai());
        slideShowRepository.save(slideShow1);
        return slideShow1;
    }

    @Override
    public SlideShow edit(Integer idSlide, SlideShow slideShow) {
        SlideShow slideShow1 = getSlideShow(idSlide);
        slideShow1.setTextCollectionTitle(slideShow.getTextCollectionTitle());
        slideShow1.setTextNewArrivals(slideShow.getTextNewArrivals());
        slideShow1.setLinkChuyenTrang(slideShow.getLinkChuyenTrang());
        slideShow1.setUrlHinhAnh(slideShow.getUrlHinhAnh());
        slideShow1.setTrangThai(slideShow.getTrangThai());
        slideShowRepository.save(slideShow1);
        return slideShow1;
    }

    @Override
    public SlideShow delete(Integer idSlide) {
        SlideShow sl = getSlideShow(idSlide);
        slideShowRepository.delete(sl);
        return sl;
    }

    @Override
    public List<SlideShow> pageSlide(int limit, int size) {
        return null;
    }
}
