package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.ChiTietSanPhamRequest;
import com.bags.sixdoBag.model.entitys.*;
import com.bags.sixdoBag.service.*;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("chi-tiet-san-pham")
@RequiredArgsConstructor
public class ChiTietSanPhamController {

    private final ChiTietSanPhamServivce chiTietSanPhamServivce;

    private final MauSacService mauSacService;

    private final SanPhamService sanPhamService;

    private final KhuyenMaiService khuyenMaiService;

    private final ThuongHieuService thuongHieuService;

    private final DoiTuongSuDungService doiTuongSuDungService;


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
        System.out.println(listCTSP.size() + "sizzzzzzzzzzz");
        return "/quan-ly/chi-tiet-san-pham/view";
    }

    @GetMapping("")
    public String getKhuyenMai(Model model) {
        extracted(model);
        List<ChiTietSanPham> listCTSP = chiTietSanPhamServivce.getChiTietSanPhams();
        model.addAttribute("listCTSP", listCTSP);

        return "quan-ly/chi-tiet-san-pham/view";
    }

    private void extracted(Model model) {
        Set<String> chatLieus = sanPhamService.getSanPhams().stream()
                .map(SanPham::getChatLieu)
                .filter(chatLieu -> chatLieu != null && !chatLieu.isEmpty())
                .map(s -> s.trim())
                .collect(Collectors.toSet());

        Set<String> doiTuongSuDungs = new HashSet<>(doiTuongSuDungService.getListDoiTuongSuDung().stream()
                .map(DoiTuongSuDung::getTenDoiTuongSuDung)
                .filter(doiTuong -> doiTuong != null && !doiTuong.isEmpty())
                .map(s -> s.trim())
                .collect(Collectors.toSet()));

        Set<String> mauSacs = mauSacService.getMauSacs().stream()
                .map(MauSac::getTenMauSac)
                .filter(mauSac -> mauSac != null && !mauSac.isEmpty())
                .map(s -> s.trim())
                .collect(Collectors.toSet());

        Set<String> thuongHieus = thuongHieuService.getThuongHieus().stream()
                .filter(th -> th != null && !th.getTen().isEmpty())
                .map(ThuongHieu::getTen)
                .map(s -> s.trim())
                .collect(Collectors.toSet());

        model.addAttribute("tenThuongHieuSelects", thuongHieus);
        model.addAttribute("tenDoiTuongSuDungSelects", doiTuongSuDungs);
        model.addAttribute("tenChatLieuSelects", chatLieus);
        model.addAttribute("tenMauSacSelects", mauSacs);
        model.addAttribute("listSp", sanPhamService.getSanPhams());
        model.addAttribute("listMauSac", mauSacService.getMauSacs());
        model.addAttribute("listKhuyenMai", khuyenMaiService.getKhuyenMais());
        model.addAttribute("chiTietSanPham", new ChiTietSanPham());
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

    @PostMapping("filter")
    public String filter(
            Model model,
            @RequestParam("tenMauSac") String mauSac,
            @RequestParam("tenDoiTuongSuDung") String doiTuongSuDung,
            @RequestParam("tenChatLieu") String chatLieu,
            @RequestParam("tenThuongHieu") String thuongHieu
    ) {
        extracted(model);
        List<ChiTietSanPham> listSearchCTSP = chiTietSanPhamServivce.filterTaiQuay(chatLieu.trim(), thuongHieu.trim(), mauSac.trim(), doiTuongSuDung.trim());
        model.addAttribute("listCTSP", listSearchCTSP);
        model.addAttribute("tenMauSacSelect", mauSac);
        model.addAttribute("tenDoiTuongSuDungSelect", doiTuongSuDung);
        model.addAttribute("tenChatLieuSelect", chatLieu);
        model.addAttribute("tenThuongHieuSelect", thuongHieu);
        return "quan-ly/chi-tiet-san-pham/view";
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

    @GetMapping("ctsp")
    @ResponseBody
    public List<ChiTietSanPham> chiTietSanPhams() {
        List<ChiTietSanPham> chiTietSanPhams = chiTietSanPhamServivce.getChiTietSanPhams();
        return chiTietSanPhams;
    }
}
