package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.DoiTuongSuDung;
import com.bags.sixdoBag.model.entitys.ThuongHieu;
import com.bags.sixdoBag.model.repository.DoiTuongSuDungRepository;
import com.bags.sixdoBag.model.repository.ThuongHieuRepository;
import com.bags.sixdoBag.service.DoiTuongSuDungService;
import com.bags.sixdoBag.service.ThuongHieuService;
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
@RequestMapping("/thuong-hieu")
public class ThuongHieuController {
    public final ThuongHieuService thuongHieuService;
    public final ThuongHieuRepository thuongHieuRepository;

    @GetMapping("")
    public String getThuongHieu(Model model, @RequestParam(name = "name", required = false) String name) {
        model.addAttribute("listThuongHieu", thuongHieuService.getThuongHieus());
        return "/quan-ly/thuong-hieu/view";
    }

    @PostMapping("/add")
    public ResponseEntity<?> add(@RequestParam("ma") String maThuongHieu,
                                 @RequestParam("ten") String tenThuongHieu,
                                 @RequestParam("trangThai") boolean trangThaiTT, Model model
    ) {
        System.out.println(maThuongHieu);
        ThuongHieu th1 = thuongHieuRepository.searchThuongHieuByMa(maThuongHieu);
        ThuongHieu th2 = thuongHieuRepository.searchThuongHieuByTen(tenThuongHieu);
        System.out.println(th1);
        System.out.println(th2);
        System.out.println(trangThaiTT);

        if (th1 == null && th2 == null) {
            ThuongHieu thuongHieu = new ThuongHieu();
            thuongHieu.setMa(maThuongHieu);
            thuongHieu.setTen(tenThuongHieu);
            thuongHieu.setTrangThai(trangThaiTT);
            thuongHieuService.addThuongHieu(thuongHieu);
            return ResponseEntity.ok("ok");
        } else if (th1 != null && th2 == null) {
            return ResponseEntity.ok("errorMa");
        } else {
            return ResponseEntity.ok("errorTen");
        }
    }

@PostMapping("/update")
public ResponseEntity<?> suaThuongHieu(@RequestParam("id") Integer id,
                                       @RequestParam("ma") String ma,
                                       @RequestParam("ten") String ten,
                                       @RequestParam("trangThai") boolean trangThaiTT) {
    System.out.println(ma);
    System.out.println(ten);

    ThuongHieu thuongHieu = thuongHieuService.getidThuongHieu(id);
    System.out.println(thuongHieu);

    thuongHieu.setMa(ma);
    thuongHieu.setTen(ten);
    thuongHieu.setTrangThai(trangThaiTT);

    thuongHieuService.editThuongHieu(id, thuongHieu);

    return ResponseEntity.ok("ok");
}


    @PostMapping("/xoa-thuong-hieu")
    public ResponseEntity<?> xoaThuongHieu(@RequestBody Map<String, Object> requestBody) {
        Integer idThuongHieu = (Integer) requestBody.get("idThuongHieu");
        thuongHieuService.deleteThuongHieu(idThuongHieu);
        List<ThuongHieu> danhSachThuongHieu = thuongHieuService.getThuongHieus();
        return ResponseEntity.ok(danhSachThuongHieu);
    }
}