package com.bags.sixdoBag.model.entitys;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "cua_hang")
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class CuaHang {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "ten_day_du_cua_hang")
    private String tenDayDuCuaHang;

    @Column(name = "ten_cua_hang")
    private String tenCuaHang;

    @Column(name = "dia_chi")
    private String diaChi;

    @Column(name = "hinh_anh_logo")
    private String hinhAnhLogo;

    @Column(name = "sdt")
    private String sdt;

    @Column(name = "email")
    private String email;

//    vĩ độ
    @Column(name = "toa_do_map_x")
    private String toaDoMapX;

//    kinh độ
    @Column(name = "toa_do_map_y")
    private String toaDoMapY;
}
