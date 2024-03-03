package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.DoiTuongSuDung;
import com.bags.sixdoBag.service.DoiTuongSuDungService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("doi-tuong-su-dung")
public class DoiTuongSuDungController {

    private final DoiTuongSuDungService doiTuongSuDungService;

    private final DoiTuongSuDungService thuongHieuRepository;
//    private ThuongHieuRequest rq = new ThuongHieuRequest();

    @GetMapping("")
    public String getDoiTuong(Model model, @RequestParam(name = "name", required = false) String name) {
        model.addAttribute("DT", new DoiTuongSuDung());
        model.addAttribute("listDoiTuong", doiTuongSuDungService.getListDoiTuongSuDung());
        return "/quan-ly/doi-tuong-su-dung/view";
    }

    @PostMapping("")
    public String add(@Valid @ModelAttribute("DT") DoiTuongSuDung doiTuongRequest , BindingResult bindingResult, Model model) {
//        if (bindingResult.hasErrors()) {
//            System.out.println("Lỗi");
//        }
        doiTuongSuDungService.addDoiTuongSuDung(doiTuongRequest);
        model.addAttribute("DT", new DoiTuongSuDung());
        model.addAttribute("listDoiTuong", doiTuongSuDungService.getListDoiTuongSuDung());
        return "redirect:/doi-tuong-su-dung";
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") DoiTuongSuDung doiTuongSuDung)
    {
        this.doiTuongSuDungService.deleteDoiTuongSuDung(doiTuongSuDung.getId());
//        return "redirect:/thuong-hieu/view";
        return "redirect:/doi-tuong-su-dung";

    }
}
