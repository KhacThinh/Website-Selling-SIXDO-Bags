package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.TaiKhoan;
import com.bags.sixdoBag.model.repository.TaiKhoanRepository;
import com.bags.sixdoBag.service.TaiKhoanService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TaiKhoanServiceImpl implements TaiKhoanService {

    private final TaiKhoanRepository taiKhoanRepository;

    @Override
    public TaiKhoan getTaiKhoan(Integer idTaiKhoan) {
        TaiKhoan taiKhoan = taiKhoanRepository.findById(idTaiKhoan)
                .orElseThrow(() -> new IllegalArgumentException("Id tài khoản này không tồn tại!"));
        return taiKhoan;
    }

    @Override
    public List<TaiKhoan> getTaiKhoans() {
        List<TaiKhoan> taiKhoans = taiKhoanRepository.findAll();
        return taiKhoans;
    }

    @Override
    public TaiKhoan addTaiKhoan(TaiKhoan taiKhoan) {
        TaiKhoan tk = new TaiKhoan();
        tk.setTenDangNhap(taiKhoan.getTenDangNhap());
        tk.setMatKhau(taiKhoan.getMatKhau());
        tk.setQuyen(taiKhoan.getQuyen());
        return taiKhoanRepository.save(tk);
    }

    @Override
    public TaiKhoan editTaiKhoan(Integer idTaiKhoan, TaiKhoan taiKhoan) {
        TaiKhoan tk = getTaiKhoan(idTaiKhoan);
        tk.setTenDangNhap(taiKhoan.getTenDangNhap());
        tk.setMatKhau(taiKhoan.getMatKhau());
        tk.setQuyen(taiKhoan.getQuyen());
        return taiKhoanRepository.save(tk);
    }

    @Override
    public TaiKhoan deleteTaiKhoan(Integer idTaiKhoan) {
        TaiKhoan taiKhoan = getTaiKhoan(idTaiKhoan);
        taiKhoanRepository.delete(taiKhoan);
        return taiKhoan;
    }

    @Override
    public List<TaiKhoan> pageTaiKhoan(int limit, int size) {
        List<TaiKhoan> taiKhoans = taiKhoanRepository.findByPageing(limit, size);
        return taiKhoans;
    }
}
