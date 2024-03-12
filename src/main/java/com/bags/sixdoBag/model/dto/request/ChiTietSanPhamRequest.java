package com.bags.sixdoBag.model.dto.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
@AllArgsConstructor
@NoArgsConstructor
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

    private Integer trangThai;
}
