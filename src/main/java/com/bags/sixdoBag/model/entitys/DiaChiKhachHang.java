package com.bags.sixdoBag.model.entitys;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
@Table(name = "dia_chi_khach_hang")
public class DiaChiKhachHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_khach_hang")
    private Integer id;

    @NotBlank(message = "Tên Không Được Để Khoảng Trắng")
    @NotEmpty(message = "Tên Không Được Để Trống")
    @Column(name = "ten_dia_chi")
    private String tenDiaChi;


    @Column(name = "trang_thai")
    private Boolean trangThai;

    @NotBlank(message = "Mô Tả Không Được Để Khoảng Trắng")
    @NotEmpty(message = "Mô Tả Không Được Để Trống")
    @Column(name = "mo_ta")
    private String moTa;


}
