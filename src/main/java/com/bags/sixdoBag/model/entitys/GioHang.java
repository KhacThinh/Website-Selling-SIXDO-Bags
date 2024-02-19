package com.bags.sixdoBag.model.entitys;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "gio_hang")
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class GioHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_khach_hang")
    private KhachHang khachHang;

    @Column(name = "ngay_tao")
    private LocalDateTime ngayTao;

    @Column(name = "tong_tien")
    private Double tongTien;

    @Column(name = "trang_thai")
    private Integer trangThai;

    @OneToMany(mappedBy = "gioHang", fetch = FetchType.LAZY)
    private List<ChiTietGioHang> chiTietGioHangs = new ArrayList<>();

    public void addGioHangChiTiet(ChiTietGioHang chiTietGioHang) {
        chiTietGioHangs.add(chiTietGioHang);
    }

    public void removeGioHangChiTiet(ChiTietGioHang chiTietGioHang) {
        chiTietGioHangs.remove(chiTietGioHang);
    }


}