package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.CuaHang;
import com.bags.sixdoBag.model.repository.CuaHangRepository;
import com.bags.sixdoBag.service.CuaHangService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
@RequiredArgsConstructor
public class CuaHangServiceImpl implements CuaHangService {

    private final CuaHangRepository cuaHangRepository;

    @Override
    public CuaHang getCuaHang() {
        CuaHang ch = cuaHangRepository.findById(1l).orElse(null);
        if (Objects.nonNull(ch)) {
            return ch;
        } else {
            ch = new CuaHang();
            ch.setId(1L);
            ch.setTenCuaHang("Abc");
            ch.setSdt("0123456789");
            ch.setEmail("store@gmail.com");
            ch.setHinhAnhLogo("abc.jpg");
            ch.setTenDayDuCuaHang("Cửa hàng Abc");
            ch.setToaDoMapX("21.027819");
            ch.setToaDoMapY("105.852257");
            ch.setDiaChi("Việt Nam");
            return cuaHangRepository.save(ch);
        }
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
