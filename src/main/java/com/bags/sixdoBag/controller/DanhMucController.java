package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.DanhMuc;
import com.bags.sixdoBag.model.repository.DanhMucRepository;
import com.bags.sixdoBag.service.DanhMucService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("danh-muc")
public class DanhMucController {
    public final DanhMucRepository danhMucRepository;
    public final DanhMucService danhMucService;


    @GetMapping("")
    public String getMauSac(Model model, @RequestParam(name = "name", required = false) String name) {
        model.addAttribute("listColors", danhMucService.getDanhMucs());
        return "/quan-ly/danh-muc/view";
    }

    @PostMapping("/add")
    public ResponseEntity<?> add(@RequestParam("maDanhMuc") String maDanhMuc,
                                 @RequestParam("tenDanhMuc") String tenDanhMuc,
                                 @RequestParam("trangThai") boolean trangThai, Model model
    ) {
        System.out.println(maDanhMuc);
        DanhMuc cv1 = danhMucRepository.searchDanhMucByMa(maDanhMuc);
        DanhMuc cv2 = danhMucRepository.searchDanhMucByTen(tenDanhMuc);


        if (cv1 == null && cv2 == null) {
            DanhMuc danhMuc = new DanhMuc();
            danhMuc.setMaDanhMuc(maDanhMuc);
            danhMuc.setTenDanhMuc(tenDanhMuc);
            danhMuc.setTrangThai(trangThai);
            danhMucService.addDanhMuc(danhMuc);
            return ResponseEntity.ok("ok");
        } else if (cv1 != null && cv2 == null) {
            return ResponseEntity.ok("errorMa");
        } else {
            return ResponseEntity.ok("errorTen");
        }
    }

    @PostMapping("/update")
    public ResponseEntity<?> suaMauSac(@RequestParam("id") Integer id,
                                       @RequestParam("maDanhMuc") String maDanhMuc,
                                       @RequestParam("tenDanhMuc") String tenDanhMuc,
                                       @RequestParam("trangThai") boolean trangThai) {

        DanhMuc danhMuc = danhMucService.getidDanhMuc(id);

        danhMuc.setMaDanhMuc(maDanhMuc);
        danhMuc.setTenDanhMuc(tenDanhMuc);
        danhMuc.setTrangThai(trangThai);
        danhMucService.editDanhMuc(id, danhMuc);
        return ResponseEntity.ok("ok");
    }


    @PostMapping("/delete")
    public ResponseEntity<?> xoaChucVu(@RequestParam("idDanhMuc") Integer id) {
        return ResponseEntity.ok(danhMucService.deleteDanhMuc(id));
    }
}
