package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.model.entitys.DoiTuongSuDung;
import com.bags.sixdoBag.model.repository.DoiTuongSuDungRepository;
import com.bags.sixdoBag.service.DoiTuongSuDungService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("doi-tuong-su-dung")
public class DoiTuongSuDungController {

    private final DoiTuongSuDungService doiTuongSuDungService;
    private final DoiTuongSuDungRepository doiTuongSuDungRepository;

    @GetMapping("")
    public String getMauSac(Model model, @RequestParam(name = "name", required = false) String name) {
        model.addAttribute("listColors", doiTuongSuDungService.getListDoiTuongSuDung());
        return "/quan-ly/doi-tuong-su-dung/view";
    }

    @PostMapping("/add")
    public ResponseEntity<?> add(@RequestParam("maDoiTuongSuDung") String maDoiTuongSuDung,
                                 @RequestParam("tenDoiTuongSuDung") String tenDoiTuongSuDung,
                                 @RequestParam("trangThai") boolean trangThai, Model model
    ) {

        DoiTuongSuDung cv1 = doiTuongSuDungRepository.searchDoiTuongSuDungByMa(maDoiTuongSuDung);


        if (cv1 == null) {
            DoiTuongSuDung doiTuongSuDung = new DoiTuongSuDung();
            doiTuongSuDung.setMaDoiTuongSuDung(maDoiTuongSuDung);
            doiTuongSuDung.setTenDoiTuongSuDung(tenDoiTuongSuDung);
            doiTuongSuDung.setTrangThai(trangThai);
            doiTuongSuDungService.addDoiTuongSuDung(doiTuongSuDung);
            return ResponseEntity.ok("ok");
        } else  {
            return ResponseEntity.ok("errorMa");
        }
    }

    @PostMapping("/update")
    public ResponseEntity<?> suaMauSac(@RequestParam("id") Integer id,
                                       @RequestParam("maDoiTuongSuDung") String maDoiTuongSuDung,
                                       @RequestParam("tenDoiTuongSuDung") String tenDoiTuongSuDung,
                                       @RequestParam("trangThai") boolean trangThai) {

        DoiTuongSuDung doiTuongSuDung = doiTuongSuDungService.getDoiTuongSuDung(id);

        doiTuongSuDung.setMaDoiTuongSuDung(maDoiTuongSuDung);
        doiTuongSuDung.setTenDoiTuongSuDung(tenDoiTuongSuDung);
        doiTuongSuDung.setTrangThai(trangThai);
        doiTuongSuDungService.editDoiTuongSuDung(id, doiTuongSuDung);
        return ResponseEntity.ok("ok");
    }


    @PostMapping("/delete")
    public ResponseEntity<?> xoaChucVu(@RequestParam("idDTSD") Integer id) {
        return ResponseEntity.ok(doiTuongSuDungService.deleteDoiTuongSuDung(id));
    }
}
