package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.ChiTietSanPhamRequest;
import com.bags.sixdoBag.model.entitys.ChiTietSanPham;
import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.entitys.MauSac;
import com.bags.sixdoBag.model.entitys.SanPham;
import com.bags.sixdoBag.model.repository.ChiTietSanPhamRepository;
import com.bags.sixdoBag.service.ChiTietSanPhamServivce;
import com.bags.sixdoBag.service.KhuyenMaiService;
import com.bags.sixdoBag.service.MauSacService;
import com.bags.sixdoBag.service.SanPhamService;
import jakarta.validation.Path;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.swing.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@Controller
@RequestMapping("chi-tiet-san-pham")
@RequiredArgsConstructor
public class ChiTietSanPhamController {
    private final ChiTietSanPhamServivce chiTietSanPhamServivce;
    private final ChiTietSanPhamRepository chiTietSanPhamRepository;
    private final MauSacService mauSacService;
    private final SanPhamService sanPhamService;
    private final KhuyenMaiService khuyenMaiService;

    @GetMapping("")
    public String getKhuyenMai(Model model) {

        List<ChiTietSanPham>listCTSP= chiTietSanPhamServivce.getChiTietSanPhams();
        model.addAttribute("listCTSP",listCTSP);
        model.addAttribute("listSp",sanPhamService.getSanPhams());
        model.addAttribute("listMauSac",mauSacService.getMauSacs());
        model.addAttribute("listKhuyenMai",khuyenMaiService.getKhuyenMais());

        model.addAttribute("chiTietSanPham",new ChiTietSanPham());
        return "quan-ly/chi-tiet-san-pham/view";
    }

    @PostMapping("/detail")
    public ResponseEntity<?> detail(@RequestParam("id") Integer id){
        System.out.println(id);
        return new ResponseEntity<>(chiTietSanPhamServivce.getChiTietSanPham(id),HttpStatus.OK);
    }

    @PostMapping("/add")
    public String add(@ModelAttribute("chiTietSanPham") ChiTietSanPham chiTietSanPham, Model model,
                      @RequestParam("images") MultipartFile hinhAnh){


        System.out.println(1);
        String uploadDir = "src/main/resources/static/images/";
        String fileHinhAnh = StringUtils.cleanPath(hinhAnh.getOriginalFilename());



//        if(hinhAnh.isEmpty()){
//            redirectAttributes.addFlashAttribute("errorHinhAnh","Ảnh không tồn tại!");
//            return "redirect:/chi-tiet-san-pham";
//        }

        try {
            File dir= new File(uploadDir);
            if(!dir.exists()){
                dir.mkdir();
            }
            String filePath =uploadDir + File.separator +fileHinhAnh;
            File dest = new File(filePath);
            hinhAnh.transferTo(dest);



        }catch (Exception e){
            e.printStackTrace();
        }
        String imagepath = fileHinhAnh;
        chiTietSanPham.setHinhAnh("/images/"+ imagepath);


        chiTietSanPhamRepository.save(chiTietSanPham);
        return "redirect:/chi-tiet-san-pham";

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
