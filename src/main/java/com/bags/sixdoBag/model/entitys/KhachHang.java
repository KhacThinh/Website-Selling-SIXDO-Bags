package com.bags.sixdoBag.model.entitys;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "khach_hang")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class
KhachHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ma_khach_hang")
    private String maKhachHang;

    @Column(name = "ten_khach_hang")
    private String tenKhachHang;

    @Column(name = "gioi_tinh")
    private Integer gioiTinh;

    @Column(name = "ngay_sinh")
    private String ngaySinh;

    @Column(name = "sdt")
    private String sdt;

    @Column(name = "email" )
    private String email;

    @Column(name = "mat_khau")
    private String matKhau;

    @Column(name = "trang_thai")
    private Integer trangThai;

    @ManyToOne
    @JoinColumn(name = "id_tai_khoan")
    private TaiKhoan taiKhoan;
}
