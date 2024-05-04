package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.response.ThongKeResponse;
import com.bags.sixdoBag.model.repository.ThongKeRespository;
import com.bags.sixdoBag.service.ChiTietSanPhamServivce;
import com.bags.sixdoBag.service.SanPhamService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("thong-ke")
@RequiredArgsConstructor
public class ThongKeController {

    private ThongKeRespository thongKeRespository = new ThongKeRespository();
    private final ChiTietSanPhamServivce chiTietSanPhamServivce;
    private final SanPhamService SanPhamServivce;


    @GetMapping("")
    public String getThongKe() {
        return "/quan-ly/thong-ke/thong-ke";
    }

    @GetMapping("quan-ly")
    public String getQuanLy() {
        return "/quan-ly/sidebar-manager/sildebar-managent";
    }

    @GetMapping("theo-nam")
    public @ResponseBody
    Map<Integer, ThongKeResponse> getThongKeTheoNam(@RequestParam("year") Integer year) {
        Map<Integer, ThongKeResponse> thongKeSanPhamTheoNam = thongKeRespository.getThongKeSanPhamTheoNam(year);
        System.out.println(thongKeSanPhamTheoNam.toString());

        return thongKeSanPhamTheoNam;
    }


    @GetMapping("tong-doanh-thu")
    public @ResponseBody
    Long getTongDoanhThu() {
        long tongDoanhThu = 0;
        ThongKeResponse thongKeResponse = thongKeRespository.getTongDoanhThuTaiQuayAndOnline();
        tongDoanhThu= thongKeResponse.getTongDoanhThu();
        return tongDoanhThu;
    }

    @GetMapping("tong-tien-lai")
    public @ResponseBody
    int getTongTienLai() {
        int tongSoTienLai = 0;
        for (ThongKeResponse thongKeResponse : thongKeRespository.getTongDoanhThu()) {
            tongSoTienLai += thongKeResponse.getSoTienLaiTrenTungSanPham();
        }
        return tongSoTienLai;
    }

    @GetMapping("top-5-ban-chay")
    public @ResponseBody
    List<ThongKeResponse> getSanPhamBanChay() {
        List<ThongKeResponse> thongKeSanPhamTheoNam = thongKeRespository.getTop5SanPhamDaBanChay();
        return thongKeSanPhamTheoNam;
    }

    @GetMapping("so-luong-san-pham")
    public @ResponseBody
    Long soLuongSanPham() {
        long soLuong = SanPhamServivce.getSoLuongThongKe().stream().count();
        return soLuong;
    }

    @GetMapping("list-ctsp-desc")
    public @ResponseBody List<ThongKeResponse> getListCtspDesc(@RequestParam(required = false) String sortBy) {
        if (sortBy == null || sortBy.equals("soLuong")) {
            return thongKeRespository.getAllCTSPOrderByDESCSoLuong();
        } else if (sortBy.equals("doanhThu")) {
            return thongKeRespository.getAllCTSPOrderByDESCDoanhThu();
        }
        return null;
    }


    @GetMapping("/top-khach-hang-mua-sam")
    public @ResponseBody List<ThongKeResponse> getListKh() {
        List<ThongKeResponse>listKh = thongKeRespository.getKhachHangMuaSamDESC();
        return listKh;
    }

    @GetMapping("/thong-ke-theo-ngay")
    public @ResponseBody List<ThongKeResponse> thongkeTheoNgay(@RequestParam(required = false) String selectedDate) {
        List<ThongKeResponse>list = thongKeRespository.thongKeDoanhThuTheoNgay(selectedDate);
        System.out.println(list.toString());
        return list;
    }

    @GetMapping("/thong-ke-doanh-thu-theo-ngay")
    public @ResponseBody ThongKeResponse thongkeTongDoanhThuTheoNgay(@RequestParam(required = false) String selectedDate) {
        ThongKeResponse thongKeResponse = thongKeRespository.tongDoanhThuTheoNgay(selectedDate);
        return thongKeResponse;
    }

    @GetMapping("/thong-ke-doanh-thu-theo-tuan")
    public @ResponseBody ThongKeResponse thongkeTongDoanhThuTheoTuan(@RequestParam("tuan") int tuan, @RequestParam("nam") int nam) {
        ThongKeResponse thongKeResponse = thongKeRespository.tongDoanhThuTheoTuan(tuan,nam);
        System.out.println(thongKeResponse);
        return thongKeResponse;
    }

}
