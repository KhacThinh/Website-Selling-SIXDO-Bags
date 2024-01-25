package com.bags.sixdoBag.model.entitys;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "thuong_hieu")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ThuongHieu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @NotBlank(message = "Mã không được để khoảng trắng")
    @NotEmpty(message = "Mã không được để trống")
    @Max(value = 100, message = "Mã không được vượt quá 100 ký tự!")
    @Column(name = "ma")
    private String ma;

    @NotBlank(message = "Mã không được để khoảng trắng")
    @NotEmpty(message = "Mã không được để trống")
    @Max(value = 300, message = "Mã không được vượt quá 300 ký tự!")
    @Column(name = "ten")
    private String ten;

    @Column(name = "trang_thai")
    private Boolean trangThai;
}
