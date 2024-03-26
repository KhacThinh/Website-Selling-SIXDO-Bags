package com.bags.sixdoBag.model.dto.request;
import com.bags.sixdoBag.model.entitys.ChiTietHoaDon;
import com.bags.sixdoBag.model.entitys.HoaDon;
import com.bags.sixdoBag.model.entitys.KhachHang;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.List;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class OderDataDto {
    List<ChiTietHoaDon> cart;
    private HoaDon hoadon;
    private KhachHang khachHang;
}
