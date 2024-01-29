package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.AnhSlideShowRequest;
import com.bags.sixdoBag.model.entitys.AnhSlideShow;
import com.bags.sixdoBag.model.entitys.SlideShow;
import com.bags.sixdoBag.service.AnhSlideShowService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/anh_slide_show")
public class AnhSlideShowController {
    public final AnhSlideShowService anhSlideShowService;

    @GetMapping("")
    public ResponseEntity<?> getAll() {
        return ResponseEntity.ok(anhSlideShowService.getListAnhSlideShow());
    }

    @PostMapping("")
    public ResponseEntity<?> add(@RequestBody @Valid AnhSlideShowRequest slideShow) {
        return ResponseEntity.ok(anhSlideShowService.addAnhSlideShow(slideShow));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> edit(@RequestBody @Valid AnhSlideShowRequest slideShow, @PathVariable Integer id) {
        return ResponseEntity.ok(anhSlideShowService.edit(id,slideShow));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable Integer id) {
        return ResponseEntity.ok(anhSlideShowService.delete(id));
    }
}
