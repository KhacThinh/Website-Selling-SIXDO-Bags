package com.bags.sixdoBag.model.entitys;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

@Entity
@Table(name = "slide_show")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class SlideShow {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @NotEmpty(message = "Tên không được để trống")
    @NotNull(message = "Tên không được để null")
    @NotBlank(message = "Tên Không được để khoảng trắng")
    @Length(max = 200, message = "Tên không được vượt quá 200 ký tự")
    @Column(name = "text_collection_title")
    private String textCollectionTitle;

    @Column(name = "text_new_arrivals")
    private String textNewArrivals;

    @Column(name = "url_hinh_anh")
    private String urlHinhAnh;

    @Column(name = "link_chuyen_trang")
    private String linkChuyenTrang;

    @Column(name = "trang_thai")
    private int trangThai;

}
