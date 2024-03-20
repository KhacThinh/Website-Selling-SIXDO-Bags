package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.dto.request.ProductHomeRequest;
import com.bags.sixdoBag.model.dto.request.SanPhamRequest;
import com.bags.sixdoBag.model.entitys.*;
import com.bags.sixdoBag.model.repository.QueryJpa;
import com.bags.sixdoBag.model.repository.SanPhamRepository;
import com.bags.sixdoBag.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;

@Service
@RequiredArgsConstructor
public class SanPhamServiceImpl implements SanPhamService {

    private final SanPhamRepository sanPhamRepository;
    private final ThoiGianBaoHanhService thoiGianBaoHanhService;
    private final ThuongHieuService thuongHieuService;
    private final DanhMucService danhMucService;
    private final DoiTuongSuDungService doiTuongSuDungService;
    private QueryJpa queryJpa = new QueryJpa();

    @Override
    public SanPham getSanPham(Integer idSanPham) {
        SanPham sanPham = sanPhamRepository.findById(idSanPham).orElse(null);
        return sanPham;
    }

    @Override
    public List<SanPham> getSanPhams() {
        List<SanPham> sanPhams = sanPhamRepository.findSanPhamByAll();
        sanPhams.sort(Comparator.comparing(SanPham::getId).reversed());
        return sanPhams;
    }

    public String incrementNumberInString(String str, int increment) {
        String numberString = str.replaceAll("[^0-9]", "");
        int number = Integer.parseInt(numberString);
        number += increment;
        String formattedNumber = String.format("%0" + numberString.length() + "d", number);
        String result = str.replace(numberString, formattedNumber);
        return result;
    }

    @Override
    @Transactional
    public SanPham addSanPham(SanPhamRequest sanPhamRequest) {
        SanPham sanPham = new SanPham();
        sanPham.setMaSanPham("ma");
        SanPham sp = sanPhamRepository.save(sanPham);
        sp.setMaSanPham(incrementNumberInString("SP0000", sp.getId()));
        addEditSanPham(sanPhamRequest, sp);
        sp.setTrangThai(true);
        if (Objects.nonNull(sanPhamRequest.getIdThoiGianBaoHanh())) {
            sp.setThoiGianBaoHanh(thoiGianBaoHanhService.getThoiGianBaoHanh(sanPhamRequest.getIdThoiGianBaoHanh()));
        }
        if (Objects.nonNull(sanPhamRequest.getIdThuongHieu())) {
            sp.setThuongHieu(thuongHieuService.getidThuongHieu(sanPhamRequest.getIdThuongHieu()));
        }
        if (Objects.nonNull(sanPhamRequest.getIdDanhMuc())) {
            sp.setDanhMuc(danhMucService.getDanhMuc(sanPhamRequest.getIdDanhMuc()));
        }
        if (Objects.nonNull(sanPhamRequest.getIdDoiTuongSuDung())) {
            sp.setDoiTuongSuDung(doiTuongSuDungService.getDoiTuongSuDung(sanPhamRequest.getIdDoiTuongSuDung()));
        }
        return sp;
    }

    @Override
    public SanPham editSanPham(Integer idSanPham, SanPhamRequest sanPhamRequest) {
        SanPham sp = getSanPham(idSanPham);
        addEditSanPham(sanPhamRequest, sp);
        if (Objects.nonNull(sanPhamRequest.getIdThoiGianBaoHanh())) {
            sp.setThoiGianBaoHanh(thoiGianBaoHanhService.getThoiGianBaoHanh(sanPhamRequest.getIdThoiGianBaoHanh()));
        }
        if (Objects.nonNull(sanPhamRequest.getIdThuongHieu())) {
            sp.setThuongHieu(thuongHieuService.getidThuongHieu(sanPhamRequest.getIdThuongHieu()));
        }
        if (Objects.nonNull(sanPhamRequest.getIdDanhMuc())) {
            sp.setDanhMuc(danhMucService.getDanhMuc(sanPhamRequest.getIdDanhMuc()));
        }
        if (Objects.nonNull(sanPhamRequest.getIdDoiTuongSuDung())) {
            sp.setDoiTuongSuDung(doiTuongSuDungService.getDoiTuongSuDung(sanPhamRequest.getIdDoiTuongSuDung()));
        }
        return sanPhamRepository.save(sp);
    }

    private void addEditSanPham(SanPhamRequest sanPhamRequest, SanPham sp) {
        sp.setTenSanPham(sanPhamRequest.getTenSanPham());
        sp.setAnh(sanPhamRequest.getAnh());
        sp.setProductUrl(sanPhamRequest.getProductUrl());
        sp.setKichThuoc(sanPhamRequest.getKichThuoc());
        sp.setKhoiLuong(sanPhamRequest.getKhoiLuong());
        sp.setChatLieu(sanPhamRequest.getChatLieu());
        sp.setXuatXu(sanPhamRequest.getXuatXu());
        sp.setMoTa(sanPhamRequest.getMoTa());
    }

    @Override
    public SanPham deleteSanPham(Integer idSanPham) {
        SanPham sanPham = getSanPham(idSanPham);
        sanPham.setTrangThai(false);
        return sanPhamRepository.save(sanPham);
    }

    @Override
    public List<SanPham> searchSanPhamTenOrMa(String tenMa) {
        List<SanPham> sanPhams = sanPhamRepository.searchSanPhamTenOrMa(tenMa);
        return sanPhams;
    }

    @Override
    public List<SanPham> pageSanPham(int limit, int size) {
        List<SanPham> sanPhams = sanPhamRepository.findByPageing(limit, size);
        return sanPhams;
    }

    @Override
    public List<SanPham> searchKhoiLuong(int min, int max) {
        List<SanPham> sanPhams = sanPhamRepository.searchKhoiLuong(min, max);
        return sanPhams;
    }

    @Override
    public List<SanPham> searchChatLieu(String chatLieu) {
//        List<SanPham> sanPhams = sanPhamRepository.findSanPhamsByChatLieuContainingIgnoreCase(chatLieu);
//        return sanPhams;
        return null;
    }

    @Override
    public List<SanPham> searchKichThuoc(int min, int max) {
        return null;
    }

    @Override
    public List<SanPham> filterSanPhamChatLieuOrThuongHieu(String tenChatLieu, String tenThuongHieu) {
        return sanPhamRepository.filterSanPhamChatLieuOrThuongHieu(tenChatLieu, tenThuongHieu);
    }

    @Override
    public List<ProductHomeRequest> listHienThiSanPham() {
        return queryJpa.temp();
    }

    @Override
    public List<ProductHomeRequest> displayedByBrand(int idThuongHieu) {
        return queryJpa.displayedByBrand(idThuongHieu);

    }

    public List<ProductHomeRequest> searchSanPhamOnlines(String name) {

        return queryJpa.searchProductByName(name);
    }

    @Override
    public List<ProductHomeRequest> filterMaMauSacOrThuongHieuOnlineProductHome(String maMau, String tenThuongHieu) {
        List<ProductHomeRequest> productHomeRequestList = queryJpa.filterMauSacThuongHieuProductHome(maMau, tenThuongHieu);
        return productHomeRequestList;
    }
}
