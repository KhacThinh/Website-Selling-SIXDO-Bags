package com.bags.sixdoBag.model.dto.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AnhChiTietSanPhamRequest {

    private Integer idAnh;

    private Integer idCTSP;

    private String url;
}
