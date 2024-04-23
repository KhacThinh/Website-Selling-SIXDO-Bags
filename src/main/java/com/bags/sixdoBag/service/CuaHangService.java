package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.CuaHang;
import org.springframework.stereotype.Service;

@Service
public interface CuaHangService {
    public CuaHang getCuaHang();

    public CuaHang addEditCuaHang(CuaHang cuaHang);
}
