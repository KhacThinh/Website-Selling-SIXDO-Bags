package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.response.ThongKeResponse;
import com.bags.sixdoBag.model.repository.ThongKeRespository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("thong-ke")
@RequiredArgsConstructor
public class ThongKeController {

    private ThongKeRespository thongKeRespository = new ThongKeRespository();

    @GetMapping("")
    public String getThongKe() {
        return "/quan-ly/thong-ke/thong-ke";
    }

    @GetMapping("theo-nam")
    public @ResponseBody
    Map<Integer, ThongKeResponse> getThongKeTheoNam(@RequestParam("year") Integer year) {
        Map<Integer, ThongKeResponse> thongKeSanPhamTheoNam = thongKeRespository.getThongKeSanPhamTheoNam(year);
        return thongKeSanPhamTheoNam;
    }


    @GetMapping("tong-doanh-thu")
    public @ResponseBody
    Long getTongDoanhThu() {
        long tongDoanhThu = 0;
        for (ThongKeResponse thongKeResponse : thongKeRespository.getTongDoanhThu()) {
            tongDoanhThu += thongKeResponse.getDoanhThuTrenTungSanPham();
        }
        return tongDoanhThu;
    }

    @GetMapping("top-5-ban-chay")
    public @ResponseBody
    List<ThongKeResponse> getSanPhamBanChay() {
        List<ThongKeResponse> thongKeSanPhamTheoNam = thongKeRespository.getTop5SanPhamDaBanChay();
        return thongKeSanPhamTheoNam;
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




}
