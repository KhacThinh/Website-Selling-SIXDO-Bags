package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.DanhMuc;
import com.bags.sixdoBag.model.entitys.DoiTuongSuDung;
import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.repository.DoiTuongSuDungRepository;
import com.bags.sixdoBag.service.DoiTuongSuDungService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("doi-tuong-su-dung")
public class DoiTuongSuDungController {

    private final DoiTuongSuDungService doiTuongSuDungService;
    private final DoiTuongSuDungRepository doiTuongSuDungRepository;

//    @GetMapping("")
//    public String getMauSac(Model model, @RequestParam(name = "name", required = false) String name) {
//        model.addAttribute("listColors", doiTuongSuDungService.getListDoiTuongSuDung());
//        return "/quan-ly/doi-tuong-su-dung/view";
//    }
@GetMapping("")
public String getMGG(Model model, @RequestParam(name = "name", required = false) String name,
                     @RequestParam(defaultValue = "0", name = "page") int page,
                     @RequestParam(name = "trangThai", required = false) Boolean trangThai) {
    Pageable pageable = PageRequest.of(page, 10);
    Page<DoiTuongSuDung> khuyenMais;

    if (name != null && !name.isEmpty()) {
        model.addAttribute("nameSearch", name);
        khuyenMais =doiTuongSuDungService.searchDTSDTenOrMa(name, pageable);
    } else if (trangThai != null) {
        khuyenMais = doiTuongSuDungService.searchcbb(trangThai, pageable);
    } else {
        khuyenMais = doiTuongSuDungRepository.findAll(pageable);
    }

    model.addAttribute("listColors", khuyenMais);
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

            List<DoiTuongSuDung> listDM = doiTuongSuDungService.getListDoiTuongSuDung();
            return ResponseEntity.ok(listDM);
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


//    @PostMapping("/delete")
//    public ResponseEntity<?> xoaChucVu(@RequestParam("idDTSD") Integer id) {
//        return ResponseEntity.ok(doiTuongSuDungService.deleteDoiTuongSuDung(id));
//    }
@PostMapping("/delete/{id}")
public ResponseEntity<?> deleteKhuyenMai(@PathVariable("id") Integer id) {
    DoiTuongSuDung khuyenMai = doiTuongSuDungService.getDoiTuongSuDung(id);
    if (khuyenMai != null) {
        khuyenMai.setTrangThai(false); // Đánh dấu là không hoạt động thay vì xóa
        doiTuongSuDungService.editDoiTuongSuDung(id, khuyenMai); // Cập nhật khuyến mãi
        return ResponseEntity.ok("ok");
    } else {
        return ResponseEntity.ok("error");
    }
}
}
