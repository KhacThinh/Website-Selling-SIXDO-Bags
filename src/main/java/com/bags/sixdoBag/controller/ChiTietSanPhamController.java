package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.ChiTietSanPhamRequest;
import com.bags.sixdoBag.model.entitys.ChiTietSanPham;
import com.bags.sixdoBag.service.ChiTietSanPhamServivce;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.swing.*;
import java.util.List;

@Controller
@RequestMapping("chi-tiet-san-pham")
@RequiredArgsConstructor
public class ChiTietSanPhamController {
    private final ChiTietSanPhamServivce chiTietSanPhamServivce;

    @GetMapping("hien-thi")
    public String getKhuyenMai(Model model) {

        List<ChiTietSanPham>listCTSP= chiTietSanPhamServivce.getChiTietSanPhams();
        model.addAttribute("listCTSP",listCTSP);
        return "quan-ly/chi-tiet-san-pham/view";
    }

    @GetMapping("/detail")
    public String detailSanPhamById(Model model,@RequestParam("id") int id) {
        System.out.println("idddddddddđffffffffffffff"+id);
        List<ChiTietSanPham>listCTSP= chiTietSanPhamServivce.getChiTietSanPhamById(id);
        model.addAttribute("listCTSP",listCTSP);
        return "/quan-ly/chi-tiet-san-pham/view";
    }



//    @GetMapping("/search")
//    public ResponseEntity<?> getKhuyenMai(
//            @RequestParam String tenMa
//    ) {
//        return new ResponseEntity<>(chiTietSanPhamServivce.searchSanPhamTenOrMa(tenMa), HttpStatus.OK);
//    }

//    @PostMapping("detail")
//    public String detail(Model model,@RequestParam("id") Integer id){
//        ChiTietSanPham chiTietSanPham = chiTietSanPhamServivce.getChiTietSanPham(id);
//        model.addAttribute("ctsp",chiTietSanPham);
//        System.out.println(id);
//        List<ChiTietSanPham>listCTSP= chiTietSanPhamServivce.getChiTietSanPhams();
//        model.addAttribute("listCTSP",listCTSP);
//        return "quan-ly/chi-tiet-san-pham/view";
//
//    }
    @PostMapping("/detail")
    public ResponseEntity<?> detail(@RequestParam("id") Integer id){
        System.out.println(id);
        return new ResponseEntity<>(chiTietSanPhamServivce.getChiTietSanPham(id),HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity<?> addKhuyenMai(@RequestBody ChiTietSanPhamRequest khuyenMai) {
        return new ResponseEntity<>(chiTietSanPhamServivce.addChiTietSanPham(khuyenMai), HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> editKhuyenMai(@PathVariable int id, @RequestBody @Valid ChiTietSanPhamRequest khuyenMai) {
        return new ResponseEntity<>(chiTietSanPhamServivce.editChiTietSanPham(id, khuyenMai), HttpStatus.OK);
    }

    @GetMapping("search")
    public ResponseEntity<?> search(@RequestParam("name") String name){
        return new ResponseEntity<>(chiTietSanPhamServivce.searchChiTietSanPhams(name), HttpStatus.OK);
    }

//    @DeleteMapping("/{id}")
//    public ResponseEntity<?> deleteKhuyeMai(@PathVariable int id) {
//        return new ResponseEntity<>(sanPhamService.deleteSanPham(id), HttpStatus.OK);
//    }
}
