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
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

@Entity
@Table(name = "anh_slide_show")
@AllArgsConstructor
@NoArgsConstructor
@Data

@Builder
public class AnhSlideShow {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @NotBlank(message = "URL ảnh không được để khoảng trắng")
    @NotEmpty(message = "URL ảnh không được để trống")
    @Length(max = 200, message = "URL không được vượt quá 300 ký tự!")
    @Column(name = "url_anh")
    private String urlAnh;

    @NotBlank(message = "Link không được để khoảng trắng")
    @NotEmpty(message = "Link không được để trống")
    @Length(max = 300, message = "Link không được vượt quá 300 ký tự!")
    @Column(name = "link")
    private String linkAnhSlideShow;

    @ManyToOne
    @JoinColumn(name = "id_slide_show")
    private SlideShow slideShow;


}
