package com.bags.sixdoBag.controller.Online;


import com.bags.sixdoBag.config.UserLoginKhachHang;
import com.bags.sixdoBag.model.dto.request.ChiTietGioHangRequestDto;
import com.bags.sixdoBag.model.dto.request.GioHangRequest;
import com.bags.sixdoBag.model.dto.request.OderDataDto;
import com.bags.sixdoBag.model.dto.request.ProductHomeRequest;
import com.bags.sixdoBag.model.entitys.ChiTietGioHang;
import com.bags.sixdoBag.model.entitys.ChiTietHoaDon;
import com.bags.sixdoBag.model.entitys.ChiTietSanPham;
import com.bags.sixdoBag.model.entitys.DoiTuongSuDung;
import com.bags.sixdoBag.model.entitys.HoaDon;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.repository.ChiTietGioHangRepository;
import com.bags.sixdoBag.model.repository.ChiTietSanPhamRepository;

import com.bags.sixdoBag.model.user.EmailService;

import com.bags.sixdoBag.service.ChiTietGioHangService;

import com.bags.sixdoBag.service.ChiTietSanPhamServivce;
import com.bags.sixdoBag.service.GioHangService;
import com.bags.sixdoBag.service.HoaDonChiTietService;
import com.bags.sixdoBag.service.HoaDonService;
import com.bags.sixdoBag.service.KhuyenMaiService;
import com.bags.sixdoBag.service.MauSacService;
import com.bags.sixdoBag.service.SanPhamService;
import com.bags.sixdoBag.service.ThuongHieuService;

import com.bags.sixdoBag.service.*;

