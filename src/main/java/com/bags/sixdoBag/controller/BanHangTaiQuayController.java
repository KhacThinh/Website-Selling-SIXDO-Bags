package com.bags.sixdoBag.controller;


import com.bags.sixdoBag.config.HoaDonPDFExporter;
import com.bags.sixdoBag.model.dto.request.XoaSanPhamRequest;
import com.bags.sixdoBag.model.dto.response.HoaDonResponse;
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
import jakarta.servlet.http.HttpSession;
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
private final CuaHangService cuaHangService;



    @GetMapping(value = {"", "/demo"})
    public String hienThi(Model model, HttpSession session) {
        NhanVien quanLy = (NhanVien) session.getAttribute("quanLy");
        NhanVien nv = (NhanVien) session.getAttribute("nhanVien");
        if (quanLy == null && nv == null) {
            return "redirect:/login/hien-thi";
        } else if (quanLy != null) {
            model.addAttribute("nhanVien", quanLy);
        } else if (nv != null) {
            model.addAttribute("nhanVien", nv);
        }
        extracted(model, -1);
        return "/ban-hang-tai-quay/home";
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

            HoaDonPDFExporter exporter = new HoaDonPDFExporter(hoaDon, chiTietHoaDons, cuaHangService.getCuaHang());
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

    List<ChiTietHoaDon> listCTHDTruoc = new ArrayList<>();
    private int previousId = -1;

    @GetMapping(value = {"/{id}"})
    public String hienThiProductById(Model model, @PathVariable int id) {

        HoaDon hoaDon = hoaDonService.getHoaDonById(id);
        Integer trangThai = hoaDon.getTrangThai();

        if (trangThai == 3) {
            if (id != previousId) {
                listCTHDTruoc = chiTietHoaDonRepository.getGioHangChiTiet(id);
                previousId = id;
            }
            extracted(model, id);
            return "/ban-hang-tai-quay/edit-invoice";
        } else {
            extracted(model, id);
            return "/ban-hang-tai-quay/xacNhan";
        }
    }

    //hủy đơn hàng
    @PostMapping("/xoa-hoaDon")
    public ResponseEntity<?> xoaHoaDon(@RequestParam("id") Integer id, @RequestParam("lyDoHuy") String lyDoHuy) {
        HoaDon hoaDon = hoaDonService.getHoaDonById(id);
        if (hoaDon.getTrangThai() != 6) {
            if (hoaDon.getTrangThai() != 4) {
                if (hoaDon.getTrangThai() != 5) {
                    if (hoaDon.getTrangThai() == 2) {
                        hoaDon.setTrangThai(4);
                        hoaDonService.editHoaDon(id, hoaDon);
                        return ResponseEntity.ok("ok");
                    } else {
                        System.out.println("trang thai 3");
                        for (ChiTietHoaDon cthd : listCTHDTruoc
                        ) {
                            ChiTietSanPham chiTietSanPham = chiTietSanPhamServivce.getChiTietSanPham(cthd.getIdCtSanPham());
                            chiTietSanPham.setSoLuong(chiTietSanPham.getSoLuong() + cthd.getSoLuong());
                        }
                        hoaDon.setLyDoKhachHuy(lyDoHuy);
                        hoaDon.setTrangThai(4);
                        hoaDonService.editHoaDon(id, hoaDon);
                        return ResponseEntity.ok("ok");
                    }
                } else {
                    return ResponseEntity.ok("errorGiaoHang");
                }

            } else {
                return ResponseEntity.ok("error");
            }
        } else {
            return ResponseEntity.ok("errorTrangThai6");
        }


    }


    //hủy đơn hàng form ls-hd
    @PostMapping("/huy-hoaDon")
    public ResponseEntity<?> huyHoaDon(@RequestParam("id") Integer id) {
        HoaDon hoaDon = hoaDonService.getHoaDonById(id);
        List<ChiTietHoaDon> chiTietHoaDonList = chiTietHoaDonRepository.getGioHangChiTiet(hoaDon.getId());
        if (hoaDon.getTrangThai() != 6) {
            if (hoaDon.getTrangThai() != 4) {
                if (hoaDon.getTrangThai() != 5) {

                } else {
                    return ResponseEntity.ok("errorGiaoHang");
                }
                if (hoaDon.getTrangThai() == 2) {
                    hoaDon.setTrangThai(4);
                    hoaDonService.editHoaDon(id, hoaDon);
                    return ResponseEntity.ok("ok");
                } else {
                    System.out.println("trang thai 3");
                    for (ChiTietHoaDon cthd : chiTietHoaDonList
                    ) {
                        ChiTietSanPham chiTietSanPham = chiTietSanPhamServivce.getChiTietSanPham(cthd.getIdCtSanPham());
                        chiTietSanPham.setSoLuong(chiTietSanPham.getSoLuong() + cthd.getSoLuong());
                    }
                    hoaDon.setTrangThai(4);
                    hoaDonService.editHoaDon(id, hoaDon);
                    return ResponseEntity.ok("ok");
                }
            } else {
                return ResponseEntity.ok("error");
            }
        } else {
            return ResponseEntity.ok("errorTrangThai6");
        }


    }


    //check trạng thái ctsp form giao hàng
    @PostMapping("/check-trangThai-ctsp-giaoHang")
    public ResponseEntity<?> checkTrangThai(@RequestParam("id") Integer id) {
        System.out.println("checkslgiao hang");
        HoaDon hoaDon = hoaDonService.getHoaDonById(id);
        List<ChiTietHoaDon> chiTietHoaDons = chiTietHoaDonRepository.getGioHangChiTiet(id);
        List<ChiTietSanPham> listCTSPTrangThai = new ArrayList<>();
        if (hoaDon.getTrangThai() != 6) {
            if (hoaDon.getTrangThai() != 4) {
                for (ChiTietHoaDon cthd : chiTietHoaDons
                ) {
                    if (cthd.getChiTietSanPham().getTrangThai() == 0) {
                        listCTSPTrangThai.add(cthd.getChiTietSanPham());
                    }
                }
                return ResponseEntity.ok(listCTSPTrangThai);
            } else {
                return ResponseEntity.ok("errorHuyHoaDon");
            }
        } else {
            return ResponseEntity.ok("errorTrangThai6");
        }


    }

    //check số lượng sp trong kho form giao hàng online
    @PostMapping("/check-soLuong-giaoHang")
    public ResponseEntity<?> checkSoLuongGiaoHang(@RequestParam("id") Integer id) {
        List<ChiTietHoaDon> listCTHDSau = hoaDonChiTietService.getGioHangChiTietFromHoaDon(id);
        List<ChiTietSanPham> listCTSPVuotQuaSoLuong = new ArrayList<>();

        for (ChiTietHoaDon cthdt : listCTHDTruoc
        ) {
            int i = 0;
            for (ChiTietHoaDon cthds : listCTHDSau
            ) {
                int size = listCTHDSau.size();

                ChiTietSanPham chiTietSanPhamSau = chiTietSanPhamServivce.getChiTietSanPham(cthds.getIdCtSanPham());
                ChiTietSanPham chiTietSanPhamTruoc = chiTietSanPhamServivce.getChiTietSanPham(cthdt.getIdCtSanPham());
                System.out.println("trc" + chiTietSanPhamTruoc.getId() + "/");
                System.out.println("sau" + chiTietSanPhamSau.getId() + "/");


                if (chiTietSanPhamSau == chiTietSanPhamTruoc) {
                    System.out.println("trùng");
                    if (cthds.getSoLuong() > cthdt.getSoLuong()) {
                        if (chiTietSanPhamSau.getSoLuong() < (cthds.getSoLuong() - cthdt.getSoLuong())) {
                            listCTSPVuotQuaSoLuong.add(chiTietSanPhamSau);
                        }
                    }
                }
            }
        }

        for (ChiTietHoaDon cthdsau : listCTHDSau
        ) {
            int i = 0;
            for (ChiTietHoaDon cthdtruoc : listCTHDTruoc
            ) {
                ChiTietSanPham chiTietSanPhamSau = chiTietSanPhamServivce.getChiTietSanPham(cthdsau.getIdCtSanPham());
                ChiTietSanPham chiTietSanPhamTruoc = chiTietSanPhamServivce.getChiTietSanPham(cthdtruoc.getIdCtSanPham());
                if (chiTietSanPhamSau != chiTietSanPhamTruoc) {
                    i++;
                    if (i == listCTHDTruoc.size()) {
                        if (chiTietSanPhamSau.getSoLuong() < cthdsau.getSoLuong()) {
                            listCTSPVuotQuaSoLuong.add(chiTietSanPhamSau);
                        }
                    }
                }
            }
        }
        return ResponseEntity.ok(listCTSPVuotQuaSoLuong);


    }


    //giao hàng online
    @GetMapping("/giaoHang")
    public ResponseEntity<?> giaoHang(@RequestParam("id") Integer id,
                                      @RequestParam("tenNguoiNhan") String tenNguoiNhan,
                                      @RequestParam("sdtNguoiNhan") String sdtNguoiNhan,
                                      @RequestParam("emailNguoiNhan") String emailNguoiNhan,
                                      @RequestParam("diaChiNguoiNhan") String diaChiNguoiNhan,
                                      @RequestParam("khachThanhToan") double khachThanhToan,
                                      @RequestParam("phiVanChuyen") double phiVanChuyen,
                                      @RequestParam("soTienNo") double soTienNo) {
        System.out.println("kkkkkkkkkk");

        HoaDon hoaDon = hoaDonService.getHoaDonById(id);
        List<ChiTietHoaDon> listCTHDSau = hoaDonChiTietService.getGioHangChiTietFromHoaDon(id);
        List<ChiTietSanPham> listCTSPT = new ArrayList<>();
        List<ChiTietSanPham> listCTSPS = new ArrayList<>();

        for (ChiTietHoaDon ct : listCTHDTruoc
        ) {
            listCTSPT.add(chiTietSanPhamServivce.getChiTietSanPham(ct.getIdCtSanPham()));
        }
        for (ChiTietHoaDon cts : listCTHDSau
        ) {
            listCTSPS.add(chiTietSanPhamServivce.getChiTietSanPham(cts.getIdCtSanPham()));
        }
        System.out.println("trc" + listCTSPT);
        System.out.println("sau" + listCTSPS);
        for (ChiTietHoaDon cthdt : listCTHDTruoc
        ) {
            int i = 0;
            for (ChiTietHoaDon cthds : listCTHDSau
            ) {
                int size = listCTHDSau.size();

                ChiTietSanPham chiTietSanPhamSau = chiTietSanPhamServivce.getChiTietSanPham(cthds.getIdCtSanPham());
                ChiTietSanPham chiTietSanPhamTruoc = chiTietSanPhamServivce.getChiTietSanPham(cthdt.getIdCtSanPham());
                System.out.println("trc" + chiTietSanPhamTruoc.getId() + "/");
                System.out.println("sau" + chiTietSanPhamSau.getId() + "/");
                if (chiTietSanPhamSau == chiTietSanPhamTruoc) {
                    System.out.println("trùng");
                    if (cthds.getSoLuong() > cthdt.getSoLuong()) {
                        chiTietSanPhamSau.setSoLuong(chiTietSanPhamSau.getSoLuong() - (cthds.getSoLuong() - cthdt.getSoLuong()));
                    } else if (cthds.getSoLuong() < cthdt.getSoLuong()) {
                        chiTietSanPhamSau.setSoLuong(chiTietSanPhamSau.getSoLuong() - (cthds.getSoLuong() - cthdt.getSoLuong()));
                    }
                } else {
                    i++;
                    System.out.println("khac nhau");
                    if (i == size) {
                        chiTietSanPhamTruoc.setSoLuong(chiTietSanPhamTruoc.getSoLuong() + cthdt.getSoLuong());
                    }
                }
            }
        }
        for (ChiTietHoaDon cthdsau : listCTHDSau
        ) {
            int i = 0;
            for (ChiTietHoaDon cthdtruoc : listCTHDTruoc
            ) {
                ChiTietSanPham chiTietSanPhamSau = chiTietSanPhamServivce.getChiTietSanPham(cthdsau.getIdCtSanPham());
                ChiTietSanPham chiTietSanPhamTruoc = chiTietSanPhamServivce.getChiTietSanPham(cthdtruoc.getIdCtSanPham());
                if (chiTietSanPhamSau != chiTietSanPhamTruoc) {
                    i++;
                    if (i == listCTHDTruoc.size()) {
                        chiTietSanPhamSau.setSoLuong(chiTietSanPhamSau.getSoLuong() - cthdsau.getSoLuong());
                    }
                }
            }
        }
        hoaDon.setTenNguoiNhan(tenNguoiNhan);
        hoaDon.setSdtNguoiNhan(sdtNguoiNhan);
        hoaDon.setEmailNguoiNhan(emailNguoiNhan);
        hoaDon.setDiaChiNguoiNhan(diaChiNguoiNhan);
        hoaDon.setKhachThanhToan(khachThanhToan);
        hoaDon.setPhiVanChuyen(phiVanChuyen);
        hoaDon.setSoTienNo(soTienNo);
        hoaDon.setTrangThai(5);
        hoaDonService.editHoaDon(id, hoaDon);
        return ResponseEntity.ok("ok");
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

    @PostMapping("/saveKhachThanhToan")
    public ResponseEntity<?> saveKhachThanhToan(@RequestParam("maHoaDon") String maHd, @RequestParam("khachThanhToan") Double khachThanhToan) {
        HoaDon hoaDon = hoaDonRepository.getHoaDonByMaHoaDon(maHd);
        hoaDon.setKhachThanhToan(khachThanhToan);
        hoaDonRepository.save(hoaDon);

        return ResponseEntity.ok("ok");
    }

    @PostMapping("/kiem-tra-so-luong-trong-kho")
    public ResponseEntity<?> checkQuantity(@RequestParam("productId") Integer id, @RequestParam("quantity") Integer quantity) {
        System.out.println("dfjkhffh" + id);
        ChiTietSanPham chiTietSanPham = chiTietSanPhamServivce.getChiTietSanPham(id);
        if (chiTietSanPham != null) {
            if (chiTietSanPham.getSoLuong() >= quantity) {
                return ResponseEntity.ok("ok");

            } else {
                return ResponseEntity.ok("no");
            }
        } else {
            return ResponseEntity.ok("no");
        }

    }

    @PostMapping("ban-tai-quay/kiem-tra-so-luong-trong-kho-online")
    public ResponseEntity<?> checkQuantityOnline(@RequestParam("productId") Integer id, @RequestParam("quantity") Integer quantity) {
        ChiTietSanPham chiTietSanPham = chiTietSanPhamServivce.getChiTietSanPham(id);
        System.out.println(id + " " + quantity);
        if (chiTietSanPham != null) {
            if (chiTietSanPham.getSoLuong() >= quantity) {
                return ResponseEntity.ok("ok");

            } else {
                return ResponseEntity.ok("no");
            }
        } else {
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


    @PostMapping("/check-trangThai-ctsp")
    public ResponseEntity<?> checkTrangThaiCtsp(@RequestParam("maHoaDon") String maHd) {
        int idTab = Integer.parseInt(maHd.substring(2));
        List<ChiTietHoaDon> chiTietHoaDons = hoaDonChiTietService.getGioHangChiTietFromHoaDon(idTab);
        if (chiTietHoaDons.isEmpty()) {
            return ResponseEntity.ok("null");

        } else {
            List<ChiTietSanPham> listCTSPTrangThai = new ArrayList<>();

            for (ChiTietHoaDon cthd : chiTietHoaDons
            ) {
                if (cthd.getChiTietSanPham().getTrangThai() == 0) {
                    listCTSPTrangThai.add(cthd.getChiTietSanPham());
                }
            }
            return ResponseEntity.ok(listCTSPTrangThai);
        }

    }


    @PostMapping("/check-soLuong-ctsp")
    public ResponseEntity<?> checkSoLuong(@RequestParam("maHoaDon") String maHd) {
        int idTab = Integer.parseInt(maHd.substring(2));
        List<ChiTietHoaDon> chiTietHoaDons = hoaDonChiTietService.getGioHangChiTietFromHoaDon(idTab);
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


    @PostMapping("/thanh-toan")
    public ResponseEntity<?> thanhToan(@RequestBody Map<String, Object> requestBody) {
        String idTabString = String.valueOf(requestBody.get("maHoaDon"));
        String tenKhachHang = String.valueOf(requestBody.get("tenKhachHang"));
        String soDienThoai = String.valueOf(requestBody.get("soDienThoai"));
        String tongDonHangString = String.valueOf(requestBody.get("tongGiaTri"));

        int idTab = Integer.parseInt(idTabString.substring(2));
        List<ChiTietSanPham> listCtsp = new ArrayList<>();

        List<ChiTietHoaDon> chiTietHoaDons = hoaDonChiTietService.getGioHangChiTietFromHoaDon(idTab);
        if (!chiTietHoaDons.isEmpty()) {
            for (ChiTietHoaDon cthd : chiTietHoaDons) {
                ChiTietSanPham ctsp = (ChiTietSanPham) chiTietSanPhamServivce.getChiTietSanPham(cthd.getIdCtSanPham());
                if (ctsp.getSoLuong() >= cthd.getSoLuong()) {
                    ctsp.setSoLuong(ctsp.getSoLuong() - cthd.getSoLuong());

                } else {
                    listCtsp.add(ctsp);
                }
            }
            if (listCtsp.isEmpty()) {
                HoaDon hoaDon = new HoaDon();
                hoaDon.setTrangThai(0);
                hoaDon.setSdtNguoiNhan(soDienThoai);
                if (tenKhachHang.isBlank()) {
                    hoaDon.setTenNguoiNhan("Khách Lẻ");
                } else {
                    hoaDon.setTenNguoiNhan(tenKhachHang);

                }
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
            } else {
                return ResponseEntity.ok(listCtsp);
            }
        } else {
            return ResponseEntity.ok("null");
        }
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





}