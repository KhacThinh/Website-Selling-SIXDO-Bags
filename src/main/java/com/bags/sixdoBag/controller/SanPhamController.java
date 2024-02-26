package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.SanPhamRequest;
import com.bags.sixdoBag.model.entitys.SanPham;
import com.bags.sixdoBag.model.entitys.ThuongHieu;
import com.bags.sixdoBag.service.*;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("san-pham")
@RequiredArgsConstructor
public class SanPhamController {
    private final SanPhamService sanPhamService;

    private final ThuongHieuService thuongHieuService;

    private final ThoiGianBaoHanhService thoiGianBaoHanhService;

    private final DanhMucService danhMucService;

    private final DoiTuongSuDungService doiTuongSuDungService;

    @GetMapping("")
    public String getSanPham(Model model, @RequestParam(name = "name", required = false) String name) {
        Set<String> tenThuongHieuSelects = thuongHieuService.getThuongHieus().stream().map(ThuongHieu::getTen).collect(Collectors.toSet());
        Set<String> tenChatLieuSelects = sanPhamService.getSanPhams().stream().filter(sp -> sp.getChatLieu() != null && !sp.getChatLieu().isEmpty()).map(SanPham::getChatLieu).collect(Collectors.toSet());
        model.addAttribute("tenThuongHieuSelects", tenThuongHieuSelects);
        model.addAttribute("tenChatLieuSelects", tenChatLieuSelects);
        model.addAttribute("sanPhamRequest", new SanPhamRequest());
        hienThiChung(model);
        if (Objects.isNull(name)) {
            model.addAttribute("sanPhams", sanPhamService.getSanPhams());
        } else {
            model.addAttribute("sanPhams", sanPhamService.searchSanPhamTenOrMa(name));
        }
        return "/quan-ly/san-pham/view";
    }

    private void hienThiChung(Model model) {
        model.addAttribute("danhMucForm", danhMucService.getDanhMucs());
        model.addAttribute("doiTuongSuDungForm", doiTuongSuDungService.getListDoiTuongSuDung());
        model.addAttribute("thuongHieuForm", thuongHieuService.getThuongHieus());
        model.addAttribute("thoiGianBaoHanhForm", thoiGianBaoHanhService.getThoiGianBaoHanhs());
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



    @PostMapping("")
    public String addSanPham(
            @ModelAttribute("sanPhamRequest") SanPhamRequest sanPhamRequest,
            @RequestParam("hinhAnh") MultipartFile hinhAnh,
            BindingResult bindingResult
    ) {
        if (bindingResult.hasErrors()) {
            System.out.println("Lỗi");
        }

        if (!hinhAnh.isEmpty()) {
            try {
                byte[] bytes = hinhAnh.getBytes();
                String UPLOAD_DIR = "src/main/resources/static/images/san-pham/";
                // Lưu ảnh vào thư mục trong dự án của bạn hoặc thực hiện xử lý tùy chỉnh khác
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File(UPLOAD_DIR + hinhAnh.getOriginalFilename())));
                stream.write(bytes);
                System.out.println(hinhAnh.getOriginalFilename());
                sanPhamRequest.setAnh("../static/images/san-pham/" + hinhAnh.getOriginalFilename());
                stream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        sanPhamService.addSanPham(sanPhamRequest);
        return "redirect:/san-pham";
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> editSanPham(@PathVariable int id, @RequestBody @Valid SanPhamRequest khuyenMai) {
        return new ResponseEntity<>(sanPhamService.editSanPham(id, khuyenMai), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteKhuyeMai(@PathVariable int id) {
        return new ResponseEntity<>(sanPhamService.deleteSanPham(id), HttpStatus.OK);
    }
}