import com.bags.sixdoBag.service.impl.Utils;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
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

    private final DoiTuongSuDungService doiTuongSuDungService;

    private final MauSacService mauSacService;

    private final SanPhamService sanPhamService;

    private final KhuyenMaiService khuyenMaiService;

    private final ThuongHieuService thuongHieuService;
    private final HoaDonService hoaDonService;

    private final HoaDonChiTietService hoaDonChiTietService;


    private final EmailService emailService;
    Utils utils = new Utils();


    private final GioHangService gioHangService;
    private final ChiTietGioHangService chiTietGioHangService;

    private final ChiTietGioHangRepository chiTietGioHangRepository;


    @Autowired
    private HttpSession session;
    private int idKhachHangFinal = 0;
    private int soLuongSanPhamGioHang = 0;

    @GetMapping("")
    public String homePage(Model model) {

        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        idKhachHangFinal = khachHang != null ? khachHang.getId() : 0;
        model.addAttribute("khachHang", khachHang);

        model.addAttribute("soLuongSanPhamGioHang", khachHang != null ? soLuongSanPhamGioHang(khachHang.getId()) : 0);
        soLuongSanPhamGioHang = khachHang != null ? soLuongSanPhamGioHang(khachHang.getId()) : 0;
        List<ProductHomeRequest> productHomeRequestList = sanPhamService.listHienThiSanPham();


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
        model.addAttribute("soLuongSanPhamGioHang", soLuongSanPhamGioHang);

        List<ProductHomeRequest> productHomeRequestList = sanPhamService.listHienThiSanPham();

        model.addAttribute("khachHang", khachHang);

        model.addAttribute("listSp", productHomeRequestList);

        return "ban-hang-online/home/index";
    }

    @PostMapping("/check-soLuong")
    public ResponseEntity<?> checkSoLuong(@RequestBody Map<String, Object> requestBody) {
        String idKhachHang = String.valueOf(requestBody.get("idKhachHang"));
        String idChiTietSanPham = String.valueOf(requestBody.get("idChiTietSanPham"));
        String soLuong = String.valueOf(requestBody.get("soLuong"));
        ChiTietSanPham chiTietSanPham = chiTietSanPhamServivce.getChiTietSanPham(Integer.parseInt(idChiTietSanPham));
        Integer soLuongCu = 0;
        Integer soLuongCheck = 0;
        Integer soLuongToiDa = 0;
        if (chiTietGioHangRepository.getListChiTietGioHangByKhachHang(Integer.parseInt(idKhachHang)).isEmpty()) {
            if (Integer.parseInt(soLuong) <= chiTietSanPham.getSoLuong()) {

                return ResponseEntity.ok("ok");
            } else {
                return ResponseEntity.ok(chiTietSanPham.getSoLuong());
            }
        } else {
            List<ChiTietGioHang> listCTGH = chiTietGioHangRepository.getListChiTietGioHangByKhachHang(Integer.parseInt(idKhachHang));
            for (int i = 0; i < listCTGH.size(); i++) {
                if (listCTGH.get(i).getIdChiTietSanPham() == Integer.parseInt(idChiTietSanPham)) {
                    soLuongCu = listCTGH.get(i).getSoLuong();
                }
            }
            soLuongCheck = Integer.parseInt(soLuong) + soLuongCu;
            soLuongToiDa = chiTietSanPham.getSoLuong() - soLuongCu;

            if (soLuongCheck <= chiTietSanPham.getSoLuong()) {
                return ResponseEntity.ok("ok");

            } else {
                return ResponseEntity.ok(soLuongToiDa);
            }
        }
    }

    @PostMapping("/edit-soLuong-checkout")
    public ResponseEntity<?>checkSoLuongInput(@RequestBody Map<String, Object> requestBody){
        String idKhachHang = String.valueOf(requestBody.get("idKhachHang"));
        String idChiTietSanPham = String.valueOf(requestBody.get("idChiTietSanPham"));
        String soLuong = String.valueOf(requestBody.get("soLuong"));
        int idGioHang = gioHangService.getIdGioHang(Integer.valueOf(idKhachHang));
        ChiTietGioHangRequestDto chiTietGioHangRequestDto = new ChiTietGioHangRequestDto();
        chiTietGioHangRequestDto.setSoLuong(Integer.parseInt(soLuong));
        chiTietGioHangRequestDto.setIdGioHang(idGioHang);
        chiTietGioHangRequestDto.setIdChiTietSanPham(Integer.parseInt(idChiTietSanPham));

        ChiTietSanPham chiTietSanPham = chiTietSanPhamServivce.getChiTietSanPham(Integer.parseInt(idChiTietSanPham));
        if(Integer.parseInt(soLuong)<0){
            return ResponseEntity.ok("am");
        }else if(Integer.parseInt(soLuong)==0){
            return ResponseEntity.ok(0);
        }else {
            if(chiTietSanPham.getSoLuong()>=Integer.parseInt(soLuong)){
                chiTietGioHangService.editChiTietGioHang(idGioHang,Integer.parseInt(idChiTietSanPham),chiTietGioHangRequestDto);
                return ResponseEntity.ok("ok");
            }else {
                return ResponseEntity.ok(chiTietSanPham.getSoLuong());
            }
        }

    }

    @PostMapping("/add-to-cart-buyer")
    public ResponseEntity<?> addToCartByBuyer(@RequestBody Map<String, Object> requestBody) {
        String idKhachHang = String.valueOf(requestBody.get("idKhachHang"));
        String idChiTietSanPham = String.valueOf(requestBody.get("idChiTietSanPham"));
        String soLuong = String.valueOf(requestBody.get("soLuong"));
        int idGioHang = gioHangService.getIdGioHang(Integer.valueOf(idKhachHang));
        ChiTietSanPham chiTietSanPham = chiTietSanPhamServivce.getChiTietSanPham(Integer.parseInt(idChiTietSanPham));
        Integer soLuongCu = 0;
        Integer soLuongMoi = 0;
        List<ChiTietGioHang> listCTGH = chiTietGioHangRepository.getListChiTietGioHangByKhachHang(Integer.parseInt(idKhachHang));
        if (listCTGH.isEmpty()) {
            System.out.println("th1");
            ChiTietGioHangRequestDto ct = new ChiTietGioHangRequestDto();
            ct.setSoLuong(Integer.parseInt(soLuong));
            ct.setIdGioHang(idGioHang);
            ct.setIdChiTietSanPham(Integer.parseInt(idChiTietSanPham));
            chiTietGioHangService.addChiTietGioHang(ct);
            return ResponseEntity.ok("ok");
        } else {
            System.out.println("th2");
            for (ChiTietGioHang ctgh : listCTGH
            ) {
                if (ctgh.getIdChiTietSanPham() == Integer.parseInt(idChiTietSanPham)) {
                    soLuongCu = ctgh.getSoLuong();
                    soLuongMoi = soLuongCu + Integer.parseInt(soLuong);
                }
            }
            ChiTietGioHangRequestDto ct2 = new ChiTietGioHangRequestDto();
            if (soLuongMoi == 0) {
                soLuongMoi = Integer.parseInt(soLuong);
            }
            ct2.setSoLuong(soLuongMoi);
            ct2.setIdGioHang(idGioHang);
            ct2.setIdChiTietSanPham(Integer.parseInt(idChiTietSanPham));
            chiTietGioHangService.addChiTietGioHang(ct2);
            return ResponseEntity.ok("ok");
        }
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



    @GetMapping("/product/{id}")
    public String productDetailById(Model model, @PathVariable int id) {
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        model.addAttribute("khachHang", khachHang);
        model.addAttribute("soLuongSanPhamGioHang", soLuongSanPhamGioHang);

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
        KhachHang khachHang = orderData.getKhachHang();
        System.out.println("nham neees");
        HoaDon hoaDon = orderData.getHoadon();
        hoaDon.setThoiGianTao(utils.getCurrentDateTime());
        hoaDon.setKhachHang(khachHang);
        hoaDon.setTrangThai(2);
        hoaDonService.saveHoaDon(hoaDon);
        hoaDon.setId(hoaDon.getId());
        hoaDon.setMaHoaDon("HDOL" + hoaDon.getId());
        hoaDonService.saveHoaDon(hoaDon);


        for (ChiTietHoaDon o : orderData.getCart()) {
            o.setIdHoaDon(hoaDon.getId());
            hoaDonChiTietService.saveProductForCart(o.getIdHoaDon(), o.getIdCtSanPham(), o.getSoLuong(), o.getGia());
        }
        return "ban-hang-online/home/index";

    }

    double tongTien = 0;

    @PostMapping("/sendMail")
    public ResponseEntity<?> sendMailXN(@RequestBody OderDataDto orderData) {
        List<ChiTietHoaDon> cart = orderData.getCart();
        if (cart == null || cart.isEmpty()) {
            return new ResponseEntity<>("Cart is empty", HttpStatus.BAD_REQUEST);
        }

        String email = orderData.getHoadon().getEmailNguoiNhan();
        String tenKh = orderData.getHoadon().getTenNguoiNhan();
        DecimalFormat decimalFormat = new DecimalFormat("#,### đ");
        LocalDate ngayDatHang = LocalDate.now();

        if (email != null && !email.isEmpty()) {
            for (ChiTietHoaDon chiTietHoaDon : cart) {
                tongTien += chiTietHoaDon.getSoLuong() * chiTietHoaDon.getGia();
            }
            MimeMessagePreparator messagePreparator = mimeMessage -> {
                MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                messageHelper.setTo(email);
                messageHelper.setSubject("Xác nhận đơn hàng từ SixDo Shop");

                StringBuilder htmlContent = new StringBuilder();
                htmlContent.append("<html>");
                htmlContent.append("<head><title>Xác nhận đơn hàng</title></head>");
                htmlContent.append("<body>");
                htmlContent.append("<h2>Xác nhận đơn hàng của bạn</h2>");
                htmlContent.append("<p>Kính gửi ").append(tenKh).append(",</p>");
                htmlContent.append("<p>Chúng tôi xin trân trọng thông báo rằng đơn hàng của bạn đã được nhận và đang được xử lý.</p>");
                htmlContent.append("<p>Dưới đây là các thông tin chi tiết về đơn hàng của bạn:</p>");
                htmlContent.append("<ul>");
                htmlContent.append("<li>Ngày đặt hàng: ").append(ngayDatHang).append("</li>");
                htmlContent.append("<li>Sản phẩm đặt hàng:</li>");
                htmlContent.append("<ul>");
                for (ChiTietHoaDon chiTietHoaDon : cart) {
                    htmlContent.append("<li>");
                    htmlContent.append("Tên sản phẩm: ").append(chiTietSanPhamServivce.getChiTietSanPham(chiTietHoaDon.getIdCtSanPham()).getSanPham().getTenSanPham());
                    htmlContent.append(" ");
                    htmlContent.append("Màu Sắc: ").append(chiTietSanPhamServivce.getChiTietSanPham(chiTietHoaDon.getIdCtSanPham()).getMauSac().getTenMauSac());
                    htmlContent.append(", Số lượng: ").append(chiTietHoaDon.getSoLuong());
                    htmlContent.append(", Đơn giá: ").append(decimalFormat.format(chiTietHoaDon.getGia()));
                    htmlContent.append("</li>");
                }
                htmlContent.append("</ul>");
                htmlContent.append("<li>Tổng số tiền: ").append(decimalFormat.format(tongTien)).append("( Chưa bao gồm phí vận chuyển và thuế)</li>");
                htmlContent.append("</ul>");
                htmlContent.append("<p>Vui lòng kiểm tra thông tin đơn hàng của bạn. Nếu có bất kỳ thắc mắc hoặc yêu cầu bổ sung, vui lòng liên hệ với chúng tôi ngay qua email hoặc số điện thoại được cung cấp dưới đây.</p>");
                htmlContent.append("<p>Chúng tôi sẽ tiếp tục cập nhật thông tin về quá trình xử lý của đơn hàng và sẽ thông báo cho bạn khi đơn hàng được vận chuyển.</p>");
                htmlContent.append("<p>Xin chân thành cảm ơn và chúc Quý khách một ngày tốt lành!</p>");
                htmlContent.append("<p>Trân trọng,<br>Đội ngũ hỗ trợ khách hàng<br>Cửa Hàng Sixdo</p>");
                htmlContent.append("<p>Email: hieutdph29698@gmail.com<br>Điện thoại: 0123 456 789</p>");
                htmlContent.append("</body>");
                htmlContent.append("</html>");

                messageHelper.setText(htmlContent.toString(), true);
            };

            emailService.sendEmail(messagePreparator);
        }
        return ResponseEntity.ok("Email sent successfully");
    }


    @GetMapping("product-favorite")
    public String productFavorite(Model model) {
        KhachHang khachHang = (KhachHang) session.getAttribute("buyer");
        idKhachHangFinal = khachHang != null ? khachHang.getId() : 0;
        model.addAttribute("khachHang", khachHang);

        model.addAttribute("soLuongSanPhamGioHang", khachHang != null ? soLuongSanPhamGioHang(khachHang.getId()) : 0);
        soLuongSanPhamGioHang = khachHang != null ? soLuongSanPhamGioHang(khachHang.getId()) : 0;
        List<ProductHomeRequest> productHomeRequestList = sanPhamService.listHienThiSanPham();


        model.addAttribute("listSp", productHomeRequestList);
        return "ban-hang-online/home/product-favorite";
    }
}
