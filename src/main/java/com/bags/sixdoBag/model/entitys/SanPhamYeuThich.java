package com.bags.sixdoBag.model.entitys;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "san_pham_yeu_thich")
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class SanPhamYeuThich {
//    @Id
//    @Column(name="id_san_pham", nullable=false)
//    private Integer idSanPham;
//
//    @Id
//    @Column(name="id_khach_hang", nullable=false)
//    private Integer idKhachHang;
    @EmbeddedId
    private SanPhamYeuThichID id;

    @Column(name="trang_thai", nullable=false)
    private int trangThai;

    @ManyToOne
    @JoinColumn(name="id_san_pham", referencedColumnName="id", insertable = false, updatable = false)
    private SanPham sanPham;

    @ManyToOne
    @JoinColumn(name="id_khach_hang", referencedColumnName="id", insertable = false, updatable = false)
    private KhachHang khachHang;

}