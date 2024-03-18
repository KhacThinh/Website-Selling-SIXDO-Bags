package com.bags.sixdoBag.model.entitys;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.*;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
@Table(name = "dia_chi_khach_hang")
public class DiaChiKhachHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotBlank(message = "Tên Không Được Để Khoảng Trắng")
    @NotEmpty(message = "Tên Không Được Để Trống")
    @Column(name = "ten_dia_chi")
    private String tenDiaChi;


    @Column(name = "trang_thai")
    private Boolean trangThai;

//    @NotBlank(message = "Mô Tả Không Được Để Khoảng Trắng")
//    @NotEmpty(message = "Mô Tả Không Được Để Trống")
    @Column(name = "mo_ta")
    private String moTa;

    @ManyToOne
    @JoinColumn(name = "id_khach_hang")
    private KhachHang khachHang;
}
