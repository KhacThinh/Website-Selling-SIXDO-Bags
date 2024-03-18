package com.bags.sixdoBag.controller;


import com.bags.sixdoBag.config.HoaDonPDFExporter;
import com.bags.sixdoBag.model.dto.request.XoaSanPhamRequest;
import com.bags.sixdoBag.model.entitys.*;
import com.bags.sixdoBag.model.repository.ChiTietHoaDonRepository;
import com.bags.sixdoBag.model.repository.ChiTietSanPhamRepository;
import com.bags.sixdoBag.model.repository.HoaDonRepository;
import com.bags.sixdoBag.model.repository.KhachHangRepository;
import com.bags.sixdoBag.service.*;
import com.bags.sixdoBag.service.impl.Utils;
import com.lowagie.text.DocumentException;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.UrlResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("ban-tai-quay")
@RequiredArgsConstructor
public class BanHangTaiQuayController {
    Utils utils = new Utils();

    private final SanPhamService sanPhamService;

    private final ChiTietSanPhamServivce chiTietSanPhamServivce;

    private final DoiTuongSuDungService doiTuongSuDungService;

    private final MauSacService mauSacService;

    private final HoaDonService hoaDonService;

    private final HoaDonChiTietService hoaDonChiTietService;

    private final HoaDonRepository hoaDonRepository;

    private final ChiTietHoaDonRepository chiTietHoaDonRepository;

    private final KhachHangRepository khachHangRepository;

    private final KhachHangService khachHangService;

    private final ChiTietSanPhamRepository chiTietSanPhamRepository;

    @GetMapping("")
    public String hienThi(Model model) {
        extracted(model, -1);
        return "/ban-hang-tai-quay/home";
    }

    @GetMapping("/{id}")
    public String hienThiProductById(Model model,  @PathVariable int id) {
        extracted(model, id);

        return "/ban-hang-tai-quay/edit-invoice";
    }


    @PostMapping("/search")
    public ResponseEntity<?> hienThiSanPham(Model model, @RequestParam("name") String name) {
        System.out.println("name: " + name);
        extracted(model, -1);

        List<ChiTietSanPham> list = new ArrayList<>();
        if (Objects.isNull(name)) {
            list = chiTietSanPhamRepository.getListCtspTaiQuay();
            return ResponseEntity.ok(list);
        } else {
            list = chiTietSanPhamServivce.searchChiTietSanPhams(name);
            return ResponseEntity.ok(list);
        }
    }

    private void extracted(Model model, int id) {
        Set<String> tenChatLieuSelects = sanPhamService.getSanPhams().stream().filter(sp -> sp.getChatLieu() != null && !sp.getChatLieu().isEmpty()).map(SanPham::getChatLieu).collect(Collectors.toSet());
        List<String> doiTuongSuDungs = doiTuongSuDungService.getListDoiTuongSuDung().stream().map(DoiTuongSuDung::getTenDoiTuongSuDung).collect(Collectors.toList());
        List<String> mauSacs = mauSacService.getMauSacs().stream().map(MauSac::getTenMauSac).toList();
        model.addAttribute("chatLieus", tenChatLieuSelects);
        model.addAttribute("doiTuongSuDungs", doiTuongSuDungs);
        model.addAttribute("mauSacs", mauSacs);

        if (id > 0) {
            List<ChiTietHoaDon> listHoaDonChiTiet = hoaDonChiTietService.getGioHangTaiQuay(id);
            HoaDon hoaDonEdit = hoaDonService.getHoaDonById(id);
            model.addAttribute("tabs", hoaDonEdit);
            model.addAttribute("productsEdit", listHoaDonChiTiet);

            return;
        }


        List<HoaDon> listTab = hoaDonService.getTabHoaDon();
        List<HoaDon> danhSachTab = new ArrayList<>();
        for (HoaDon o : listTab) {
            if (o.getTrangThai() == 1) {
                danhSachTab.add(o);
            }

        }
        model.addAttribute("tabs", danhSachTab);

    }


