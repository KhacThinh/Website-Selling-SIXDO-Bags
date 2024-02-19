package com.bags.sixdoBag.model.entitys;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "chi_tiet_gio_hang")
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class ChiTietGioHang {
    @Id
    @Column(name = "id_gio_hang", nullable = false)
    private Integer idGioHang;

    @Id
    @Column(name = "id_ctsp", nullable = false)
    private Integer idChiTietSanPham;

    @Column
    private Double tongTien;

    @Column
    private Integer soLuong;

    @ManyToOne
    @JoinColumn(name = "id_ctsp", referencedColumnName = "id", insertable = false, updatable = false)
    private ChiTietSanPham chiTietSanPham;

    @ManyToOne
    @JoinColumn(name = "id_gio_hang", referencedColumnName = "id", insertable = false, updatable = false)
    private GioHang gioHang;
}
