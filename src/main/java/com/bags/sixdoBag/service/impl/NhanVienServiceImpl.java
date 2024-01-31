package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.NhanVien;
import com.bags.sixdoBag.model.repository.NhanVienRepository;
import com.bags.sixdoBag.service.NhanVienService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NhanVienServiceImpl implements NhanVienService {

    private final NhanVienRepository nhanVienRepository;

    @Override
    public NhanVien getNhanVien(Integer idNhanVien) {
        NhanVien nhanVien = nhanVienRepository.findById(idNhanVien)
                .orElseThrow(() -> new IllegalArgumentException("Id Nhân viên không tồn tại!"));
        return nhanVien;
    }

    @Override
    public List<NhanVien> getNhanViens() {
        List<NhanVien> nhanViens = nhanVienRepository.findNhanVienByAll();
        return nhanViens;
    }

    @Override
    public NhanVien addNhanVien(NhanVien nhanVien) {
        NhanVien nv = new NhanVien();
        nv.setMaNhanVien(nhanVien.getMaNhanVien().trim());
        nv.setHoTen(nhanVien.getHoTen().trim());
        nv.setNgaySinh(nhanVien.getNgaySinh());
        nv.setSdt(nhanVien.getSdt().trim());
        nv.setEmail(nhanVien.getEmail().trim());
        nv.setMatKhau(nhanVien.getMatKhau().trim());
        nv.setQueQuan(nhanVien.getQueQuan().trim());
        nv.setCccd(nhanVien.getCccd().trim());
        nv.setThoiGianVao(nhanVien.getThoiGianVao());
        nv.setThoiGianRa(nhanVien.getThoiGianRa());
        nv.setTrangThai(1);
        return null;
    }

    @Override
    public NhanVien editNhanVien(Integer idNhanVien, NhanVien nhanVien) {
        return null;
    }

    @Override
    public NhanVien deleteNhanVien(Integer idNhanVien) {
        return null;
    }
}