    @PostMapping("/them-hoa-don")
    public ResponseEntity<?> themHoaDon(Model model) {
        hoaDonService.themHoaDon();
        List<HoaDon> listTab = hoaDonService.getTabHoaDon();
        List<HoaDon> danhSachTab = new ArrayList<>();
        for (HoaDon o : listTab) {
            if (o.getTrangThai() == 1) {
                danhSachTab.add(o);
            }

        }
        return ResponseEntity.ok(danhSachTab);
    }

    @PostMapping("/kiem-tra-so-luong-trong-kho")
    public ResponseEntity<?> checkQuantity(@RequestParam("productId") Integer id, @RequestParam("quantity") Integer quantity){
        ChiTietSanPham chiTietSanPham= chiTietSanPhamServivce.getChiTietSanPham(id);
        if(chiTietSanPham != null){
            if(chiTietSanPham.getSoLuong()>= quantity){
                return ResponseEntity.ok("ok");

            }else{
                return ResponseEntity.ok("no");
            }
        }else{
            return ResponseEntity.ok("no");
        }

    }

    @PostMapping("/them-gio-hang")
    public ResponseEntity<?> themGioHang(@RequestBody Map<String, Object> requestBody) {
        String productId = String.valueOf(requestBody.get("productId"));
        String idTabString = String.valueOf(requestBody.get("tabActive"));
        String giaBanString = String.valueOf(requestBody.get("giaBan"));
        String soLuongString = String.valueOf(requestBody.get("quantity"));

        int idTab = Integer.parseInt(idTabString.substring(2));
        System.out.println("tabsstring" + idTab);

        ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
        chiTietHoaDon.setIdCtSanPham(Integer.valueOf(productId));
        chiTietHoaDon.setSoLuong(Integer.valueOf(soLuongString));
        chiTietHoaDon.setGia((double) Integer.valueOf(giaBanString));
        chiTietHoaDon.setIdHoaDon(idTab);
        hoaDonChiTietService.addGioHang(chiTietHoaDon);
//        int soLuongKho = chiTietSanPhamServivce.getSoLuongSanPhamById(Integer.valueOf(productId));
//        chiTietSanPhamServivce.updateSoLuongSanPham(soLuongKho-1,Integer.valueOf(productId));
        return ResponseEntity.ok().build();
    }


    @PostMapping("/them-gio-hang-qr")
    public ResponseEntity<?> themGioHangQr(@RequestBody Map<String, Object> requestBody) {
        String maSanPham = String.valueOf(requestBody.get("maSanPham"));
        String idTabString = String.valueOf(requestBody.get("tabActive"));
        ChiTietSanPham chiTietSanPham = chiTietSanPhamServivce.searchByMaSanPham(maSanPham);

        if (Objects.nonNull(chiTietSanPham)) {
            Integer productId = chiTietSanPham.getId();
            int idTab = Integer.parseInt(idTabString.substring(2));
            System.out.println("tabsstring" + idTab);

            ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
            chiTietHoaDon.setIdCtSanPham(productId);
            chiTietHoaDon.setSoLuong(1);
            chiTietHoaDon.setGia((double) chiTietSanPham.getGiaBan());
            chiTietHoaDon.setIdHoaDon(idTab);
            hoaDonChiTietService.addGioHang(chiTietHoaDon);
        }
        return ResponseEntity.ok().build();

    }

    @PostMapping("/get-gio-hang")
    public ResponseEntity<?> getGioHang(@RequestBody Map<String, Object> requestBody) {
        String idTabString = String.valueOf(requestBody.get("maHoaDon"));
        int idTab = Integer.parseInt(idTabString.substring(2));
        System.out.println("idddđ tab là :  " + idTab);
        List<ChiTietHoaDon> listHoaDonChiTiet = hoaDonChiTietService.getGioHangTaiQuay(idTab);
        System.out.println("listHoaDonchi = " + listHoaDonChiTiet.size());
        return ResponseEntity.ok(listHoaDonChiTiet);
    }

