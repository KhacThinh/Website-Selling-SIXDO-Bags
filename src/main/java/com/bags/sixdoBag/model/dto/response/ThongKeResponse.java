package com.bags.sixdoBag.model.dto.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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

    private Integer tongDoanhThu;

    private Integer tongSoTienLai;

}
