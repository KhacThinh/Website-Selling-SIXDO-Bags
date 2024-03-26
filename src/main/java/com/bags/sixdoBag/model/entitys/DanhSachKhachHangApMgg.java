package com.bags.sixdoBag.model.entitys;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter

public class DanhSachKhachHangApMgg {

    @Column(name = "id_khach_hang")
    private Integer idKhachHang;

    @Column(name = "id_ma_giam_gia")
    private Integer idMaGiamGia;
}
