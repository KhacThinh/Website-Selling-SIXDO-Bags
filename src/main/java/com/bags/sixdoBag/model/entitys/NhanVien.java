package com.bags.sixdoBag.model.entitys;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "nhan_vien")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_chuc_vu")
    private ChucVu chucVu;

    @ManyToOne
    @JoinColumn(name = "id_tai_khoan")
    private TaiKhoan taiKhoan;

    @Column
    private String maNhanVien;

    @Column
    private String hoTen;

    @Column
    private LocalDateTime ngaySinh;

    @Column
    private String sdt;

    @Column
    private String email;

    @Column
    private String matKhau;

    @Column
    private String queQuan;

    @Column
    private String cccd;

    @Column
    private LocalDateTime thoiGianVao;

    @Column
    private LocalDateTime thoiGianRa;

    @Column
    private Integer trangThai;

}