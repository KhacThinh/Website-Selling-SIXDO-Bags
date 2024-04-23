package com.bags.sixdoBag.model.entitys;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.*;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
@Table(name = "ma_giam_gia")
public class MaGiamGia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @NotBlank(message = "Mã Không Được Để Khoảng Trắng")
    @NotEmpty(message = "Mã Không Được Để Trống")
    @Length(max = 100, message = "Mã Không Vượt Quá 100 Ký Tự")
    @Column(name = "ma_giam_gia")
    private String maGiamGia;

    @NotBlank(message = "Tên Không Được Để Khoảng Trắng")
    @NotEmpty(message = "Tên Không Được Để Trống")
    @Length(max = 200, message = "Tên Không Được Vượt Quá 200 Ký Tự")
    @Column(name = "ten_ma_giam_gia")
    private String tenMaGiamGia;

    //    @Min(value = 0, message = "Giá Trị Giảm Không Được Nhỏ Hơn 0")
    @Column(name = "gia_tri_giam")
    private Double giaTriGiam;

    //    @Column(name = "ngay_bat_dau")
//    private LocalDateTime ngayBatDau;
    @Column(name = "ngay_bat_dau")
    private LocalDate ngayBatDau;

//    @Column(name = "ngay_ket_thuc")
//    private LocalDateTime ngayKetThuc;

    @Column(name = "ngay_ket_thuc")
    private LocalDate ngayKetThuc;

//    @NotBlank(message = "Mô Tả Không Được Để Khoảng Trắng")
//    @NotEmpty(message = "Mô Tả Không Được Để Trống")
    @Column(name = "mo_ta")
    private String moTa;

    @Min(value = 0, message = "Số Lượng Phải Lớn Hơn Hoặc = 0")
    @NotNull(message = "Số lượng không được bỏ trống")
    @Column(name = "so_luong")
    private Integer soLuong;


    //    @Min(value = 0, message = "Diều Kiện Giảm Phải Lớn Hơn Hoặc = 0")
//    @NotNull(message = "Diều Kiện không được bỏ trống")
    @Column(name = "dieu_kien")
    private Integer dieuKienGiam;


    @Column(name = "trang_thai")
    private Boolean trangThai;

}
