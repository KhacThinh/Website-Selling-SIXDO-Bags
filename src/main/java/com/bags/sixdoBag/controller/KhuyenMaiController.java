package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.DoiTuongSuDung;
import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.repository.KhuyenMaiRepository;
import com.bags.sixdoBag.service.DoiTuongSuDungService;
import com.bags.sixdoBag.service.KhuyenMaiService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("khuyen-mai")
@RequiredArgsConstructor
public class KhuyenMaiController {
    private final KhuyenMaiService khuyenMaiService;


    private final KhuyenMaiRepository khuyenMaiRepository;
    @GetMapping("")
    public String getKhuyenMai(Model model, @RequestParam(name = "name", required = false) String name) {
        model.addAttribute("KM", new KhuyenMai());
        model.addAttribute("listKhuyenMai", khuyenMaiService.getKhuyenMais());
        return "/quan-ly/khuyen-mai-view/view";
    }

    @PostMapping("")
    public String add(@Valid @ModelAttribute("KM") KhuyenMai khuyenMaiRequest , BindingResult bindingResult, Model model) {
//        if (bindingResult.hasErrors()) {
//            System.out.println("Lỗi");
//        }
        khuyenMaiService.addKhuyenMai(khuyenMaiRequest);
        model.addAttribute("KM", new KhuyenMai());
        model.addAttribute("listKhuyenMai", khuyenMaiService.getKhuyenMais());
        return "redirect:/khuyenMai";
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") KhuyenMai khuyenMai)
    {
        this.khuyenMaiService.deleteKhuyenMai(khuyenMai.getId());
//        return "redirect:/thuong-hieu/view";
        return "redirect:/khuyenMai";

    }
}
