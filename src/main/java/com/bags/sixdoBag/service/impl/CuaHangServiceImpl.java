package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.CuaHang;
import com.bags.sixdoBag.model.repository.CuaHangRepository;
import com.bags.sixdoBag.service.CuaHangService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CuaHangServiceImpl implements CuaHangService {

    private final CuaHangRepository cuaHangRepository;

    @Override
    public CuaHang getCuaHang() {
        CuaHang cuaHang = cuaHangRepository.findById(1l).get();
        return cuaHang;
    }

    @Override
    public CuaHang addEditCuaHang(CuaHang cuaHang) {
        CuaHang ch = cuaHangRepository.findById(1l).orElse(new CuaHang());
        ch.setId(1L);
        ch.setTenCuaHang(cuaHang.getTenCuaHang());
        ch.setSdt(cuaHang.getSdt());
        ch.setEmail(cuaHang.getEmail());
        ch.setHinhAnhLogo(cuaHang.getHinhAnhLogo());
        ch.setTenDayDuCuaHang(cuaHang.getTenDayDuCuaHang());
        ch.setToaDoMapX(cuaHang.getToaDoMapX());
        ch.setToaDoMapY(cuaHang.getToaDoMapY());
        ch.setDiaChi(cuaHang.getDiaChi());
        return cuaHangRepository.save(ch);
    }
}
