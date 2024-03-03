package com.bags.sixdoBag.model.dto.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DanhMucRequest {
    private String maDanhMuc;

    private String tenDanhMuc;

    private String trangThai;
}
