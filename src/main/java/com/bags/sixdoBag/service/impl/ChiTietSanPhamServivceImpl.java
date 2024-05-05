package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.dto.request.ChiTietSanPhamRequest;
import com.bags.sixdoBag.model.entitys.*;
import com.bags.sixdoBag.model.repository.ChiTietSanPhamRepository;
import com.bags.sixdoBag.service.ChiTietSanPhamServivce;
import com.bags.sixdoBag.service.KhuyenMaiService;
import com.bags.sixdoBag.service.MauSacService;
import com.bags.sixdoBag.service.SanPhamService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ChiTietSanPhamServivceImpl implements ChiTietSanPhamServivce {

    private final ChiTietSanPhamRepository chiTietSanPhamRepository;

    private final SanPhamService sanPhamService;

    private final MauSacService mauSacService;

    private final KhuyenMaiService khuyenMaiService;

    public String incrementNumberInString(String str, int increment) {
        String numberString = str.replaceAll("[^0-9]", "");
        int number = Integer.parseInt(numberString);
        number += increment;
        String formattedNumber = String.format("%0" + numberString.length() + "d", number);
        String result = str.replace(numberString, formattedNumber);
        return result;
    }

    @Override
    public ChiTietSanPham getChiTietSanPham(Integer idChiTietSanPham) {
        ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.findById(idChiTietSanPham)
                .orElseThrow(() -> new IllegalArgumentException("Chi tiết sản phẩm không có id " + idChiTietSanPham + " này!"));
        return chiTietSanPham;
    }

    @Override
    public List<ChiTietSanPham> getChiTietSanPhamById(int idSanPham) {
        return chiTietSanPhamRepository.getChiTietSanPhamById(idSanPham);
    }

    @Override
    public List<ChiTietSanPham> getChiTietSanPhams() {
        List<ChiTietSanPham> chiTietSanPhams = chiTietSanPhamRepository.getListCtsp();
        return chiTietSanPhams;

    }



    @Override
    public ChiTietSanPham addChiTietSanPham(ChiTietSanPham chiTietSanPham) {
        ChiTietSanPham ctsp = new ChiTietSanPham();


        ctsp.setGiaBan(chiTietSanPham.getGiaBan());
        ctsp.setGiaNhap(chiTietSanPham.getGiaNhap());
        ctsp.setSoLuong(chiTietSanPham.getSoLuong());
        ctsp.setThoiGian(LocalDateTime.now());
        ctsp.setHinhAnh(chiTietSanPham.getHinhAnh());
        ctsp.setTrangThai(1);
        if (chiTietSanPham.getMauSac() == null) {
            ctsp.setMauSac(null);
        }
        ctsp.setMauSac(chiTietSanPham.getMauSac());
        if (chiTietSanPham.getSanPham() == null) {
            ctsp.setSanPham(null);
        }
        ctsp.setSanPham(chiTietSanPham.getSanPham());
        if (chiTietSanPham.getKhuyenMai() == null) {
            ctsp.setKhuyenMai(null);
        }
        ctsp.setKhuyenMai(chiTietSanPham.getKhuyenMai());

        chiTietSanPhamRepository.save(ctsp);
        ctsp.setMa(incrementNumberInString("CTSP000", ctsp.getId()));
        return chiTietSanPhamRepository.save(ctsp);
    }

    @Override
    public ChiTietSanPham editChiTietSanPham(Integer idChiTietSanPham, ChiTietSanPham chiTietSanPhamRequest) {
        ChiTietSanPham ctsp = getChiTietSanPham(idChiTietSanPham);
        ctsp.setMa(chiTietSanPhamRequest.getMa());
        ctsp.setGiaBan(chiTietSanPhamRequest.getGiaBan());
        ctsp.setGiaNhap(chiTietSanPhamRequest.getGiaNhap());
        ctsp.setSoLuong(chiTietSanPhamRequest.getSoLuong());
        ctsp.setThoiGian(chiTietSanPhamRequest.getThoiGian());
        ctsp.setHinhAnh(chiTietSanPhamRequest.getHinhAnh());
        ctsp.setTrangThai(chiTietSanPhamRequest.getTrangThai());
        if (ctsp.getMauSac() == null) {
            ctsp.setMauSac(null);
        }
        ctsp.setMauSac(ctsp.getMauSac());
        if (ctsp.getSanPham() == null) {
            ctsp.setSanPham(null);
        }
        ctsp.setSanPham(ctsp.getSanPham());
        if (ctsp.getKhuyenMai() == null) {
            ctsp.setKhuyenMai(null);
        }
        ctsp.setKhuyenMai(ctsp.getKhuyenMai());
        chiTietSanPhamRepository.save(ctsp);
        return chiTietSanPhamRepository.save(ctsp);
    }

    @Override
    public ChiTietSanPham deleteChiTietSanPham(Integer idChiTietSanPham) {
        ChiTietSanPham ctsp = getChiTietSanPham(idChiTietSanPham);
        ctsp.setTrangThai(0);
        chiTietSanPhamRepository.save(ctsp);
        return ctsp;
    }

    @Override
    public List<ChiTietSanPham> searchChiTietSanPhams(String tenMa) {
        return chiTietSanPhamRepository.listSearch(tenMa);
    }

    @Override
    public ChiTietSanPham searchByMaSanPham(String ma) {
        ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.searchSanPhamByMa(ma).orElse(null);
        return chiTietSanPham;
    }


    @Override
    public List<ChiTietSanPham> filterTaiQuay(String chatLieu, String thuongHieu, String mauSac, String doiTuongSuDung) {
        List<ChiTietSanPham> chiTietSanPhams = getChiTietSanPhams().stream()
                .filter(ctsp -> {
                    SanPham sanPham = ctsp.getSanPham();
                    MauSac mauSacObj = ctsp.getMauSac();
                    DoiTuongSuDung dtsd = sanPham.getDoiTuongSuDung();
                    ThuongHieu th = sanPham.getThuongHieu();

                    boolean tenChatLieu = chatLieu.isEmpty() || sanPham.getChatLieu().equals(chatLieu);
                    boolean tenMauSac = mauSac.isEmpty() || mauSac.equals(Objects.nonNull(mauSacObj) ? mauSacObj.getTenMauSac() : "");
                    boolean tenDoiTuong = doiTuongSuDung.isEmpty() || doiTuongSuDung.equals(Objects.nonNull(dtsd) ? dtsd.getTenDoiTuongSuDung() : "");
                    boolean tenThuongHieu = thuongHieu.isEmpty() || thuongHieu.equals(Objects.nonNull(th) ? th.getTen() : "");

                    return tenChatLieu && tenThuongHieu && tenMauSac && tenDoiTuong;
                })
                .collect(Collectors.toList());

        return chiTietSanPhams;
    }

    @Override
    public List<ChiTietSanPham> filterTaiQuay(String chatLieu, String mauSac, String doiTuongSuDung) {
        List<ChiTietSanPham> chiTietSanPhams = chiTietSanPhamRepository.getListCtspTaiQuay().stream()
                .filter(ctsp -> {
                    SanPham sanPham = ctsp.getSanPham();
                    MauSac mauSacObj = ctsp.getMauSac();
                    DoiTuongSuDung dtsd = sanPham.getDoiTuongSuDung();
                    ThuongHieu th = sanPham.getThuongHieu();

                    boolean tenChatLieu = chatLieu.isEmpty() || sanPham.getChatLieu().equals(chatLieu);
                    boolean tenMauSac = mauSac.isEmpty() || mauSac.equals(Objects.nonNull(mauSacObj) ? mauSacObj.getTenMauSac() : "");
                    boolean tenDoiTuong = doiTuongSuDung.isEmpty() || doiTuongSuDung.equals(Objects.nonNull(dtsd) ? dtsd.getTenDoiTuongSuDung() : "");

                    return tenChatLieu && tenMauSac && tenDoiTuong;
                })
                .collect(Collectors.toList());

        return chiTietSanPhams;
    }

    @Override
    public void updateSoLuongSanPham(int newSoLuong, int idCtSanPham) {
        chiTietSanPhamRepository.updateSoLuongSanPham(newSoLuong, idCtSanPham);
    }

    @Override
    public int getSoLuongSanPhamById(int idCtSanPham) {
        return chiTietSanPhamRepository.getSoLuongSanPhamById(idCtSanPham);
    }

    @Override
    public int soLuongMuaByChiTietSanPham(int idCtsp) {
        Integer soLuongMua = chiTietSanPhamRepository.soLuongMuaByChiTietSanPham(idCtsp);
        int soLuong = soLuongMua != null ? soLuongMua : 0;
        return soLuong;
    }

    @Override
    public int soLuongMuaBySanPham(int idSp) {
        Integer soLuongMua = chiTietSanPhamRepository.soLuongMuaBySanPham(idSp);
        int soLuong = soLuongMua != null ? soLuongMua : 0;
        return soLuong;
    }


}