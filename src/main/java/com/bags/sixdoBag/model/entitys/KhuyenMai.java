package com.bags.sixdoBag.model.entitys;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import java.time.LocalDateTime;

@Entity
@Table(name = "khuyen_mai")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class KhuyenMai {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @NotEmpty(message = "Mã không được để trống")
    @NotNull(message = "Mã không được để null")
    @NotBlank(message = "Mã Không được để khoảng trắng")
    @Length(max = 100, message = "Mã không được vượt quá 100 ký tự")
    @Column(name = "ma_khuyen_mai")
    private String maKhuyenMai;

    @NotEmpty(message = "Tên không được để trống")
    @NotNull(message = "Tên không được để null")
    @NotBlank(message = "Tên Không được để khoảng trắng")
    @Length(max = 200, message = "Tên không được vượt quá 200 ký tự")
    @Column(name = "ten")
    private String ten;

    @Column(name = "gia_tri_giam")
    @Min(value = 0, message = "Giá trị giảm không được nhỏ hơn 0")
    private Double giaTriGiam;

    @Column(name = "ngay_bat_dau")
    private LocalDateTime ngayBatDau;

    @Column(name = "ngay_ket_thuc")
    private LocalDateTime ngayKetThuc;

    @Column(name = "mo_ta")
    private String moTa;

    @Column(name = "trang_thai")
    private Boolean trangThai;
}
