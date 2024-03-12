package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.MauSacRequest;
import com.bags.sixdoBag.model.dto.request.SanPhamRequest;
import com.bags.sixdoBag.model.entitys.MauSac;
import com.bags.sixdoBag.model.repository.MauSacRepository;
import com.bags.sixdoBag.service.*;
import com.bags.sixdoBag.service.impl.MauSacServiceImpl;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("mau-sac")
@RequiredArgsConstructor
public class MauSacController {
    private final MauSacService mauSacService;
    private final MauSacRepository mauSacRepository;
    private final MauSacServiceImpl mauSacServiceImpl;


    @GetMapping("")
    public String getMauSac(Model model, @RequestParam(name = "name", required = false) String name) {
        model.addAttribute("listColors", mauSacService.getMauSacs());
        return "/quan-ly/mau-sac/view";
    }
    @PostMapping("/add")
    public ResponseEntity<?> add(@RequestParam("maMauSac") String maMauSac,
                                 @RequestParam("tenMauSac") String tenMauSac, Model model
     ) {
        System.out.println(maMauSac);
        MauSac ms1 = mauSacRepository.searchMauSacByMa(maMauSac);
        MauSac ms2 = mauSacRepository.searchMauSacByTen(tenMauSac);
        System.out.println(ms1);
        System.out.println(ms2);
        if(ms1 ==null && ms2 ==null) {
            MauSac mauSac = new MauSac();
            mauSac.setMaMauSac(maMauSac);
            mauSac.setTenMauSac(tenMauSac);
            mauSacService.addMauSac(mauSac);
            return ResponseEntity.ok("ok");
        }
       else if (ms1 != null && ms2 == null) {
            return ResponseEntity.ok("errorMa");
        } else {
            return ResponseEntity.ok("errorTen");
        }
    }

    @PostMapping("/update")
    public ResponseEntity<?> suaMauSac(@RequestParam("id") Integer id,
                                           @RequestParam("maMauSac") String maMauSac,
                                           @RequestParam("tenMauSac") String tenMauSac) {
        System.out.println(maMauSac    );
        System.out.println(tenMauSac);
        MauSac mauSac = mauSacService.getidMauSac(id);
        System.out.println(maMauSac);
        mauSac.setMaMauSac(maMauSac);
        mauSac.setTenMauSac(tenMauSac);

        mauSacService.editMauSac(id, mauSac);
        return ResponseEntity.ok("ok");
    }
    @PostMapping("/delete")
    public ResponseEntity<?> xoaDiaChiKh(@RequestParam("idMauSac") Integer id) {
        return ResponseEntity.ok(mauSacService.deleteMauSac(id));
    }
}

