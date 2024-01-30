package com.bags.sixdoBag.model.dto.request;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class ChiTietSanPhamRequest {
    private String ma;

    private Integer soLuong;

    private Integer giaNhap;

    private Integer giaBan;

    private LocalDateTime thoiGian;

    private String hinhAnh;

    private Integer idSanPham;

    private Integer idMauSac;

    private Integer idKhuyenMai;
}
