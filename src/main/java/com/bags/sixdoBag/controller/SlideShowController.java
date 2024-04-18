package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.SlideShow;
import com.bags.sixdoBag.service.SlideShowService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("slide-show")
@RequiredArgsConstructor
public class SlideShowController {

    private final SlideShowService slideShowService;

    @GetMapping("")
    @ResponseBody
    public List<SlideShow> getSlideShow() {
        return slideShowService.getListSlideShow();
    }

    @PostMapping("")
    @ResponseBody
    public SlideShow addSlideShow(@RequestBody SlideShow slideShow) {
        return slideShowService.addSlideShow(slideShow);
    }


    @PutMapping("/{id}")
    @ResponseBody
    public SlideShow editSlideShow(@PathVariable int id, @RequestBody SlideShow slideShow) {
        return slideShowService.edit(id, slideShow);
    }

    @DeleteMapping("/{id}")
    @ResponseBody
    public SlideShow deleteSlideShow(@PathVariable int id) {
        return slideShowService.delete(id);
    }

}
