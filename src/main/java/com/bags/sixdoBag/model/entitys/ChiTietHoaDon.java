package com.bags.sixdoBag.model.entitys;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "chi_tiet_hoa_don")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class ChiTietHoaDon {
    @Id
    @Column(name = "id_hoa_don", nullable = false)
    private Integer idHoaDon;

    @Id
    @Column(name = "id_ctsp", nullable = false)
    private Integer idChiTietSanPham;

    @Column
    private Integer soLuong;

    @Column
    private Double gia;

    @ManyToOne
    @JoinColumn(name = "id_hoa_don", referencedColumnName = "id", insertable = false, updatable = false)
    private HoaDon hoaDon;

    @ManyToOne
    @JoinColumn(name = "id_ctsp",referencedColumnName = "id", insertable = false, updatable = false)
    private ChiTietSanPham chiTietSanPham;

}
