package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.HoaDon;
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

    @PostMapping("/update")
    public ResponseEntity<?> suaMGG(@RequestParam("id") Integer id,
                                    @RequestParam("tenNguoiNhan") String tenNguoiNhan,
                                    @RequestParam("sdtNguoiNhan") String sdtNguoiNhan,
                                    @RequestParam("emailNguoiNhan") String emailNguoiNhan,
                                    @RequestParam("diaChiNguoiNhan") String diaChiNguoiNhan,
                                    @RequestParam("khachThanhToan") double khachThanhToan,
                                    @RequestParam("phiVanChuyen") double phiVanChuyen,
                                    @RequestParam("soTienNo") double soTienNo
    )
    {


        HoaDon hoaDon = hoaDonService.getHoaDonById(id);
        hoaDon.setTenNguoiNhan(tenNguoiNhan);
        hoaDon.setSdtNguoiNhan(sdtNguoiNhan);
        hoaDon.setEmailNguoiNhan(emailNguoiNhan);
        hoaDon.setDiaChiNguoiNhan(diaChiNguoiNhan);
        hoaDon.setKhachThanhToan(khachThanhToan);
        hoaDon.setPhiVanChuyen(phiVanChuyen);
        hoaDon.setSoTienNo(soTienNo);
        hoaDonService.editHoaDon(id, hoaDon);
        return ResponseEntity.ok("ok");

    }

    @PostMapping("/update2")
    public ResponseEntity<?> suaMGG1(@RequestParam("id") Integer id
    )
    {
        HoaDon hoaDon = hoaDonService.getHoaDonById(id);

        hoaDon.setTrangThai(5);

        hoaDonService.editHoaDon(id, hoaDon);
        return ResponseEntity.ok("ok");
    }
}
