package com.bags.sixdoBag.model.dto.request;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class NhanVienRequest {
    private Integer idChucVu;

    private Integer idTaiKhoan;

    private Integer gioiTinh;


    private String maNhanVien;

    private String hoTen;

    private String ngaySinh;

    private String sdt;

    private String email;

    private String matKhau;

    private String queQuan;

    private String cccd;

    private LocalDateTime thoiGianVao;

    private LocalDateTime thoiGianRa;

}
