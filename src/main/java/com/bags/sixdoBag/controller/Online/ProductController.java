package com.bags.sixdoBag.controller.Online;


import com.bags.sixdoBag.model.dto.request.OderDataDto;
import com.bags.sixdoBag.model.dto.request.ProductHomeRequest;
import com.bags.sixdoBag.model.entitys.ChiTietHoaDon;
import com.bags.sixdoBag.model.entitys.ChiTietSanPham;
import com.bags.sixdoBag.model.entitys.HoaDon;
import com.bags.sixdoBag.model.repository.ChiTietSanPhamRepository;
import com.bags.sixdoBag.service.ChiTietSanPhamServivce;
import com.bags.sixdoBag.service.HoaDonChiTietService;
import com.bags.sixdoBag.service.HoaDonService;
import com.bags.sixdoBag.service.KhuyenMaiService;
import com.bags.sixdoBag.service.MauSacService;
import com.bags.sixdoBag.service.SanPhamService;
import com.bags.sixdoBag.service.ThuongHieuService;
import com.bags.sixdoBag.service.impl.Utils;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
@RequestMapping("sixdo-shop")

public class ProductController {

    private final ChiTietSanPhamServivce chiTietSanPhamServivce;

    private final ChiTietSanPhamRepository chiTietSanPhamRepository;

    private final MauSacService mauSacService;

    private final SanPhamService sanPhamService;

    private final KhuyenMaiService khuyenMaiService;

    private final ThuongHieuService thuongHieuService;
    private final HoaDonService hoaDonService;

    private final HoaDonChiTietService hoaDonChiTietService;
    Utils utils = new Utils();


    @GetMapping("")
    public String homePage(Model model) {
        List<ProductHomeRequest> productHomeRequestList = sanPhamService.listHienThiSanPham();
        for (ProductHomeRequest o : productHomeRequestList) {
            System.out.println("list là : " + o.getId());
        }

        model.addAttribute("listSp", productHomeRequestList);

        return "ban-hang-online/home/home-page";
    }

    @GetMapping("/product")
    public String hienThiSanPham(Model model) {
        List<ProductHomeRequest> productHomeRequestList = sanPhamService.listHienThiSanPham();
        for (ProductHomeRequest o : productHomeRequestList) {
            System.out.println("list là : " + o.getId());
        }

        model.addAttribute("listSp", productHomeRequestList);

        return "ban-hang-online/home/index";
    }


    @GetMapping("/product/{id}")
    public String productDetailById(Model model, @PathVariable int id) {
        List<ChiTietSanPham> list = chiTietSanPhamServivce.getChiTietSanPhamById(id);
        List<ChiTietSanPham> sortedList = list.stream()
                .sorted(Comparator.comparingDouble(ChiTietSanPham::getGiaBan))
                .collect(Collectors.toList());
        List<ProductHomeRequest> productHomeRequestList = sanPhamService.displayedByBrand(list.get(0).getSanPham().getThuongHieu().getId());

        model.addAttribute("product", sortedList);
        model.addAttribute("listSp", productHomeRequestList);

        return "ban-hang-online/home/product-detail";
    }

    @PostMapping("/get-product-by-id")
    public ResponseEntity<?> getProductById(@RequestBody Map<String, Object> requestBody) {
        String idProduct2 = String.valueOf(requestBody.get("idProduct"));
        ChiTietSanPham chiTietSanPhamById = chiTietSanPhamServivce.getChiTietSanPham(Integer.valueOf(idProduct2));
//        System.out.println("iddd ne" + chiTietSanPhamById.getId());
//        System.out.println("gia ne" + chiTietSanPhamById.getGiaBan());

        return ResponseEntity.ok(chiTietSanPhamById);
    }


    @PostMapping("/quick-view")
    public ResponseEntity<?> quickView(@RequestBody Map<String, Object> requestBody) {
        String idProduct = String.valueOf(requestBody.get("idProduct"));
        List<ChiTietSanPham> list = chiTietSanPhamServivce.getChiTietSanPhamById(Integer.valueOf(idProduct));
        List<ChiTietSanPham> sortedList = list.stream()
                .sorted(Comparator.comparingDouble(ChiTietSanPham::getGiaBan))
                .collect(Collectors.toList());
        return ResponseEntity.ok(sortedList);
    }

    @GetMapping("/shoping-cart")
    public String shopingCart(Model model) {
//        List<ProductHomeRequest> productHomeRequestList = sanPhamService.listHienThiSanPham();
//        for (ProductHomeRequest o : productHomeRequestList) {
//            System.out.println("list là : " + o.getId());
//        }
//
//        model.addAttribute("listSp", productHomeRequestList);

        return "ban-hang-online/home/shopping-cart";
    }


    @PostMapping("/placeOrder")
    public String placeOrder(@RequestBody OderDataDto orderData) {
        System.out.println("nham neees");
        HoaDon hoaDon = orderData.getHoadon();
        hoaDon.setThoiGianTao(utils.getCurrentDateTime());
        hoaDon.setTrangThai(2);
        hoaDonService.saveHoaDon(hoaDon);
        hoaDon.setId(hoaDon.getId());
        hoaDon.setMaHoaDon("HDOL" + hoaDon.getId());
        hoaDonService.saveHoaDon(hoaDon);


        for (ChiTietHoaDon o : orderData.getCart()){
            o.setIdHoaDon(hoaDon.getId());
            hoaDonChiTietService.saveProductForCart(o.getIdHoaDon(),o.getIdCtSanPham(),o.getSoLuong(),o.getGia());

        }
        return "ban-hang-online/home/index";

    }

}
