package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.DanhMuc;
import com.bags.sixdoBag.model.entitys.ThoiGianBaoHanh;
import com.bags.sixdoBag.model.entitys.ThuongHieu;
import com.bags.sixdoBag.model.repository.ThoiGianBaoHanhRepository;
import com.bags.sixdoBag.model.repository.ThuongHieuRepository;
import com.bags.sixdoBag.service.ThoiGianBaoHanhService;
import com.bags.sixdoBag.service.ThuongHieuService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequiredArgsConstructor
@RequestMapping("/thoi_gian_bao_hanh")
public class ThoiGianBaoHanhController {
    public final ThoiGianBaoHanhService thoiGianBaoHanhService;
    public final ThoiGianBaoHanhRepository thoiGianBaoHanhRepository;

    @GetMapping("")
    public String getMGG(Model model, @RequestParam(name = "name", required = false) Integer name,
                         @RequestParam(defaultValue = "0", name = "page") int page,
                         @RequestParam(name = "trangThai", required = false) Boolean trangThai) {
        Pageable pageable = PageRequest.of(page, 10);
        Page<ThoiGianBaoHanh> khuyenMais;

        if (name != null) {
            model.addAttribute("nameSearch", name);
            khuyenMais = thoiGianBaoHanhService.searchTime(name, pageable);
        } else if (trangThai != null) {
            khuyenMais = thoiGianBaoHanhService.searchcbb(trangThai, pageable);
        } else {
            khuyenMais = thoiGianBaoHanhRepository.findAll(pageable);

        }

        model.addAttribute("listColors", khuyenMais);
        return "/quan-ly/tgbh/view";
    }

    @PostMapping("/add")
    public ResponseEntity<?> add(
            @RequestParam(value = "ma", required = false) String maTG,
//                                 @RequestParam("ma") String maTG,
            @RequestParam("thoiGian") Integer thoiGian,
            @RequestParam("trangThai") boolean trangThaiTG, Model model
    ) {

        ThoiGianBaoHanh th1 = thoiGianBaoHanhRepository.searchTGByMa(maTG.trim());
        ThoiGianBaoHanh th2 = thoiGianBaoHanhRepository.searchTGByTen(thoiGian);

        if (Objects.nonNull(th2)) {
            return ResponseEntity.ok("errorTen");
        } else if (th1 != null) {
            return ResponseEntity.ok("errorMa");
        } else {
            ThoiGianBaoHanh thuongHieu = new ThoiGianBaoHanh();
            thuongHieu.setMa(maTG);
            thuongHieu.setThoiGian(thoiGian);
            thuongHieu.setTrangThai(trangThaiTG);
            thuongHieu = thoiGianBaoHanhService.addThoiGianBaoHanh(thuongHieu);

            if (maTG == null || maTG.isEmpty()) {
                thuongHieu.setMa("TH0" + thuongHieu.getId());
                thoiGianBaoHanhService.editThoiGianBaoHanh(thuongHieu.getId(), thuongHieu);
            }
            List<ThoiGianBaoHanh> listDM = thoiGianBaoHanhService.getThoiGianBaoHanhs();
            return ResponseEntity.ok(listDM);
        }
    }

    //
    @PostMapping("/update")
    public ResponseEntity<?> suaThuongHieu(@RequestParam("id") Integer id,
                                           @RequestParam("ma") String maTG,
                                           @RequestParam("thoiGian") Integer thoiGian,
                                           @RequestParam("trangThai") boolean trangThaiTG) {


        ThoiGianBaoHanh th2 = thoiGianBaoHanhRepository.searchTGByTen(thoiGian);
        ThoiGianBaoHanh thuongHieu = thoiGianBaoHanhService.getThoiGianBaoHanh(id);
        Integer tg = thuongHieu.getThoiGian();
        if (th2 == null || thoiGian == tg) {

            thuongHieu.setMa(maTG);
            thuongHieu.setThoiGian(thoiGian);
            thuongHieu.setTrangThai(trangThaiTG);
            thoiGianBaoHanhService.editThoiGianBaoHanh(id, thuongHieu);
            return ResponseEntity.ok("ok");
        } else {
            return ResponseEntity.ok("errorTen");
        }
    }


    //    @PostMapping("/xoa-thuong-hieu")
//    public ResponseEntity<?> xoaThuongHieu(@RequestBody Map<String, Object> requestBody) {
//        Integer idThuongHieu = (Integer) requestBody.get("idThuongHieu");
//        thuongHieuService.deleteThuongHieu(idThuongHieu);
//        List<ThuongHieu> danhSachThuongHieu = thuongHieuService.getThuongHieus();
//        return ResponseEntity.ok(danhSachThuongHieu);
//    }
//
//
    @PostMapping("/delete/{id}")
    public ResponseEntity<?> deleteKhuyenMai(@PathVariable("id") Integer id) {
        ThoiGianBaoHanh khuyenMai = thoiGianBaoHanhService.getThoiGianBaoHanh(id);
        if (khuyenMai != null) {
            khuyenMai.setTrangThai(false); // Đánh dấu là không hoạt động thay vì xóa
            thoiGianBaoHanhService.editThoiGianBaoHanh(id, khuyenMai); // Cập nhật khuyến mãi
            return ResponseEntity.ok("ok");
        } else {
            return ResponseEntity.ok("error");
        }
    }
}
