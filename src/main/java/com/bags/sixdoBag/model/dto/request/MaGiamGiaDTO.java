package com.bags.sixdoBag.model.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MaGiamGiaDTO {
    private int[] listId;
    private String maGiamGia;
    private String tenMaGiamGia;
    private double giaTriGiam;
    private String ngayBatDau;
    private String ngayKetThuc;
    private int soLuong;
    private int dieuKienGiam;
    private String moTa;
    private boolean trangThai;
}
