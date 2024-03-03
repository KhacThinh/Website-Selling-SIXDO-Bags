package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.DanhMuc;
import com.bags.sixdoBag.model.entitys.ThuongHieu;
import com.bags.sixdoBag.model.repository.DanhMucRepository;
import com.bags.sixdoBag.model.repository.ThuongHieuRepository;
import com.bags.sixdoBag.service.*;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Controller
@RequestMapping("danh-muc")
@RequiredArgsConstructor
public class DanhMucController {
    private final DanhMucService danhMucService;
    private final DanhMucRepository danhMucRepository;
//    private ThuongHieuRequest rq = new ThuongHieuRequest();

    @GetMapping("")
    public String getDanhMuc(Model model, @RequestParam(name = "name", required = false) String name) {
        model.addAttribute("DM", new DanhMuc());
        model.addAttribute("listDanhMuc", danhMucService.getDanhMucs());
        return "/quan-ly/danh-muc/view";
    }

    @PostMapping("")
    public String add(@Valid @ModelAttribute("DM") DanhMuc danhMucRequest , BindingResult bindingResult, Model model) {
//        if (bindingResult.hasErrors()) {
//            System.out.println("Lỗi");
//        }
        danhMucService.addDanhMuc(danhMucRequest);
        model.addAttribute("DM", new DanhMuc());
        model.addAttribute("listDanhMuc", danhMucService.getDanhMucs());
        return "redirect:/danh-muc";
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") DanhMuc danhMuc)
    {
        this.danhMucService.deleteDanhMuc(danhMuc.getId());
//        return "redirect:/thuong-hieu/view";
        return "redirect:/danh-muc";

    }

}