    @PostMapping("/filter")
    @ResponseBody
    public List<ChiTietSanPham> filterProducts
            (@RequestParam("chatLieu") String chatLieu,
             @RequestParam("doiTuongSuDung") String doiTuongSuDung,
             @RequestParam("mauSac") String mauSac, Model model
            ) {
        extracted(model, -1);
        List<ChiTietSanPham> listSearchCTSP = chiTietSanPhamServivce.filterTaiQuay(chatLieu, mauSac, doiTuongSuDung);

        return listSearchCTSP;
    }


    @PostMapping("/update-so-luong-san-pham")
    public ResponseEntity<?> updateSoLuongSanPham(@RequestBody Map<String, Object> requestBody) {
        String idTabString = String.valueOf(requestBody.get("maHoaDon"));
        String idCtSanPhamString = String.valueOf(requestBody.get("idChiTietSanPham"));
        String soLuongString = String.valueOf(requestBody.get("soLuong"));
        String tongGiaSanPhamString = String.valueOf(requestBody.get("giaSanPham"));
        int idTab = Integer.parseInt(idTabString.substring(2));
        ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
        chiTietHoaDon.setSoLuong(Integer.valueOf(soLuongString));
        chiTietHoaDon.setGia(Double.valueOf(tongGiaSanPhamString));
        hoaDonChiTietService.updateChiTietHoaDon(idTab, Integer.valueOf(idCtSanPhamString), chiTietHoaDon);


        return ResponseEntity.ok().build();
    }


    @PostMapping("/thanh-toan")
    public ResponseEntity<?> thanhToan(@RequestBody Map<String, Object> requestBody) {
        String idTabString = String.valueOf(requestBody.get("maHoaDon"));
        String tenKhachHang = String.valueOf(requestBody.get("tenKhachHang"));
        String soDienThoai = String.valueOf(requestBody.get("soDienThoai"));
        String tongDonHangString = String.valueOf(requestBody.get("tongGiaTri"));

        int idTab = Integer.parseInt(idTabString.substring(2));

        List<ChiTietHoaDon> chiTietHoaDons = hoaDonChiTietService.getGioHangChiTietFromHoaDon(idTab);
        for (ChiTietHoaDon cthd : chiTietHoaDons) {
            ChiTietSanPham ctsp = (ChiTietSanPham) chiTietSanPhamServivce.getChiTietSanPham(cthd.getIdCtSanPham());
            ctsp.setSoLuong(ctsp.getSoLuong() - cthd.getSoLuong());
        }

        HoaDon hoaDon = new HoaDon();
        hoaDon.setTrangThai(0);
        hoaDon.setSdtNguoiNhan(soDienThoai);
        hoaDon.setTenNguoiNhan(tenKhachHang);
        hoaDon.setTongTien((double) Integer.valueOf(tongDonHangString));
        hoaDon.setThoiGianXacNhan(utils.getCurrentDateTime());
        hoaDon.setThoiGianThanhToan(utils.getCurrentDateTime());
        hoaDonService.updateHoaDon(idTab, hoaDon);
        List<HoaDon> listTab = hoaDonService.getTabHoaDon();
        List<HoaDon> danhSachTab = new ArrayList<>();
        for (HoaDon o : listTab) {
            if (o.getTrangThai() == 1) {
                danhSachTab.add(o);
            }
        }

        return ResponseEntity.ok(danhSachTab);
    }

