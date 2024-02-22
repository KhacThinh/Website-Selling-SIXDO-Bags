package com.bags.sixdoBag.model.dto.request;

import lombok.Data;

@Data
public class GioHangRequest {
    private Integer idKhachHang;

    private ChiTietGioHangRequestDto chiTietGioHangRequestDto;
}
