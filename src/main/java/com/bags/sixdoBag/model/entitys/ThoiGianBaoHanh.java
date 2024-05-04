package com.bags.sixdoBag.model.entitys;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;
import org.hibernate.validator.constraints.Length;

@Entity
@Table(name = "thoi_gian_bao_hanh")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ThoiGianBaoHanh {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ma")
//    @NotBlank(message = "Mã không được để khoảng trắng!")
//    @NotEmpty(message = "Mã không được để trống!")
//    @Length(max = 100, message = "Mã không được vượt quá 100 ký tự!")
    private String ma;

    @Column(name = "thoi_gian")
    @Positive(message = "Thời gian phải là số nguyên")
    @NotNull(message = "Thời gian không được để null")
    private Integer thoiGian;

    @Column(name = "trang_thai")
    private Boolean trangThai;
}
