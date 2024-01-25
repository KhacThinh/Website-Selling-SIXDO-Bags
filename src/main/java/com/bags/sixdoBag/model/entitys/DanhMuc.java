package com.bags.sixdoBag.model.entitys;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
@Table(name = "danh_muc")
public class DanhMuc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @NotBlank(message = "Mã Không Được Để Khoảng Trắng")
    @NotEmpty(message = "Mã Không Được Để Trống")
    @Max(value = 100,message = "Mã Không Vượt Quá 100 Ký Tự")
    @Column(name = "ma")
    private String maDanhMuc;

    @NotBlank(message = "Tên Không Được Để Khoảng Trắng")
    @NotEmpty(message = "Tên Không Được Để Trống")
    @Max(value = 300,message = "Tên Không Được Vượt Quá 300 Ký Tự")
    @Column(name = "ten")
    private String tenDanhMuc;


    @Column(name = "trang_thai")
    private Boolean trangThai;

}
