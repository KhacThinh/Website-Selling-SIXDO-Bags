package com.bags.sixdoBag.model.dto.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HoaDonResponse {
    private Integer id;

    private String maHd;

    private int trangThai;

}
