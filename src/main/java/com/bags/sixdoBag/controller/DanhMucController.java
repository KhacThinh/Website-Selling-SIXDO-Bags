//package com.bags.sixdoBag.controller;
//
//import com.bags.sixdoBag.model.entitys.DanhMuc;
//import com.bags.sixdoBag.model.entitys.ThuongHieu;
//import com.bags.sixdoBag.model.repository.DanhMucRepository;
//import com.bags.sixdoBag.model.repository.ThuongHieuRepository;
//import com.bags.sixdoBag.service.*;
//import jakarta.validation.Valid;
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.multipart.MultipartFile;
//
//import java.io.BufferedOutputStream;
//import java.io.File;
//import java.io.FileOutputStream;
//import java.io.IOException;
//
//@Controller
//@RequestMapping("danh-muc")
//@RequiredArgsConstructor
//public class DanhMucController {
//    private final DanhMucService danhMucService;
//    private final DanhMucRepository danhMucRepository;
////    private ThuongHieuRequest rq = new ThuongHieuRequest();
//
//    @GetMapping("")
//    public String getDanhMuc(Model model, @RequestParam(name = "name", required = false) String name) {
//        model.addAttribute("DM", new DanhMuc());
//        model.addAttribute("listDanhMuc", danhMucService.getDanhMucs());
//        return "/quan-ly/danh-muc/view";
//    }
//
//    @PostMapping("")
//    public String add(@Valid @ModelAttribute("DM") DanhMuc danhMucRequest , BindingResult bindingResult, Model model) {
////        if (bindingResult.hasErrors()) {
////            System.out.println("Lỗi");
////        }
//        danhMucService.addDanhMuc(danhMucRequest);
//        model.addAttribute("DM", new DanhMuc());
//        model.addAttribute("listDanhMuc", danhMucService.getDanhMucs());
//        return "redirect:/danh-muc";
//    }
//
//    @GetMapping("delete/{id}")
//    public String delete(@PathVariable("id") DanhMuc danhMuc)
//    {
//        this.danhMucService.deleteDanhMuc(danhMuc.getId());
////        return "redirect:/thuong-hieu/view";
//        return "redirect:/danh-muc";
//
//    }
//
//}

package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.model.entitys.DanhMuc;
import com.bags.sixdoBag.model.entitys.ThuongHieu;
import com.bags.sixdoBag.model.repository.DanhMucRepository;
import com.bags.sixdoBag.service.DanhMucService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/danh-muc")
public class DanhMucController {
    public final DanhMucRepository danhMucRepository;
    public final DanhMucService danhMucService;

    @GetMapping("")
    public String getDanhMuc(Model model, @RequestParam(name = "name", required = false) String name) {
        model.addAttribute("listDanhMuc", danhMucService.getDanhMucs());
        return "/quan-ly/danh-muc/view";
    }

    @PostMapping("/add")
    public ResponseEntity<?> add(@RequestParam("ma") String ma,
                                 @RequestParam("ten") String ten,
                                 @RequestParam("trangThai") boolean trangThai, Model model
    ) {
        System.out.println(ma);
        DanhMuc dm1 = danhMucRepository.searchDanhMucByMa(ma);
        DanhMuc dm2 = danhMucRepository.searchDanhMucByTen(ten);
        System.out.println(dm1);
        System.out.println(dm2);
        System.out.println(trangThai);

        if (dm1 == null && dm2 == null) {
            DanhMuc danhMuc = new DanhMuc();
            danhMuc.setMa(ma);
            danhMuc.setTen(ten);
            danhMuc.setTrangThai(trangThai);
            danhMucService.addDanhMuc(danhMuc);
            return ResponseEntity.ok("ok");
        } else if (dm1 != null && dm2 == null) {
            return ResponseEntity.ok("errorMa");
        } else {
            return ResponseEntity.ok("errorTen");
        }
    }

    @PostMapping("/update")
    public ResponseEntity<?> suaThuongHieu(@RequestParam("id") Integer id,
                                           @RequestParam("ma") String ma,
                                           @RequestParam("ten") String ten,
                                           @RequestParam("trangThai") boolean trangThai) {
        System.out.println(ma);
        System.out.println(ten);

        DanhMuc danhMuc = danhMucService.getDanhMuc(id);
        System.out.println(danhMuc);

        danhMuc.setMa(ma);
        danhMuc.setTen(ten);
        danhMuc.setTrangThai(trangThai);

        danhMucService.editDanhMuc(id, danhMuc);

        return ResponseEntity.ok("ok");
    }


    @PostMapping("/xoa-danh-muc")
    public ResponseEntity<?> xoaDanhMuc(@RequestBody Map<String, Object> requestBody) {
        Integer idDanhMuc = (Integer) requestBody.get("idDanhMuc");
        danhMucService.deleteDanhMuc(idDanhMuc);
        List<DanhMuc> danhSachDanhMuc = danhMucService.getDanhMucs();
        return ResponseEntity.ok(danhSachDanhMuc);
    }
}