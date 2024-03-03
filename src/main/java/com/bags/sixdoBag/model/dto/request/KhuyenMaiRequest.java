package com.bags.sixdoBag.model.dto.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KhuyenMaiRequest {
    private String maKhuyenMai;

    private String ten;

    private String giaTriGiam;

    private String ngayBatDau;

    private String ngayKetThuc;

    private String moTa;

    private String trangThai;
}
