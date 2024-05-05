package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.DanhMuc;
import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.entitys.ThuongHieu;
import com.bags.sixdoBag.model.repository.ThuongHieuRepository;
import com.bags.sixdoBag.service.ThuongHieuService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequiredArgsConstructor
@RequestMapping("/thuonghieu")
public class ThuongHieuController {
    public final ThuongHieuService thuongHieuService;
    public final ThuongHieuRepository thuongHieuRepository;

    //    @GetMapping("")
//    public String getThuongHieu(Model model, @RequestParam(name = "name", required = false) String name) {
//        model.addAttribute("listThuongHieu", thuongHieuService.getThuongHieus());
//        return "/quan-ly/thuong-hieu/view";
//    }
    @GetMapping("")
    public String getMGG(Model model, @RequestParam(name = "name", required = false) String name,
                         @RequestParam(defaultValue = "0", name = "page") int page,
                         @RequestParam(name = "trangThai", required = false) Boolean trangThai) {
        Pageable pageable = PageRequest.of(page, 10);
        Page<ThuongHieu> khuyenMais;

        if (name != null && !name.isEmpty()) {
            model.addAttribute("nameSearch", name);
            khuyenMais = thuongHieuService.searchThuongHieuTenOrMa(name, pageable);
        } else if (trangThai != null) {
            khuyenMais = thuongHieuService.searchcbb(trangThai, pageable);
        } else {
            khuyenMais = thuongHieuRepository.findAll(pageable);

        }

        model.addAttribute("listColors", khuyenMais);
        return "/quan-ly/thuong-hieu/view";
    }

    @PostMapping("/add")
    public ResponseEntity<?> add(
            @RequestParam(value = "maTH", required = false) String maTH,
//                                 @RequestParam("maTH") String maThuongHieu,
            @RequestParam("ten") String tenThuongHieu,
            @RequestParam("trangThai") boolean trangThaiTT, Model model
    ) {
        System.out.println(maTH);
        ThuongHieu th1 = thuongHieuRepository.searchThuongHieuByMa(maTH.trim());
        ThuongHieu th2 = thuongHieuRepository.searchThuongHieuByTen(tenThuongHieu.trim());
        if (Objects.nonNull(th2)) {
            return ResponseEntity.ok("errorTen");
        } else if (th1 != null) {
            return ResponseEntity.ok("errorMa");
        } else {
            String temp;
            ThuongHieu thuongHieu = new ThuongHieu();
            thuongHieu.setMaTH(maTH);
            thuongHieu.setTen(tenThuongHieu);
            thuongHieu.setTrangThai(trangThaiTT);
            thuongHieu = thuongHieuService.addThuongHieu(thuongHieu);
            if (maTH == null || maTH.isEmpty()) {
                thuongHieu.setMaTH("TH0" + thuongHieu.getId());
                thuongHieuService.editThuongHieu(thuongHieu.getId(), thuongHieu);
            }

            List<ThuongHieu> listDM = thuongHieuService.getThuongHieus();
            return ResponseEntity.ok(listDM);
        }
    }

    @PostMapping("/update")
    public ResponseEntity<?> suaThuongHieu(@RequestParam("id") Integer id,
                                           @RequestParam("maTH") String ma,
                                           @RequestParam("ten") String ten,
                                           @RequestParam("trangThai") boolean trangThaiTT) {
        System.out.println(ma);
        System.out.println(ten);

        ThuongHieu thuongHieu = thuongHieuService.getidThuongHieu(id);
        String tenTh = thuongHieu.getTen();
        ThuongHieu th2 = thuongHieuRepository.searchThuongHieuByTen(ten.trim());
        if (th2 == null || ten.equals(tenTh)) {

            thuongHieu.setMaTH(ma);
            thuongHieu.setTen(ten);
            thuongHieu.setTrangThai(trangThaiTT);
            thuongHieuService.editThuongHieu(id, thuongHieu);
            return ResponseEntity.ok("ok");
        } else {
            return ResponseEntity.ok("errorTen");
        }
    }


    @PostMapping("/xoa-thuong-hieu")
    public ResponseEntity<?> xoaThuongHieu(@RequestBody Map<String, Object> requestBody) {
        Integer idThuongHieu = (Integer) requestBody.get("idThuongHieu");
        thuongHieuService.deleteThuongHieu(idThuongHieu);
        List<ThuongHieu> danhSachThuongHieu = thuongHieuService.getThuongHieus();
        return ResponseEntity.ok(danhSachThuongHieu);
    }


    @PostMapping("/delete/{id}")
    public ResponseEntity<?> deleteKhuyenMai(@PathVariable("id") Integer id) {
        ThuongHieu khuyenMai = thuongHieuService.getidThuongHieu(id);
        if (khuyenMai != null) {
            khuyenMai.setTrangThai(false); // Đánh dấu là không hoạt động thay vì xóa
            thuongHieuService.editThuongHieu(id, khuyenMai); // Cập nhật khuyến mãi
            return ResponseEntity.ok("ok");
        } else {
            return ResponseEntity.ok("error");
        }
    }
}
