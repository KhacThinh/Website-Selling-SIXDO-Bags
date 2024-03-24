package com.bags.sixdoBag.controller.Online;


import com.bags.sixdoBag.model.dto.request.ChiTietGioHangRequestDto;
import com.bags.sixdoBag.model.dto.request.GioHangRequest;
import com.bags.sixdoBag.model.dto.request.OderDataDto;
import com.bags.sixdoBag.model.dto.request.ProductHomeRequest;
import com.bags.sixdoBag.model.entitys.ChiTietGioHang;
import com.bags.sixdoBag.model.entitys.ChiTietHoaDon;
import com.bags.sixdoBag.model.entitys.ChiTietSanPham;
import com.bags.sixdoBag.model.entitys.HoaDon;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.repository.ChiTietSanPhamRepository;
import com.bags.sixdoBag.service.ChiTietGioHangService;
import com.bags.sixdoBag.service.ChiTietSanPhamServivce;
import com.bags.sixdoBag.service.GioHangService;
import com.bags.sixdoBag.service.HoaDonChiTietService;
import com.bags.sixdoBag.service.HoaDonService;
import com.bags.sixdoBag.service.KhuyenMaiService;
import com.bags.sixdoBag.service.MauSacService;
import com.bags.sixdoBag.service.SanPhamService;
import com.bags.sixdoBag.service.ThuongHieuService;
import com.bags.sixdoBag.service.impl.Utils;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
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

    private final GioHangService gioHangService;
    private final ChiTietGioHangService chiTietGioHangService;
    Utils utils = new Utils();
    @Autowired
    private HttpSession session;
    private int idKhachHangFinal = 0;
    private int soLuongSanPhamGioHang = 0;

    @GetMapping("")
    public String homePage(Model model) {

        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        idKhachHangFinal = khachHang != null ? khachHang.getId() : 0;
        model.addAttribute("khachHang", khachHang);

        model.addAttribute("soLuongSanPhamGioHang", khachHang != null ? soLuongSanPhamGioHang(khachHang.getId()) :0);
        soLuongSanPhamGioHang =  khachHang != null ? soLuongSanPhamGioHang(khachHang.getId()) :0;
        List<ProductHomeRequest> productHomeRequestList = sanPhamService.listHienThiSanPham();
        for (ProductHomeRequest o : productHomeRequestList) {
            System.out.println("list là : " + o.getId());
        }

        model.addAttribute("listSp", productHomeRequestList);

        return "ban-hang-online/home/home-page";
    }


    @GetMapping("/search")
    public String search(Model model, @RequestParam("name") String keyword) {
        List<ProductHomeRequest> searchResults = sanPhamService.searchSanPhamOnlines(keyword);
        model.addAttribute("listSp", searchResults);
        model.addAttribute("nameHomeSearch", keyword);


        model.addAttribute("moveToProductDetail", true);
        return "ban-hang-online/home/home-page";
    }

    @GetMapping("/login")
    public String buyerLogin(Model model) {
        return "ban-hang-online/home/buyer-login";
    }
    @GetMapping("/logout")
    public String buyerLogout(Model model) {
        session.removeAttribute("buyer");

        return "redirect:/sixdo-shop";
    }

    @GetMapping("/product")
    public String hienThiSanPham(Model model) {
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        model.addAttribute("soLuongSanPhamGioHang",soLuongSanPhamGioHang);

        List<ProductHomeRequest> productHomeRequestList = sanPhamService.listHienThiSanPham();
        for (ProductHomeRequest o : productHomeRequestList) {
            System.out.println("list là : " + o.getId());
        }
        model.addAttribute("khachHang", khachHang);

        model.addAttribute("listSp", productHomeRequestList);

        return "ban-hang-online/home/index";
    }

    @PostMapping("/add-to-cart-buyer")
    public ResponseEntity<?> addToCartByBuyer(@RequestBody Map<String, Object> requestBody) {
        String idKhachHang = String.valueOf(requestBody.get("idKhachHang"));
        String idChiTietSanPham = String.valueOf(requestBody.get("idChiTietSanPham"));
        String soLuong = String.valueOf(requestBody.get("soLuong"));
        int idGioHang = gioHangService.getIdGioHang(Integer.valueOf(idKhachHang));
        ChiTietGioHangRequestDto ct = new ChiTietGioHangRequestDto();
        ct.setSoLuong(Integer.parseInt(soLuong));
        ct.setIdGioHang(idGioHang);
        ct.setIdChiTietSanPham(Integer.parseInt(idChiTietSanPham));
        chiTietGioHangService.addChiTietGioHang(ct);

        return ResponseEntity.ok(soLuongSanPhamGioHang+Integer.parseInt(soLuong));

    }

    @PostMapping("/get-cart-by-buyer")
    public ResponseEntity<?> getCartByBuyer(@RequestBody Map<String, Object> requestBody) {
        String idKhachHang = String.valueOf(requestBody.get("idKhachHang2"));
        System.out.println("idkkkkkkkn" + idKhachHang);
        List<ChiTietGioHang> chiTietGioHangList = chiTietGioHangService.getChiTietGioHangs(Integer.parseInt(idKhachHang));
        System.out.println("ddddddff" + chiTietGioHangList.size());
        return ResponseEntity.ok(chiTietGioHangList);
    }

    public int soLuongSanPhamGioHang(int idKhachHang) {
        int sum = 0;
        List<ChiTietGioHang> chiTietGioHangList = chiTietGioHangService.getChiTietGioHangs(idKhachHang);
        for (ChiTietGioHang o : chiTietGioHangList) {
            sum += o.getSoLuong();
        }
        return sum;

    }

//    @PostMapping("/thay-doi-so-luong-san-pham")
//    public ResponseEntity<?> updateSoLuongSanPhamByCart(@RequestBody Map<String, Object> requestBody) {
//        String idGioHang = String.valueOf(requestBody.get("idGioHang"));
//        String idChiTietSanPham = String.valueOf(requestBody.get("idChiTietSanPham"));
//        String soLuong = String.valueOf(requestBody.get("soLuong"));

//        List<ChiTietGioHang> chiTietGioHangList=chiTietGioHangService.getChiTietGioHangs(Integer.parseInt(idKhachHang));
//        System.out.println("ddddddff"+chiTietGioHangList.size());
//        return ResponseEntity.ok(chiTietGioHangList);
//    }

    @GetMapping("/product/{id}")
    public String productDetailById(Model model, @PathVariable int id) {
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        model.addAttribute("khachHang", khachHang);
        model.addAttribute("soLuongSanPhamGioHang",soLuongSanPhamGioHang);

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
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        List<ChiTietGioHang> chiTietGioHangList = chiTietGioHangService.getChiTietGioHangs(khachHang != null ? khachHang.getId() : -1);
        model.addAttribute("khachHang", khachHang);

        model.addAttribute("listGioHangBuyer", chiTietGioHangList);

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


        for (ChiTietHoaDon o : orderData.getCart()) {
            o.setIdHoaDon(hoaDon.getId());
            hoaDonChiTietService.saveProductForCart(o.getIdHoaDon(), o.getIdCtSanPham(), o.getSoLuong(), o.getGia());

        }
//        return "ban-hang-online/home/index";
        return "redirect:/sixdo-shop";

    }

}
