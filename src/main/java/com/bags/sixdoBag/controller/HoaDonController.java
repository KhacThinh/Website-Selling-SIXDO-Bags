package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.ChiTietHoaDon;
import com.bags.sixdoBag.model.entitys.ChiTietSanPham;
import com.bags.sixdoBag.model.entitys.HoaDon;
import com.bags.sixdoBag.model.repository.ChiTietHoaDonRepository;
import com.bags.sixdoBag.model.repository.HoaDonRepository;
import com.bags.sixdoBag.service.ChiTietSanPhamServivce;
import com.bags.sixdoBag.service.HoaDonChiTietService;
import com.bags.sixdoBag.service.HoaDonService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
//@RestController
@RequestMapping("hoa-don")
@RequiredArgsConstructor
public class HoaDonController {

    private final HoaDonService hoaDonService;

    private final HoaDonChiTietService hoaDonChiTietService;

    private final ChiTietSanPhamServivce chiTietSanPhamServivce;

    private final ChiTietHoaDonRepository chiTietHoaDonRepository;

    private final HoaDonRepository hoaDonRepository;


    @GetMapping( value = {"lich-su","/nv-lich-su"})
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

        model.addAttribute("hoaDons", hoaDonService.getSearchMaSdtSortHoaDon(nameSearch.trim()));
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
    @PostMapping("/filterBanTaiQuay")
    public String filterBanTaiQuay(Model model){
        model.addAttribute("hoaDons", hoaDonService.getSortHoaDonTaiQuay());
        return "/hoa-don/lich-su-hoa-don";
    }

    @PostMapping("/filterChoXacNhan")
    public String filterXacNhan(Model model){
        model.addAttribute("hoaDons", hoaDonService.getSortHoaDonChuaXacNhan());
        return "/hoa-don/lich-su-hoa-don";
    }

    @PostMapping("/filterXuLy")
    public String filterDangXuLy(Model model){
        model.addAttribute("hoaDons", hoaDonService.getSortHoaDonDangXuLy());
        return "/hoa-don/lich-su-hoa-don";
    }

    @PostMapping("filterGiaoHang")
    public String filterGiaoHang(Model model){
        model.addAttribute("hoaDons", hoaDonService.getSortHoaDonGiao());
        return "/hoa-don/lich-su-hoa-don";
    }

    @PostMapping("/filterHoanThanh")
    public String filterHoanThanh(Model model){
        model.addAttribute("hoaDons", hoaDonService.getSortHoaDonHoanThanh());
        return "/hoa-don/lich-su-hoa-don";
    }

    @PostMapping("/filterHuy")
    public String filterHuy(Model model){
        model.addAttribute("hoaDons", hoaDonService.getSortHoaDonHuy());
        return "/hoa-don/lich-su-hoa-don";
    }


    //    @GetMapping("lich-su")
//    public ResponseEntity<?> lichSuHoaDon(){
//        return new ResponseEntity<>(hoaDonService.getSortHoaDon(), HttpStatus.OK);
//    }
    @PostMapping("/check-trangThai-ctsp")
    public ResponseEntity<?> checkTrangThai(@RequestParam("id") Integer id) {
        HoaDon hoaDon = hoaDonService.getHoaDonById(id);
        List<ChiTietHoaDon> chiTietHoaDons = chiTietHoaDonRepository.getGioHangChiTiet(id);
        List<ChiTietSanPham> listCTSPTrangThai = new ArrayList<>();

        for (ChiTietHoaDon cthd : chiTietHoaDons
        ) {
            if (cthd.getChiTietSanPham().getTrangThai() == 0) {
                listCTSPTrangThai.add(cthd.getChiTietSanPham());
            }
        }
        return ResponseEntity.ok(listCTSPTrangThai);

    }


    @PostMapping("/check-soLuong-xacNhan")
    public ResponseEntity<?> checkSoLuong(@RequestParam("id") Integer id) {
        HoaDon hoaDon = hoaDonService.getHoaDonById(id);
        // nhớ check list rỗng nha
        List<ChiTietHoaDon> chiTietHoaDons = chiTietHoaDonRepository.getGioHangChiTiet(id);
        List<ChiTietSanPham> listCTSPQuaSoLuong = new ArrayList<>();
        for (ChiTietHoaDon cthd : chiTietHoaDons
        ) {
            if (cthd.getSoLuong() > cthd.getChiTietSanPham().getSoLuong()) {
                listCTSPQuaSoLuong.add(cthd.getChiTietSanPham());
            }
        }
        System.out.println(listCTSPQuaSoLuong);
        return ResponseEntity.ok(listCTSPQuaSoLuong);

    }













//    // xác nhận
//    @PostMapping("/xacNhan-lichSuHoaDon")
//    public ResponseEntity<?> xacNhan2(@RequestParam("id") Integer id
//    ) {
//
//        HoaDon hoaDon = hoaDonService.getHoaDonById(id);
//        List<ChiTietHoaDon> chiTietHoaDons = hoaDonChiTietService.getGioHangChiTietFromHoaDon(id);
//
//        if (chiTietHoaDons.size() == 0) {
//            // hủy đơn hàng
//            return ResponseEntity.ok("null");
//        } else {
//            if (hoaDon.getTrangThai() != 4) {
//                if (hoaDon.getTrangThai() != 5) {
//                    if (hoaDon.getTrangThai() == 2) {
//                        for (ChiTietHoaDon cthd : chiTietHoaDons) {
//                            ChiTietSanPham ctsp = (ChiTietSanPham) chiTietSanPhamServivce.getChiTietSanPham(cthd.getIdCtSanPham());
//                            ctsp.setSoLuong(ctsp.getSoLuong() - cthd.getSoLuong());
//                        }
//
//                        hoaDon.setTrangThai(3);
//                        hoaDonService.editHoaDon(id, hoaDon);
//                        return ResponseEntity.ok("ok");
//                    } else {
//                        return ResponseEntity.ok("errerXacNhan");
//                    }
//                } else {
//                    return ResponseEntity.ok("errorGiaoHang");
//                }
//            } else {
//                return ResponseEntity.ok("errorHuyDonHang");
//            }
//
//
//        }
//    }

    @PostMapping("/giao-hang-thanh-cong")
    public ResponseEntity<?> giaoThanhCong(@RequestParam("id") Integer id) {
        HoaDon hoaDon = hoaDonService.getHoaDonById(id);
        if (hoaDon.getTrangThai() == 5) {
            hoaDon.setTrangThai(6);
            hoaDonService.editHoaDon(id, hoaDon);
            return ResponseEntity.ok("ok");
        } else {
            return ResponseEntity.ok("no");
        }

    }
}
