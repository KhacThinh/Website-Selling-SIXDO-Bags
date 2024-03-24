package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.dto.request.GioHangRequest;
import com.bags.sixdoBag.model.entitys.GioHang;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface GioHangService {
    public GioHang getGioHang(Integer idGioHang);

    public List<GioHang> getGioHangs();

    public GioHang addGioHang(GioHangRequest gioHangRequest);

    public GioHang addGioHangTaiQuay(GioHangRequest gioHangRequest, int moi);

    public GioHang editGioHang(Integer idGioHang, GioHangRequest gioHangRequest);

    public GioHang deleteGioHang(Integer idGioHang);
    public int getIdGioHang(int idKhachHang);
}
