package com.bags.sixdoBag.model.dto.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ThongKeResponse {

    private String tenSanPham;

    private String mauSac;

    private Integer giaBan;

    private Integer doanhThuTrenTungSanPham;

    private Integer soLuongDaBanTrenTungSanPham;

    private Integer soTienLaiTrenTungSanPham;

    private Integer tongSoLuongBan;

    private Long tongDoanhThu;

    private Integer tongSoTienLai;

    private String tenKh;

    private String sdtKh;

    private Integer tienMuaSam;

    private Date ngay;

    private String loaiBanHang;

    private int thang;

}
