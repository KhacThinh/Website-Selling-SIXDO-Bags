package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.ThuongHieuRequest;
import com.bags.sixdoBag.model.entitys.ThuongHieu;
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
@RequestMapping("thuong-hieu")
@RequiredArgsConstructor
public class ThuongHieuController {
    private final ThuongHieuService thuongHieuService;
    private final ThuongHieuRepository thuongHieuRepository;
    private final ThuongHieuRequest request = new ThuongHieuRequest();
//    private ThuongHieuRequest rq = new ThuongHieuRequest();

    @GetMapping("")
    public String getThuongHieu(Model model, @RequestParam(name = "name", required = false) String name) {
        model.addAttribute("TH", new ThuongHieu());
        model.addAttribute("listThuongHieu", thuongHieuService.getThuongHieus());
        return "/quan-ly/thuong-hieu/view";
    }

    @PostMapping("")
    public String add(@Valid @ModelAttribute("TH") ThuongHieu thuongHieuRequest , BindingResult bindingResult, Model model) {
//        if (bindingResult.hasErrors()) {
//            System.out.println("Lỗi");
//        }
        thuongHieuService.addThuongHieu(thuongHieuRequest);
        model.addAttribute("TH", new ThuongHieu());
        model.addAttribute("listThuongHieu", thuongHieuService.getThuongHieus());
        return "redirect:/thuong-hieu";
    }
//    @GetMapping("")
//    public String edit(
//            @PathVariable("id") ThuongHieu thuongHieu,
//            Model model
//    ) {
//        request.loadFromEntityTH(thuongHieu);
//        model.addAttribute("th", request);
//        model.addAttribute("action", "/thuong-hieu/update/" + thuongHieu.getId());
//        return "quan-ly/thuong-hieu/them-thuong-hieu-modal";
//    }


    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") ThuongHieu thuongHieu)
    {
        this.thuongHieuService.deleteThuongHieu(thuongHieu.getId());
//        return "redirect:/thuong-hieu/view";
        return "redirect:/thuong-hieu";

    }

}