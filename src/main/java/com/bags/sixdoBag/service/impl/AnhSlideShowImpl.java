package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.dto.request.AnhSlideShowRequest;
import com.bags.sixdoBag.model.entitys.AnhSlideShow;
import com.bags.sixdoBag.model.repository.AnhSlideShowRepository;
import com.bags.sixdoBag.service.AnhSlideShowService;
import com.bags.sixdoBag.service.SlideShowService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor

public class AnhSlideShowImpl implements AnhSlideShowService {
    public final AnhSlideShowRepository anhSlideShowRepository;
    public final SlideShowService slideShowService;
    @Override
    public AnhSlideShow getAnhSlideShow(Integer idAnhSlideShow) {
        AnhSlideShow anhSlideShow = anhSlideShowRepository.findById(idAnhSlideShow)
                .orElseThrow(()->new IllegalArgumentException("Ảnh SlideShow không tồn tại Id này" + idAnhSlideShow));
        return anhSlideShow;
    }

    @Override
    public List<AnhSlideShow> getListAnhSlideShow() {
        List<AnhSlideShow>listAnhSlideShow= anhSlideShowRepository.findAll();
        return listAnhSlideShow;
    }

    @Override
    public AnhSlideShow addAnhSlideShow(AnhSlideShowRequest slideShow) {
        AnhSlideShow anhSlideShow= new AnhSlideShow();

        anhSlideShow.setUrlAnh(slideShow.getUrlAnh());
        anhSlideShow.setLinkAnhSlideShow(slideShow.getLinkAnhSlideShow());
        Integer idSlideShow = slideShow.getIdSlideShow();
        Optional.ofNullable(slideShowService.getSlideShow(idSlideShow)).ifPresent(anhSlideShow::setSlideShow);

        return anhSlideShowRepository.save(anhSlideShow);
    }

    @Override
    public AnhSlideShow edit(Integer idSlide, AnhSlideShowRequest slideShow) {
        AnhSlideShow anhSlideShow = getAnhSlideShow(idSlide);
        anhSlideShow.setUrlAnh(slideShow.getUrlAnh());
        anhSlideShow.setLinkAnhSlideShow(slideShow.getLinkAnhSlideShow());
        Integer idSlideShow = slideShow.getIdSlideShow();
        Optional.ofNullable(slideShowService.getSlideShow(idSlideShow)).ifPresent(anhSlideShow::setSlideShow);

        return anhSlideShowRepository.save(anhSlideShow);
    }

    @Override
    public AnhSlideShow delete(Integer idSlide) {
        AnhSlideShow anhSlideShow = getAnhSlideShow(idSlide);
        anhSlideShowRepository.delete(anhSlideShow);
        return anhSlideShow ;
    }

    @Override
    public List<AnhSlideShow> pageSlide(int limit, int size) {
        return null;
    }
}
