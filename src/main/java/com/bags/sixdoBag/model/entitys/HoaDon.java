package com.bags.sixdoBag.model.entitys;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "hoa_don")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_khach_hang")
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "id_nhan_vien")
    private NhanVien nhanVien;

    @ManyToOne
    @JoinColumn(name = "id_ma_giam_gia")
    private MaGiamGia maGiamGia;

    @Column
    private Double tongTien;

    @Column
    private LocalDateTime thoiGianTao;

    @Column
    private LocalDateTime thoiGianXacNhan;

    @Column
    private LocalDateTime thoiGianGiaoHang;

    @Column
    private LocalDateTime thoiGianThanhToan;

    @Column
    private Integer trangThai;

    @Column
    private String tenNguoiNhan;

    @Column
    private String emailNguoiNhan;

    @Column
    private String sdtNguoiNhan;

    @Column
    private String diaChiNguoiNhan;
}
