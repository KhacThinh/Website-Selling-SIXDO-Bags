package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.TaiKhoan;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TaiKhoanService {
    public TaiKhoan getTaiKhoan(Integer idTaiKhoan);

    public List<TaiKhoan> getTaiKhoans();

    public TaiKhoan addTaiKhoan(TaiKhoan taiKhoan);

    public TaiKhoan editTaiKhoan(Integer idTaiKhoan, TaiKhoan taiKhoan);

    public TaiKhoan deleteTaiKhoan(Integer idTaiKhoan);

    public List<TaiKhoan> pageTaiKhoan(int limit, int size);
}
