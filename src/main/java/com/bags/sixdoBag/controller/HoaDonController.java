package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.service.HoaDonService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
//@RestController
@RequestMapping("hoa-don")
@RequiredArgsConstructor
public class HoaDonController {

    private final HoaDonService hoaDonService;

    @GetMapping("lich-su")
    public String lichSuHoaDon(Model model) {
        model.addAttribute("hoaDons", hoaDonService.getSortHoaDon());
        return "/hoa-don/lich-su-hoa-don";
    }

    @PostMapping("/xac-nhan-don-hang")
    public ResponseEntity<?> xacNhanDonHang(@RequestParam("maChucVu") String ma) {
        hoaDonService.xacNhanDonHang(3, ma);
        return ResponseEntity.ok("ok");
    }

    @GetMapping("/search-hoa-don")
    public String searchHoaDon(Model model, @RequestParam(value = "nameSearch") String nameSearch) {
        model.addAttribute("hoaDons", hoaDonService.getSearchMaSdtSortHoaDon(nameSearch));
        model.addAttribute("nameSearch", nameSearch);
        return "/hoa-don/lich-su-hoa-don";
    }

    @PostMapping("/filter")
    public String handleFilterFormSubmit(Model model,
                                         @RequestParam(value = "ngayBatDau") String ngayBatDau,
                                         @RequestParam(value = "ngayKetThuc") String ngayKetThuc) {
        model.addAttribute("hoaDons", hoaDonService.filterNgayBatDauKetThuc(ngayBatDau, ngayKetThuc));
        model.addAttribute("ngayBatDau", ngayBatDau);
        model.addAttribute("ngayKetThuc", ngayKetThuc);
        return "/hoa-don/lich-su-hoa-don";
    }


//    @GetMapping("lich-su")
//    public ResponseEntity<?> lichSuHoaDon(){
//        return new ResponseEntity<>(hoaDonService.getSortHoaDon(), HttpStatus.OK);
//    }
}
