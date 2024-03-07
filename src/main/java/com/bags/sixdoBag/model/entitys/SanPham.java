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

@Entity
@Table(name = "san_pham")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class SanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ma_san_pham")
    private String maSanPham;

//    @NotEmpty(message = "Tên không được để trống")
//    @NotNull(message = "Tên không được để null")
//    @NotBlank(message = "Tên Không được để khoảng trắng")
//    @Length(max = 300, message = "Tên không được vượt quá 300 ký tự")
    @Column(name = "ten")
    private String tenSanPham;

//    @Length(max = 100, message = "Tên không được vượt quá 100 ký tự")
    @Column(name = "anh")
    private String anh;

//    @Length(max = 100, message = "Tên không được vượt quá 100 ký tự")
    @Column(name = "product_url")
    private String productUrl;

//    @Length(max = 200, message = "Tên không được vượt quá 200 ký tự")
    @Column(name = "kich_thuoc")
    private String kichThuoc;

//    @Min(value = 0, message = "Khối lượng không được nhỏ hơn 0")
    @Column(name = "khoi_luong")
    private Double khoiLuong;

//    @Length(max = 200, message = "Tên không được vượt quá 200 ký tự")
    @Column(name = "chat_lieu")
    private String chatLieu;

//    @Length(max = 100, message = "Tên không được vượt quá 100 ký tự")
    @Column(name = "xuat_xu")
    private String xuatXu;

    @Column(name = "mo_ta")
    private String moTa;

    @Column(name = "trang_thai")
    private Boolean trangThai;

    @ManyToOne
    @JoinColumn(name = "id_thoi_gian_bao_hanh")
    private ThoiGianBaoHanh thoiGianBaoHanh;

    @ManyToOne
    @JoinColumn(name = "id_thuong_hieu")
    private ThuongHieu thuongHieu;

    @ManyToOne
    @JoinColumn(name = "id_danh_muc")
    private DanhMuc danhMuc;

    @ManyToOne
    @JoinColumn(name = "id_doi_tuong_su_dung")
    private DoiTuongSuDung doiTuongSuDung;

}
