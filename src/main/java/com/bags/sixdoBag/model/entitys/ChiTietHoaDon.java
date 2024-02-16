package com.bags.sixdoBag.model.entitys;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@IdClass(HoaDonChiTietId.class)
@Table(name = "chi_tiet_hoa_don")
public class ChiTietHoaDon implements Serializable {
    @Id
    @Column(name = "id_hoa_don", nullable = false)
    private Integer idHoaDon;

    @Id
    @Column(name = "id_ctsp", nullable = false)
    private Integer idCtSanPham;

    @Column(name = "so_luong", nullable = false)
    private Integer soLuong;

    @Column(name = "gia", nullable = false)
    private Double gia;

    @ManyToOne
    @JoinColumn(name = "id_hoa_don", referencedColumnName = "id", insertable = false, updatable = false)
    private HoaDon hoaDon;

    @ManyToOne
    @JoinColumn(name = "id_ctsp",referencedColumnName = "id", insertable = false, updatable = false)
    private ChiTietSanPham chiTietSanPham;

}
