package com.bags.sixdoBag.model.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ProductHomeRequest {
    private int id;

    private String tenSanPham;

    private float giaBan;

    private String hinhAnh;

    private int soLuongBan;

    public ProductHomeRequest(int id, String tenSanPham, float giaBan, String hinhAnh) {
        this.id = id;
        this.tenSanPham = tenSanPham;
        this.giaBan = giaBan;
        this.hinhAnh = hinhAnh;
    }
}
