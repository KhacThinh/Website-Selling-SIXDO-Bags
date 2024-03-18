package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.DiaChiKhachHang;
import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.entitys.MaGiamGia;
import com.bags.sixdoBag.model.entitys.TaiKhoan;
import com.bags.sixdoBag.model.repository.KhachHangRepository;
import com.bags.sixdoBag.model.repository.TaiKhoanRepository;
import com.bags.sixdoBag.service.KhachHangService;
import com.bags.sixdoBag.service.TaiKhoanService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class KhachHangServiceImpl implements KhachHangService {
    public final KhachHangRepository khachHangRepository;

    public final TaiKhoanService taiKhoanService;
    public final TaiKhoanRepository taiKhoanRepository;

    @Override
    public KhachHang getKhachHang(Integer idKhachHang) {
        KhachHang khachHang = khachHangRepository.findById(idKhachHang).orElse(null);
        return khachHang;
    }

    @Override
    public List<KhachHang> getListKhachHang() {
        List<KhachHang> listKH = khachHangRepository.findKhachHangByAll();
        return listKH;
    }

    @Override
    public KhachHang addKhachHang(KhachHang khachHang) {
        KhachHang kh = new KhachHang();
        List<KhachHang> listKH = khachHangRepository.findAll();
        TaiKhoan taiKhoan = new TaiKhoan();
        taiKhoan.setTenDangNhap(khachHang.getEmail());
        taiKhoan.setMatKhau(khachHang.getMatKhau());
        taiKhoanRepository.save(taiKhoan);
        kh.setTaiKhoan(taiKhoan);
        int size = listKH.size() + 1;
        String maKH = "KH" + size;
        kh.setMaKhachHang(maKH);
        kh.setNgaySinh(khachHang.getNgaySinh());
        kh.setGioiTinh(khachHang.getGioiTinh());
        kh.setTenKhachHang(khachHang.getTenKhachHang());
        kh.setSdt(khachHang.getSdt());
        kh.setEmail(khachHang.getEmail());
        kh.setMatKhau(khachHang.getMatKhau());
        kh.setTrangThai(1);

        return khachHangRepository.save(kh);
    }




    @Override
    public KhachHang editKhachHang(Integer idKhachHang, KhachHang khachHang) {
        KhachHang kh = getKhachHang(idKhachHang);

        TaiKhoan taiKhoan = kh.getTaiKhoan();
        taiKhoan.setMatKhau(khachHang.getMatKhau());
        taiKhoanRepository.save(taiKhoan);
        kh.setTaiKhoan(taiKhoan);
        kh.setNgaySinh(khachHang.getNgaySinh());
        kh.setTenKhachHang(khachHang.getTenKhachHang());
        kh.setSdt(khachHang.getSdt());
        kh.setMatKhau(khachHang.getMatKhau());

        return kh;
    }

    @Override
    public KhachHang deleteKhachHang(Integer idKhachHang) {
        KhachHang khachHang = getKhachHang(idKhachHang);
        khachHang.setTrangThai(0);
        khachHangRepository.save(khachHang);
        return khachHang;
    }

    @Override
    public KhachHang searchKh(String email) {
        KhachHang  khachHang = khachHangRepository.searchKh(email);
        return khachHang;
    }

    @Override
    public KhachHang getidKhachHang(Integer idKhachHang) {
        KhachHang khachHang= khachHangRepository.findById(idKhachHang).orElse(null);
        return khachHang;
    }


    ////////////////////////////////////////////////////////
    @Override
    public Page<KhachHang> searchKhachHangTenOrMa(String tenMa, Pageable pageable) {
        return khachHangRepository.searchKhachHangTenOrMa(tenMa, pageable);
    }
    @Override
    public Page<KhachHang> searchcbb(Integer name, Pageable pageable) {
        return khachHangRepository.searchCbb(name,pageable);
    }

}
