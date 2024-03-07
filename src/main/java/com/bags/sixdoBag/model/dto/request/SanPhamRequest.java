package com.bags.sixdoBag.model.dto.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SanPhamRequest {
    private String maSanPham;

    private String tenSanPham;

    private String anh;

    private String productUrl;

    private String kichThuoc;

    private Double khoiLuong;

    private String chatLieu;

    private String xuatXu;

    private String moTa;

    private Boolean trangThai;

    private Integer idThoiGianBaoHanh;

    private Integer idThuongHieu;

    private Integer idDanhMuc;

    private Integer idDoiTuongSuDung;
}
