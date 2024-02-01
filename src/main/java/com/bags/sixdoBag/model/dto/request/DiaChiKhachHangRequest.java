package com.bags.sixdoBag.model.dto.request;

import lombok.Data;

@Data
public class DiaChiKhachHangRequest {
    private String tenDiaChi;

    private Integer idKhachHang;

    private String moTa;
}
