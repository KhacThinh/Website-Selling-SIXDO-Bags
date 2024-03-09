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

import com.bags.sixdoBag.model.entitys.DanhMuc;
import com.bags.sixdoBag.model.entitys.DoiTuongSuDung;
import com.bags.sixdoBag.model.repository.DoiTuongSuDungRepository;
import com.bags.sixdoBag.service.DoiTuongSuDungService;
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
@RequestMapping("/doi-tuong-su-dung")
public class DoiTuongSuDungController {
    public final DoiTuongSuDungService doiTuongSuDungService;
    public final DoiTuongSuDungRepository doiTuongSuDungRepository;

    @GetMapping("")
    public String getDoiTuongSuDung(Model model, @RequestParam(name = "name", required = false) String name) {
        model.addAttribute("listDoiTuongSuDung", doiTuongSuDungService.getListDoiTuongSuDung());
        return "/quan-ly/doi-tuong-su-dung/view";
    }

    @PostMapping("/add")
    public ResponseEntity<?> add(@RequestParam("maDoiTuongSuDung") String maDoiTuongSuDung,
                                 @RequestParam("tenDoiTuongSuDung") String tenDoiTuongSuDung,
                                 @RequestParam("trangThai") boolean trangThai, Model model
    ) {
        System.out.println(maDoiTuongSuDung);
        DoiTuongSuDung dt1 = doiTuongSuDungRepository.searchDoiTuongSuDungByMa(maDoiTuongSuDung);
        DoiTuongSuDung dt2 = doiTuongSuDungRepository.searchDoiTuongSuDungByTen(tenDoiTuongSuDung);
        System.out.println(dt1);
        System.out.println(dt2);
        System.out.println(trangThai);

        if (dt1 == null && dt2 == null) {
            DoiTuongSuDung doiTuongSuDung = new DoiTuongSuDung();
            doiTuongSuDung.setMaDoiTuongSuDung(maDoiTuongSuDung);
            doiTuongSuDung.setTenDoiTuongSuDung(tenDoiTuongSuDung);
            doiTuongSuDung.setTrangThai(trangThai);
            doiTuongSuDungService.addDoiTuongSuDung(doiTuongSuDung);
            return ResponseEntity.ok("ok");
        } else if (dt1 != null && dt2 == null) {
            return ResponseEntity.ok("errorMa");
        } else {
            return ResponseEntity.ok("errorTen");
        }
    }
    @PostMapping("/update")
    public ResponseEntity<?> suaDoiTuongSuDung(@RequestParam("id") Integer id,
                                               @RequestParam("maDoiTuongSuDung") String maDoiTuongSuDung,
                                               @RequestParam("tenDoiTuongSuDung") String tenDoiTuongSuDung,
                                               @RequestParam("trangThai") boolean trangThai) {


        DoiTuongSuDung doiTuongSuDung = doiTuongSuDungService.getDoiTuongSuDung(id);

        System.out.println(maDoiTuongSuDung);
        doiTuongSuDung.setMaDoiTuongSuDung(maDoiTuongSuDung);
        doiTuongSuDung.setTenDoiTuongSuDung(tenDoiTuongSuDung);
        doiTuongSuDung.setTrangThai(trangThai);
        System.out.println(maDoiTuongSuDung);
        System.out.println(tenDoiTuongSuDung);
        System.out.println(doiTuongSuDung);
        doiTuongSuDungService.editDoiTuongSuDung(id, doiTuongSuDung);

        return ResponseEntity.ok("ok");
    }

    @PostMapping("/xoa-doi-tuong-su-dung")
    public ResponseEntity<?> xoaDoiTuongSuDung(@RequestBody Map<String, Object> requestBody) {
        Integer idDoiTuongSuDung = (Integer) requestBody.get("idDoiTuongSuDung");
        doiTuongSuDungService.deleteDoiTuongSuDung(idDoiTuongSuDung);
        List<DoiTuongSuDung> danhSachDoiTuongSuDung = doiTuongSuDungService.getListDoiTuongSuDung();
        return ResponseEntity.ok(danhSachDoiTuongSuDung);
    }
}