    @PostMapping("/xoa-hoa-don")
    public ResponseEntity<?> xoaHoaDon(@RequestBody Map<String, Object> requestBody) {
        String idTabString = String.valueOf(requestBody.get("maHoaDon"));
        int idTab = Integer.parseInt(idTabString.substring(2));

        hoaDonChiTietService.deleteHoaDonChiTietById(idTab);
        hoaDonService.deleteHoaDonById(idTab);

        List<HoaDon> danhSachTab = new ArrayList<>();
        for (HoaDon o : hoaDonService.getTabHoaDon()) {
            if (o.getTrangThai() == 1) {
                danhSachTab.add(o);
            }
        }

        return ResponseEntity.ok(danhSachTab);
    }

    @PostMapping("/xoa-san-pham-gio-hang")
    public ResponseEntity<?> xoaSanPhamGioHang(@RequestBody XoaSanPhamRequest request) {
        Integer id = request.getId();
        String maHd = request.getMaHoaDon();
        System.out.println("idctspp" + id);
        System.out.println("mahdd" + maHd);
        HoaDon hoaDon = hoaDonRepository.getHoaDonByMaHoaDon(maHd);
        Integer idHD = hoaDon.getId();
        System.out.println(idHD);

        try {
            chiTietHoaDonRepository.deleteChiTietHoaDonByIdChiTietSp(idHD, id);
        } catch (Exception e) {
            String loi = e.getMessage();
            if (loi.contains("The statement did not return a result set")) {
                System.out.println("khum saooo!");
            }
        }

        return ResponseEntity.ok("ok");
    }

    @GetMapping("/kiemTraKhachHang")
    @ResponseBody
    public String kiemTraKhachHang(@RequestParam("soDienThoai") String soDienThoai) {
        KhachHang khachHang = khachHangRepository.searchBySdt(soDienThoai);
        if (khachHang == null) {
            return "";
        } else {
            return khachHang.getTenKhachHang();
        }

    }

    @PostMapping("/themKhachHang")
    public ResponseEntity<?> themKhachHang(@RequestParam("soDienThoai") String sdt, @RequestParam("tenKhachHang") String tenKh) {
        KhachHang khachHang = khachHangRepository.searchBySdt(sdt);

        if (khachHang == null || khachHang.getId() == null) {
            KhachHang kh = new KhachHang();
            kh.setTenKhachHang(tenKh);
            kh.setSdt(sdt);
            kh.setEmail("abc" + khachHangRepository.count() + "@gmail.com");
            khachHangService.addKhachHang(kh);
            return ResponseEntity.ok("success");
        } else {
            return ResponseEntity.ok("error");
        }
    }

    @PostMapping("/searchModal")
    public ResponseEntity<?> searchModal(@RequestParam("keyword") String keyword, Model model) {
        extracted(model, -1);
        List<ChiTietSanPham> list = chiTietSanPhamServivce.searchChiTietSanPhams(keyword);
        return ResponseEntity.ok(list);
    }


    @GetMapping("/export")
    public void exportToPDF(HttpServletResponse response, @RequestParam(value = "maHoaDon") String maHd) {
        HoaDon hoaDon = hoaDonRepository.getHoaDonByMaHoaDon(maHd);
        System.out.println("hello000001" + hoaDon.getThoiGianTao());
        if (Objects.nonNull(hoaDon)) {
            List<ChiTietHoaDon> chiTietHoaDons = hoaDonChiTietService.getGioHangChiTietFromHoaDon(hoaDon.getId());
            DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
            String currentDateTime = dateFormatter.format(new Date());

            String headerKey = "Content-Disposition";
            String headerValue = "attachment; filename=" + hoaDon.getMaHoaDon() + currentDateTime + ".pdf";
            response.setHeader(headerKey, headerValue);

            HoaDonPDFExporter exporter = new HoaDonPDFExporter(hoaDon, chiTietHoaDons);
            try {
                byte[] pdfBytes = exporter.export();
                response.getOutputStream().write(pdfBytes);
            } catch (IOException | DocumentException e) {
                // Xử lý ngoại lệ nếu có
                e.printStackTrace();
            }
        }
//        return "redirect:/ban-tai_quay";
    }



}