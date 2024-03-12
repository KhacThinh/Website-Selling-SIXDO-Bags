package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.model.repository.ChucVuRepository;
import com.bags.sixdoBag.service.ChucVuService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/chuc-vu")
public class ChucVuController {
    public final ChucVuService chucVuService;
    public final ChucVuRepository chucVuRepository;


    @GetMapping("")
    public String getMauSac(Model model, @RequestParam(name = "name", required = false) String name) {
        model.addAttribute("listColors", chucVuService.getListChucVu());
        return "/quan-ly/chuc-vu/view";
    }

    @PostMapping("/add")
    public ResponseEntity<?> add(@RequestParam("maChucVu") String maChucVu,
                                 @RequestParam("tenChucVu") String tenChucVu,
                                 @RequestParam("trangThai") boolean trangThai, Model model
    ) {
        System.out.println(maChucVu);
        ChucVu cv1 = chucVuRepository.searchChucVuByMa(maChucVu);
        ChucVu cv2 = chucVuRepository.searchChucVuByTen(tenChucVu);
        System.out.println(cv1);
        System.out.println(cv2);
        System.out.println(trangThai);

        if (cv1 == null && cv2 == null) {
            ChucVu chucVu = new ChucVu();
            chucVu.setMaChucVu(maChucVu);
            chucVu.setTenChucVu(tenChucVu);
            chucVu.setTrangThai(trangThai);
            chucVuService.addChucVu(chucVu);
            return ResponseEntity.ok("ok");
        } else if (cv1 != null && cv2 == null) {
            return ResponseEntity.ok("errorMa");
        } else {
            return ResponseEntity.ok("errorTen");
        }
    }

    @PostMapping("/update")
    public ResponseEntity<?> suaMauSac(@RequestParam("id") Integer id,
                                       @RequestParam("maChucVu") String maChucVu,
                                       @RequestParam("tenChucVu") String tenChucVu,
                                       @RequestParam("trangThai") boolean trangThai) {
        System.out.println(maChucVu );
        System.out.println(tenChucVu);
        System.out.println(trangThai);
        ChucVu chucVu = chucVuService.getidChucVu(id);
        System.out.println(maChucVu);
        chucVu.setMaChucVu(maChucVu);
        chucVu.setTenChucVu(tenChucVu);
        chucVu.setTrangThai(trangThai);
        chucVuService.editChucVu(id, chucVu);
        return ResponseEntity.ok("ok");
    }


@PostMapping("/delete")
public ResponseEntity<?> xoaChucVu(@RequestParam("idChucVu") Integer id) {
    return ResponseEntity.ok(chucVuService.deleteChucVu(id));
}
}



