package com.bags.sixdoBag.model.entitys;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "chi_tiet_san_pham")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class ChiTietSanPham {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ma_ctsp")
    private String ma;

    @Column(name = "so_luong")
    private Integer soLuong;

    @Column(name = "gia_nhap")
    private Integer giaNhap;

    @Column(name = "gia_ban")
    private Integer giaBan;

    @Column(name = "thoi_gian")
    private LocalDateTime thoiGian;

    @Column(name = "anh_ctsp")
    private String hinhAnh;

    @ManyToOne
    @JoinColumn(name = "id_san_pham")
    private SanPham sanPham;

    @Column(name = "trang_thai")
    private Integer trangThai;

    @ManyToOne
    @JoinColumn(name = "id_mau_sac")
    private MauSac mauSac;

    @ManyToOne
    @JoinColumn(name = "id_khuyen_mai")
    private KhuyenMai khuyenMai;

    @OneToMany(mappedBy = "chiTietSanPham")
    List<HinhAnhCTSP>anhChiTietSanPhams;



}
