package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.ChiTietSanPhamRequest;
import com.bags.sixdoBag.model.dto.request.SanPhamRequest;
import com.bags.sixdoBag.model.entitys.ChiTietSanPham;
import com.bags.sixdoBag.model.entitys.SanPham;
import com.bags.sixdoBag.model.entitys.ThuongHieu;
import com.bags.sixdoBag.model.repository.ChiTietSanPhamRepository;
import com.bags.sixdoBag.service.ChiTietSanPhamServivce;
import com.bags.sixdoBag.service.KhuyenMaiService;
import com.bags.sixdoBag.service.MauSacService;
import com.bags.sixdoBag.service.SanPhamService;
import com.bags.sixdoBag.service.ThuongHieuService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("chi-tiet-san-pham")
@RequiredArgsConstructor
public class ChiTietSanPhamController {

    private final ChiTietSanPhamServivce chiTietSanPhamServivce;

    private final ChiTietSanPhamRepository chiTietSanPhamRepository;

    private final MauSacService mauSacService;

    private final SanPhamService sanPhamService;

    private final KhuyenMaiService khuyenMaiService;

    private final ThuongHieuService thuongHieuService;

    @PostMapping("/detail")
    public ResponseEntity<?> detail(@RequestParam("id") Integer id) {
        System.out.println(id);
        return new ResponseEntity<>(chiTietSanPhamServivce.getChiTietSanPham(id), HttpStatus.OK);
    }

    @GetMapping("/detailCTSP")
    public String detailSanPhamById(Model model, @RequestParam("id") int id) {
        System.out.println("idddddddddđffffffffffffff" + id);
        List<ChiTietSanPham> listCTSP = chiTietSanPhamServivce.getChiTietSanPhamById(id);
        model.addAttribute("listCTSP", listCTSP);
        model.addAttribute("chiTietSanPham", new ChiTietSanPham());

        System.out.println(listCTSP.size()+"sizzzzzzzzzzz");
        model.addAttribute("listSp", sanPhamService.getSanPhams());
        model.addAttribute("listMauSac", mauSacService.getMauSacs());
        model.addAttribute("listKhuyenMai", khuyenMaiService.getKhuyenMais());
        return "/quan-ly/chi-tiet-san-pham/view";
    }

    @GetMapping("")
    public String getKhuyenMai(Model model) {

        List<ChiTietSanPham> listCTSP = chiTietSanPhamServivce.getChiTietSanPhams();
        model.addAttribute("listCTSP", listCTSP);
        model.addAttribute("listSp", sanPhamService.getSanPhams());
        model.addAttribute("listMauSac", mauSacService.getMauSacs());
        model.addAttribute("listKhuyenMai", khuyenMaiService.getKhuyenMais());

        model.addAttribute("chiTietSanPham", new ChiTietSanPham());
        return "quan-ly/chi-tiet-san-pham/view";
    }


    @PostMapping("/add")
    public String add(@ModelAttribute("chiTietSanPham") ChiTietSanPham chiTietSanPham, Model model,
                      @RequestParam("images") MultipartFile hinhAnh) {

        if (!hinhAnh.isEmpty()) {
            try {
                byte[] bytes = hinhAnh.getBytes();
                String UPLOAD_DIR = "src/main/resources/static/images/chi-tiet-san-pham/";
                // Lưu ảnh vào thư mục trong dự án của bạn hoặc thực hiện xử lý tùy chỉnh khác
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File(UPLOAD_DIR + hinhAnh.getOriginalFilename())));
                stream.write(bytes);
                System.out.println(hinhAnh.getOriginalFilename());
                chiTietSanPham.setHinhAnh("../static/images/chi-tiet-san-pham/" + hinhAnh.getOriginalFilename());
                stream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        chiTietSanPhamServivce.addChiTietSanPham(chiTietSanPham);
        return "redirect:/chi-tiet-san-pham";

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
        model.addAttribute("sanPhamRequest", new SanPhamRequest());
        List<SanPham> sanPhams = sanPhamService.filterSanPhamChatLieuOrThuongHieu(tenChatLieu, tenThuongHieu);
        model.addAttribute("sanPhams", sanPhams);
        model.addAttribute("tenChatLieuSelect", tenChatLieu);
        model.addAttribute("tenThuongHieuSelect", tenThuongHieu);
        return "/quan-ly/san-pham/view";
    }


    @PutMapping("/{id}")
    public ResponseEntity<?> editKhuyenMai(@PathVariable int id, @RequestBody @Valid ChiTietSanPhamRequest khuyenMai) {
        return new ResponseEntity<>(chiTietSanPhamServivce.editChiTietSanPham(id, khuyenMai), HttpStatus.OK);
    }

    @GetMapping("search")
    public ResponseEntity<?> search(@RequestParam("name") String name) {
        return new ResponseEntity<>(chiTietSanPhamServivce.searchChiTietSanPhams(name), HttpStatus.OK);
    }

//    @DeleteMapping("/{id}")
//    public ResponseEntity<?> deleteKhuyeMai(@PathVariable int id) {
//        return new ResponseEntity<>(sanPhamService.deleteSanPham(id), HttpStatus.OK);
//    }
}
