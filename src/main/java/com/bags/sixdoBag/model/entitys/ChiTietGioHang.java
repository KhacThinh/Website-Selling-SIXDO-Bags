package com.bags.sixdoBag.model.entitys;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

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

@IdClass(GioHangChiTietId.class)
public class ChiTietGioHang {
    @Id
    @Column(name = "id_gio_hang", nullable = false)
    private Integer idGioHang;

    @Id
    @Column(name = "id_ctsp", nullable = false)
    private Integer idChiTietSanPham;

    @Column(name = "tong_tien")
    private Double tongTien;

    @Column(name = "so_luong")
    private Integer soLuong;

    @ManyToOne
    @JoinColumn(name = "id_ctsp", referencedColumnName = "id", insertable = false, updatable = false)
    private ChiTietSanPham chiTietSanPham;

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "id_gio_hang", referencedColumnName = "id", insertable = false, updatable = false)
    private GioHang gioHang;
}
