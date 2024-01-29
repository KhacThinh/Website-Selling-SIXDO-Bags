package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.SlideShow;
import com.bags.sixdoBag.model.entitys.ThuongHieu;
import com.bags.sixdoBag.service.SlideShowService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/slide_show")
public class SlideShowController {
    public final SlideShowService slideShowService;
    @GetMapping("")
    public ResponseEntity<?> getAll() {
        return ResponseEntity.ok(slideShowService.getListSlideShow());
    }

    @PostMapping("")
    public ResponseEntity<?> add(@RequestBody @Valid SlideShow slideShow) {
        return ResponseEntity.ok(slideShowService.addSlideShow(slideShow));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> edit(@RequestBody @Valid SlideShow slideShow, @PathVariable Integer id) {
        return ResponseEntity.ok(slideShowService.edit(id,slideShow));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable Integer id) {
        return ResponseEntity.ok(slideShowService.delete(id));
    }

}
