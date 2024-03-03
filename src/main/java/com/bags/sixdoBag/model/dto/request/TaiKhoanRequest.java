package com.bags.sixdoBag.model.dto.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TaiKhoanRequest {
    private String maThuongHieu;

    private String tenThuongHieu;

    private String trangThai;
}
