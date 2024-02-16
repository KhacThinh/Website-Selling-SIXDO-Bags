package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.dto.request.NhanVienRequest;
import com.bags.sixdoBag.model.entitys.NhanVien;
import com.bags.sixdoBag.model.entitys.TaiKhoan;
import com.bags.sixdoBag.model.repository.NhanVienRepository;
import com.bags.sixdoBag.service.ChucVuService;
import com.bags.sixdoBag.service.NhanVienService;
import com.bags.sixdoBag.service.TaiKhoanService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class NhanVienServiceImpl implements NhanVienService {

    private final NhanVienRepository nhanVienRepository;

//    private final TaiKhoanService taiKhoanService;

    private final ChucVuService chucVuService;

    @Override
    public NhanVien getNhanVien(Integer idNhanVien) {
        NhanVien nhanVien = nhanVienRepository.findById(idNhanVien)
                .orElseThrow(() -> new IllegalArgumentException("Id Nhân viên không tồn tại!"));
        return nhanVien;
    }

    @Override
    public List<NhanVien> getNhanViens() {
        List<NhanVien> nhanViens = nhanVienRepository.findAll();
        return nhanViens;
    }

    @Override
    public NhanVien addNhanVien(NhanVienRequest nhanVien) {
        NhanVien nv = new NhanVien();
        nv.setMaNhanVien(nhanVien.getMaNhanVien());
        nv.setHoTen(nhanVien.getHoTen());
        nv.setNgaySinh(nhanVien.getNgaySinh());
        nv.setSdt(nhanVien.getSdt());
        nv.setEmail(nhanVien.getEmail());
        nv.setMatKhau(nhanVien.getMatKhau());
        nv.setQueQuan(nhanVien.getQueQuan());
        nv.setCccd(nhanVien.getCccd());
        nv.setThoiGianVao(nhanVien.getThoiGianVao());
        nv.setThoiGianRa(nhanVien.getThoiGianRa());
        nv.setTrangThai(1);

        Integer idChucVu = nhanVien.getIdChucVu();
        Optional.ofNullable(idChucVu)
                .ifPresent(idCV -> nv.setChucVu(chucVuService.getChucVu(idCV)));

        TaiKhoan taiKhoan = new TaiKhoan();
        taiKhoan.setTenDangNhap(nhanVien.getEmail());
        taiKhoan.setMatKhau(nhanVien.getMatKhau());
        taiKhoan.setQuyen("ADMIN");
        nv.setTaiKhoan(taiKhoan);
        return nhanVienRepository.save(nv);
    }

    @Override
    public NhanVien editNhanVien(Integer idNhanVien, NhanVienRequest nhanVien) {
        NhanVien nv = getNhanVien(idNhanVien);
        nv.setHoTen(nhanVien.getHoTen());
        nv.setNgaySinh(nhanVien.getNgaySinh());
        nv.setSdt(nhanVien.getSdt());
        nv.setMatKhau(nhanVien.getMatKhau());
        nv.setQueQuan(nhanVien.getQueQuan());
        nv.setCccd(nhanVien.getCccd());
        nv.setThoiGianVao(nhanVien.getThoiGianVao());
        nv.setThoiGianRa(nhanVien.getThoiGianRa());

        Integer idChucVu = nhanVien.getIdChucVu();
        if (Objects.isNull(idChucVu)) {
            nv.setChucVu(null);
        } else {
            nv.setChucVu(chucVuService.getChucVu(idChucVu));
        }

        TaiKhoan taiKhoan = nv.getTaiKhoan();
        taiKhoan.setMatKhau(nhanVien.getMatKhau());
        nv.setTaiKhoan(taiKhoan);
        return nhanVienRepository.save(nv);
    }

    @Override
    public NhanVien deleteNhanVien(Integer idNhanVien) {
        NhanVien nhanVien = getNhanVien(idNhanVien);
        nhanVien.setTrangThai(0);
        nhanVienRepository.save(nhanVien);
        return nhanVien;
    }
}
