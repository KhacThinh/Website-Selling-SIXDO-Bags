package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.MauSacRequest;
import com.bags.sixdoBag.model.dto.request.SanPhamRequest;
import com.bags.sixdoBag.model.entitys.MaGiamGia;
import com.bags.sixdoBag.model.entitys.MauSac;
import com.bags.sixdoBag.model.repository.MauSacRepository;
import com.bags.sixdoBag.service.*;
import com.bags.sixdoBag.service.impl.MauSacServiceImpl;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
import java.util.Objects;

@Controller
@RequestMapping("mau-sac")
@RequiredArgsConstructor
public class MauSacController {
    private final MauSacService mauSacService;
    private final MauSacRepository mauSacRepository;
    private final MauSacServiceImpl mauSacServiceImpl;


//    @GetMapping("")
//    public String getMauSac(Model model, @RequestParam(name = "name", required = false) String name) {
//        model.addAttribute("listColors", mauSacService.getMauSacs());
//        return "/quan-ly/mau-sac/view";
//    }

    @GetMapping("")
    public String getMGG(Model model, @RequestParam(name = "name", required = false) String name,
                         @RequestParam(defaultValue = "0", name = "page") int page) {
        Pageable pageable = PageRequest.of(page, 10);
        Page<MauSac> khuyenMais;

        if (name != null && !name.isEmpty()) {
            model.addAttribute("nameSearch", name);
            khuyenMais = mauSacService.searchMauSacTenOrMa(name, pageable);
        }else {
            khuyenMais = mauSacRepository.findAllCustom(pageable);
        }

        model.addAttribute("listColors", khuyenMais);
        return "/quan-ly/mau-sac/view";
    }
    @PostMapping("/add")
    public ResponseEntity<?> add(@RequestParam("maMauSac") String maMauSac,
                                 @RequestParam("tenMauSac") String tenMauSac, Model model
    ) {
        System.out.println(maMauSac);
        MauSac ms1 = mauSacRepository.searchMauSacByMa(maMauSac.trim());
        MauSac ms2 = mauSacRepository.searchMauSacByTen(tenMauSac.trim());

        if (Objects.nonNull(ms2)) {
            return ResponseEntity.ok("errorTen");
        } else if( ms1 != null) {
            return ResponseEntity.ok("errorMa");
        }else {
            MauSac mauSac = new MauSac();
            mauSac.setMaMauSac(maMauSac);
            mauSac.setTenMauSac(tenMauSac);
            mauSacService.addMauSac(mauSac);
            return ResponseEntity.ok("ok");
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

