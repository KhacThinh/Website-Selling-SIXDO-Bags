package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.dto.response.ProductHomeResponse;
import com.bags.sixdoBag.model.dto.request.SanPhamRequest;
import com.bags.sixdoBag.model.entitys.*;
import com.bags.sixdoBag.model.repository.ChiTietSanPhamRepository;
import com.bags.sixdoBag.model.repository.QueryJpa;
import com.bags.sixdoBag.model.repository.SanPhamRepository;
import com.bags.sixdoBag.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SanPhamServiceImpl implements SanPhamService {

    private final SanPhamRepository sanPhamRepository;
    private final ThoiGianBaoHanhService thoiGianBaoHanhService;
    private final ThuongHieuService thuongHieuService;
    private final DanhMucService danhMucService;
    private final DoiTuongSuDungService doiTuongSuDungService;
    private QueryJpa queryJpa = new QueryJpa();
    private final ChiTietSanPhamRepository chiTietSanPhamRepository;

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
        sp.setTrangThai(true);
        return sp;
    }

    @Override
    public SanPham editSanPham(Integer idSanPham, SanPhamRequest sanPhamRequest) {
        List<ChiTietSanPham> listCTSP = chiTietSanPhamRepository.getChiTietSanPhamById(idSanPham);
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
        sp.setTrangThai(sanPhamRequest.getTrangThai());
        if (!sp.getTrangThai()) {
            for (ChiTietSanPham chiTietSanPham : listCTSP) {
                ChiTietSanPham chiTietSanPham1 = chiTietSanPham;
                chiTietSanPham1.setTrangThai(0);
            }
        } else {
            for (ChiTietSanPham chiTietSanPham : listCTSP) {
                ChiTietSanPham chiTietSanPham1 = chiTietSanPham;
                if (chiTietSanPham1.getSoLuong() < 0) {
                    chiTietSanPham1.setTrangThai(2);
                } else {
                    chiTietSanPham1.setTrangThai(1);
                }
            }
        }
        return sanPhamRepository.save(sp);
    }

    @Override
    public List<SanPham> getSoLuongThongKe() {
        return sanPhamRepository.getSoLuongThongKe();
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
    public List<SanPham> filterSanPhamChatLieuOrThuongHieu(String tenChatLieu, String tenThuongHieu, boolean trangThai) {
        return sanPhamRepository.filterSanPhamChatLieuOrThuongHieu(tenChatLieu, tenThuongHieu, trangThai);
    }

    @Override
    public List<ProductHomeResponse> listHienThiSanPham() {
        return queryJpa.temp();
    }

    @Override
    public List<ProductHomeResponse> listHienThiSanPhamLimit(int limit) {
        return queryJpa.tempLimit(limit);
    }

    @Override
    public List<ProductHomeResponse> displayedByBrand(int idSp, int idThuongHieu) {
        return queryJpa.displayedByBrand(idSp, idThuongHieu);

    }

    @Override
    public List<ProductHomeResponse> sanPhamCoGiaTienTuongTu(int idSp, int min, int max) {
        return queryJpa.sanPhamCoGiaTienTuongTu(idSp, min, max);
    }

    @Override
    public List<ProductHomeResponse> sanPhamCoDanhMucTuongTu(int idSP, int idDanhMuc) {
        return queryJpa.sanPhamCoDanhMucTuongTu(idSP, idDanhMuc);
    }

    public List<ProductHomeResponse> searchSanPhamOnlines(String name) {
        return queryJpa.searchProductByName(name);
    }

    @Override
    public boolean findByNameSanPham(String name) {
        SanPham sanPham = sanPhamRepository.findSanPhamByAll()
                .stream()
                .filter(sp -> sp.getTenSanPham().equalsIgnoreCase(name))
                .findFirst()
                .orElse(null);
        return sanPham != null;
    }

    @Override
    public boolean findByNameSanPhamSua(String name, int idSp) {
        SanPham sanPham = getSanPham(idSp);
        if (sanPham != null && name.equalsIgnoreCase(sanPham.getTenSanPham())) {
            return false;
        }

        List<String> danhSachTen = sanPhamRepository.findSanPhamByAll().stream()
                .map(SanPham::getTenSanPham)
                .collect(Collectors.toList());

        for (String ten : danhSachTen) {
            if (ten.equalsIgnoreCase(name)) {
                return true;
            }
        }

        return false;
    }


    @Override
    public List<ProductHomeResponse> filterMaMauSacOrThuongHieuOnlineProductHome(String maMau, String tenThuongHieu) {
        List<ProductHomeResponse> productHomeRequestList = queryJpa.filterMauSacThuongHieuProductHome(maMau, tenThuongHieu);
        return productHomeRequestList;
    }


}
