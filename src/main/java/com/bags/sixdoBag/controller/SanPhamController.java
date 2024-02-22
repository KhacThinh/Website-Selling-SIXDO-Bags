package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.SanPhamRequest;
import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.entitys.SanPham;
import com.bags.sixdoBag.model.entitys.ThuongHieu;
import com.bags.sixdoBag.service.KhuyenMaiService;
import com.bags.sixdoBag.service.SanPhamService;
import com.bags.sixdoBag.service.ThuongHieuService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

//@RestController
@Controller
@RequestMapping("san-pham")
@RequiredArgsConstructor
public class SanPhamController {
    private final SanPhamService sanPhamService;

    private final ThuongHieuService thuongHieuService;

    @GetMapping("")
    public String getKhuyenMai(Model model, @RequestParam(name = "name", required = false) String name) {
        Set<String> tenThuongHieuSelects = thuongHieuService.getThuongHieus().stream().map(ThuongHieu::getTen).collect(Collectors.toSet());
        List<String> tenChatLieuSelects = sanPhamService.getSanPhams().stream().map(SanPham::getChatLieu).collect(Collectors.toList());
        model.addAttribute("tenThuongHieuSelects", tenThuongHieuSelects);
        model.addAttribute("tenChatLieuSelects", tenChatLieuSelects);
        model.addAttribute("product", new SanPham());
        if (Objects.isNull(name)) {
            model.addAttribute("sanPhams", sanPhamService.getSanPhams());
        } else {
            model.addAttribute("sanPhams", sanPhamService.searchSanPhamTenOrMa(name));
        }
        return "/quan-ly/san-pham/view";
    }


    @PostMapping("/filter")
    public String search(Model model,
                         @RequestParam String tenChatLieu,
                         @RequestParam String tenThuongHieu
    ) {
        Set<String> tenThuongHieuSelects = thuongHieuService.getThuongHieus().stream().map(ThuongHieu::getTen).collect(Collectors.toSet());
        Set<String> tenChatLieuSelects = sanPhamService.getSanPhams().stream().map(SanPham::getChatLieu).collect(Collectors.toSet());
        model.addAttribute("tenThuongHieuSelects", tenThuongHieuSelects);
        model.addAttribute("tenChatLieuSelects", tenChatLieuSelects);
        List<SanPham> sanPhams = sanPhamService.filterSanPhamChatLieuOrThuongHieu(tenChatLieu, tenThuongHieu);
        model.addAttribute("sanPhams", sanPhams);
        model.addAttribute("tenChatLieuSelect", tenChatLieu);
        model.addAttribute("tenThuongHieuSelect", tenThuongHieu);
        return "/quan-ly/san-pham/view";
    }


    @PostMapping("")
    public ResponseEntity<?> addKhuyenMai(@RequestBody @Valid SanPhamRequest khuyenMai) {
        return new ResponseEntity<>(sanPhamService.addSanPham(khuyenMai), HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> editKhuyenMai(@PathVariable int id, @RequestBody @Valid SanPhamRequest khuyenMai) {
        return new ResponseEntity<>(sanPhamService.editSanPham(id, khuyenMai), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteKhuyeMai(@PathVariable int id) {
        return new ResponseEntity<>(sanPhamService.deleteSanPham(id), HttpStatus.OK);
    }
}
