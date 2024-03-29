package com.bags.sixdoBag.model.dto.response;

import com.bags.sixdoBag.model.entitys.ChiTietHoaDon;
import com.bags.sixdoBag.model.entitys.HoaDon;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DonHangOnlineResponse {
    private HoaDon hoaDon;

    private String urlHinhAnhMau;

    private List<ChiTietHoaDon> chiTietHoaDons;
}
