package com.bags.sixdoBag.model.entitys;

import jakarta.persistence.*;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.*;
import org.hibernate.validator.constraints.Length;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "danh_muc")
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class DanhMuc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

//    @NotBlank(message = "Mã Không Được Để Khoảng Trắng")
//    @NotEmpty(message = "Mã Không Được Để Trống")
//    @Length(max = 100, message = "Mã Không Vượt Quá 100 Ký Tự")
    @Column(name = "ma")
    private String maDanhMuc;

    @NotBlank(message = "Tên Không Được Để Khoảng Trắng")
    @NotEmpty(message = "Tên Không Được Để Trống")
    @Length(max = 300, message = "Tên Không Được Vượt Quá 300 Ký Tự")
    @Column(name = "ten")
    private String tenDanhMuc;


    @Column(name = "trang_thai")
    private Boolean trangThai;

//    @OneToMany(mappedBy = "danhMuc")
//    private List<SanPham> sanPhams = new ArrayList<>();

}
