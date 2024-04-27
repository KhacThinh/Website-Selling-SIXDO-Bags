package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.entitys.TaiKhoan;
import com.bags.sixdoBag.model.repository.KhachHangRepository;
import com.bags.sixdoBag.model.repository.TaiKhoanRepository;
import com.bags.sixdoBag.service.KhachHangService;
import com.bags.sixdoBag.service.TaiKhoanService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

@Service
@RequiredArgsConstructor
@Transactional
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
    @Transactional
    public KhachHang addKhachHang(KhachHang khachHang) {
        KhachHang temp = new KhachHang();
        temp.setMaKhachHang("temp");
        KhachHang kh = khachHangRepository.save(temp);
        TaiKhoan taiKhoan = new TaiKhoan();
        taiKhoan.setTenDangNhap(khachHang.getEmail());
        taiKhoan.setMatKhau(khachHang.getMatKhau());
        taiKhoanRepository.save(taiKhoan);
        kh.setSdt(khachHang.getSdt());
        kh.setTaiKhoan(taiKhoan);
        String maKH = "KH0" + kh.getId();
        kh.setMaKhachHang(maKH);
        kh.setNgaySinh(khachHang.getNgaySinh());
        kh.setGioiTinh(khachHang.getGioiTinh());
        kh.setTenKhachHang(khachHang.getTenKhachHang());
        kh.setEmail(khachHang.getEmail());
        kh.setMatKhau(khachHang.getMatKhau());
        kh.setHinhAnh(khachHang.getHinhAnh());
        kh.setDiaChi(khachHang.getDiaChi());
        kh.setTrangThai(1);

        return khachHangRepository.save(kh);
    }


    @Override
    @Transactional
    public KhachHang editKhachHang(Integer idKhachHang, KhachHang khachHang) {
        KhachHang kh = getKhachHang(idKhachHang);

        TaiKhoan taiKhoan = kh.getTaiKhoan();
        taiKhoan.setMatKhau(khachHang.getMatKhau());
        taiKhoanRepository.save(taiKhoan);
        kh.setTaiKhoan(taiKhoan);
        kh.setNgaySinh(khachHang.getNgaySinh());
        kh.setTenKhachHang(khachHang.getTenKhachHang());
        kh.setGioiTinh(khachHang.getGioiTinh());
        kh.setSdt(khachHang.getSdt());
        kh.setMatKhau(khachHang.getMatKhau());
        kh.setHinhAnh(khachHang.getHinhAnh());
        kh.setDiaChi(khachHang.getDiaChi());

        return khachHangRepository.save(kh);
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
        KhachHang khachHang = khachHangRepository.searchKh(email);
        return khachHang;
    }

    @Override
    public KhachHang getidKhachHang(Integer idKhachHang) {
        KhachHang khachHang = khachHangRepository.findById(idKhachHang).orElse(null);
        return khachHang;
    }


    ////////////////////////////////////////////////////////
    @Override
    public Page<KhachHang> searchKhachHangTenOrMa(String tenMa, Pageable pageable) {
        return khachHangRepository.searchKhachHangTenOrMa(tenMa, pageable);
    }

    @Override
    public Page<KhachHang> searchcbb(Integer name, Pageable pageable) {
        return khachHangRepository.searchCbb(name, pageable);
    }

    @Override
    public KhachHang getKhachHangByUserNameAndPassword(String email, String matKhau) {
        return khachHangRepository.findByTenEndMatKhau(email, matKhau);
    }
    @Override
    public KhachHang getKhachHangByEmail(String email) {
        return khachHangRepository.getKhachHangByEmail(email);
    }

    @Override
    public KhachHang getKhachHangBySDT(String sdt) {
        return khachHangRepository.getKhachHangBySDT(sdt);
    }
    @Override
    @Transactional
    public KhachHang addKhachHang1(KhachHang khachHang) {
        KhachHang kh = khachHangRepository.save(new KhachHang());
        TaiKhoan taiKhoan = new TaiKhoan();
        taiKhoan.setTenDangNhap(khachHang.getEmail());
        taiKhoan.setMatKhau(khachHang.getMatKhau());
        taiKhoanRepository.save(taiKhoan);
        kh.setSdt(khachHang.getSdt());
        kh.setTaiKhoan(taiKhoan);
        kh.setMaKhachHang(khachHang.getMaKhachHang());
        kh.setNgaySinh(khachHang.getNgaySinh());
        kh.setGioiTinh(khachHang.getGioiTinh());
        kh.setTenKhachHang(khachHang.getTenKhachHang());
        kh.setEmail(khachHang.getEmail());
        kh.setMatKhau(khachHang.getMatKhau());
        kh.setHinhAnh(khachHang.getHinhAnh());
        kh.setDiaChi(khachHang.getDiaChi());
        kh.setTrangThai(1);

        return khachHangRepository.save(kh);
    }
}
